import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/view/base_view_model.dart';

typedef OnStateChanged<VM, S> = void Function(
  WidgetRef ref,
  VM viewModel,
  S state,
  S? oldState,
)?;

class BaseView<VM extends BaseViewModel<S>, S> extends ConsumerStatefulWidget {
  const BaseView({
    super.key,
    this.provider,
    required this.viewModel,
    required this.state,
    required this.builder,
    this.initState,
    this.buildWhen,
    this.onStateChanged,
  });

  /// State of ViewModel
  final BuildState<S> state;

  /// ViewModel
  final VM Function(BuildState<S> buildState) viewModel;

  /// Provider
  final void Function(AutoDisposeNotifierProvider<VM, S> provider)? provider;

  /// [StatefulWidget] initState
  final void Function(WidgetRef ref, VM viewModel)? initState;

  /// Event handling functions based on state changes (e.g. page navigation)
  final OnStateChanged<VM, S> onStateChanged;

  /// When true returns, execute the builder function to update the widget
  final bool Function(S oldState, S currentState)? buildWhen;

  /// Child widget builder that updates on state change in ViewModel.
  final Widget Function(WidgetRef ref, VM viewModel, S state) builder;

  @override
  ConsumerState<BaseView<VM, S>> createState() => _BaseViewState<VM, S>();
}

class _BaseViewState<VM extends BaseViewModel<S>, S>
    extends ConsumerState<BaseView<VM, S>> {
  late AutoDisposeNotifierProvider<VM, S> provider;
  late VM viewModel;
  ProviderSubscription? providerSubs;

  /// Previous child widget
  Widget? previousChild;

  @override
  void initState() {
    super.initState();
    init();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.initState?.call(ref, viewModel);
    });
  }

  @override
  void didUpdateWidget(BaseView<VM, S> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewModel.runtimeType != widget.viewModel.runtimeType) {
      /// ViewModel changed
      viewModel.dispose();
      init();
    }
  }

  @override
  void dispose() {
    providerSubs?.close();
    viewModel.dispose();
    super.dispose();
  }

  void init() {
    viewModel = widget.viewModel.call((state, prevState) {
      /// Solution for issue where ref.watch is called even when widget is removed
      try {
        return widget.state(state, prevState);
      } catch (e) {
        return prevState as S;
      }
    });
    provider = NotifierProvider.autoDispose<VM, S>(
      () => viewModel,
    );
    widget.provider?.call(provider);
    providerSubs = ref.listenManual(
      provider,
      (oldState, nextState) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          widget.onStateChanged?.call(ref, viewModel, nextState, oldState);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(provider);
    final viewModel = ref.read(provider.notifier);
    return widget.builder(ref, viewModel, state);
  }
}

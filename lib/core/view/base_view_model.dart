import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef BuildState<S> = S Function(
  AutoDisposeNotifierProviderRef<S> ref,
  S? prevState,
);

abstract class BaseViewModel<S> extends AutoDisposeNotifier<S> {
  BaseViewModel(
    BuildState<S> buildState,
  ) : _buildState = buildState;

  final BuildState<S> _buildState;
  S? _prevState;
  S? get prevState => _prevState;

  @override
  S get state => super.state;

  @override
  @protected
  set state(S value) {
    _prevState = super.state;
    super.state = value;
  }

  @protected
  @override
  S build() {
    final newState = _buildState(ref, _prevState);
    _prevState = newState;
    return newState;
  }

  void dispose() {}
}

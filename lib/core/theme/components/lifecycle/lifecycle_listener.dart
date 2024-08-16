import 'package:flutter/material.dart';

class LifecycleListener extends StatefulWidget {
  const LifecycleListener({
    super.key,
    required this.child,
    required this.listen,
  });

  final Widget child;
  final void Function(AppLifecycleState state) listen;

  @override
  State<LifecycleListener> createState() => _LifecycleListenerState();
}

class _LifecycleListenerState extends State<LifecycleListener>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    widget.listen(state);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

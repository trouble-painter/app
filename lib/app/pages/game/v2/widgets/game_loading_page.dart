import 'package:flutter/material.dart';

class GameLoadingPage extends StatelessWidget {
  const GameLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

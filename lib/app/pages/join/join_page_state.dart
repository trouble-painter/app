import 'package:flutter/material.dart';

class JoinPageState {
  final bool isBusy;
  final int invitationCodeLength;
  final FocusNode focusNode;
  final TextEditingController controller;

  String get roomId => controller.text;

  JoinPageState({
    required this.controller,
    required this.invitationCodeLength,
    bool? isBusy,
  })  : isBusy = isBusy ?? false,
        focusNode = FocusNode();

  JoinPageState copyWith({
    bool? isBusy,
  }) {
    return JoinPageState(
      isBusy: isBusy ?? this.isBusy,
      invitationCodeLength: invitationCodeLength,
      controller: controller,
    );
  }
}

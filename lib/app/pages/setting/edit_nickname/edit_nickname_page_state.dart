import 'package:flutter/material.dart';

class EditNicknamePageState {
  final String nickname;
  final bool showHint;
  final bool isSubmitButtonDiabled;
  final bool isComplete;
  final TextEditingController controller;

  EditNicknamePageState({
    required this.nickname,
    required this.controller,
    this.showHint = false,
    this.isSubmitButtonDiabled = false,
    this.isComplete = false,
  });

  bool get isNicknameEmpty => controller.text.trim().isEmpty;

  EditNicknamePageState copyWith({
    String? nickname,
    bool? showHint,
    bool? isSubmitButtonDiabled,
    bool? isComplete,
    TextEditingController? controller,
  }) {
    return EditNicknamePageState(
      nickname: nickname ?? this.nickname,
      showHint: showHint ?? this.showHint,
      isSubmitButtonDiabled:
          isSubmitButtonDiabled ?? this.isSubmitButtonDiabled,
      isComplete: isComplete ?? this.isComplete,
      controller: controller ?? this.controller,
    );
  }
}

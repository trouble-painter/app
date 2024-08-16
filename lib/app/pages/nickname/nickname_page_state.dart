import 'package:flutter/material.dart';

class NicknamePageState {
  final String nickname;
  final int nicknameMax;
  final bool isBusy;
  final bool isShowHint;
  final bool isSubmitted;
  final FocusNode focusNode;
  final TextEditingController controller;

  const NicknamePageState({
    required this.nickname,
    required this.controller,
    required this.nicknameMax,
    required this.focusNode,
    this.isBusy = false,
    this.isSubmitted = false,
    this.isShowHint = true,
  });

  NicknamePageState copyWith({
    String? nickname,
    int? nicknameMax,
    bool? isBusy,
    bool? isShowHint,
    bool? isSubmitted,
    FocusNode? focusNode,
    TextEditingController? controller,
  }) {
    return NicknamePageState(
      nickname: nickname ?? this.nickname,
      nicknameMax: nicknameMax ?? this.nicknameMax,
      isBusy: isBusy ?? this.isBusy,
      isShowHint: isShowHint ?? this.isShowHint,
      isSubmitted: isSubmitted ?? this.isSubmitted,
      focusNode: focusNode ?? this.focusNode,
      controller: controller ?? this.controller,
    );
  }
}

import 'package:flutter/material.dart';

sealed class JoinQrPageState {}

class JoinQrPageInitState extends JoinQrPageState {}

class JoinQrPageGrantedState extends JoinQrPageState {
  final bool isBusy;
  final bool isUiTestMode;
  final bool isQrCodeFound;
  final double focusPaddingBottom = 42;
  final double dimension = 240;
  final List<Offset> corners;

  JoinQrPageGrantedState({
    required this.isBusy,
    required this.isQrCodeFound,
    required this.isUiTestMode,
    this.corners = const [],
  });
  JoinQrPageGrantedState copyWith({
    bool? isBusy,
    bool? isUiTestMode,
    bool? isQrCodeFound,
    List<Offset>? corners,
  }) {
    return JoinQrPageGrantedState(
      isBusy: isBusy ?? this.isBusy,
      isQrCodeFound: isQrCodeFound ?? this.isQrCodeFound,
      isUiTestMode: isUiTestMode ?? this.isUiTestMode,
      corners: corners ?? this.corners,
    );
  }
}

class JoinQrPageDeniedState extends JoinQrPageState {}

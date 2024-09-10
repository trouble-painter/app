part of '../../app_event.dart';

sealed class JoinBottomSheetEvent extends AppEvent {
  const JoinBottomSheetEvent() : super(AppEventScreen.joinBottomSheet);
}

/// Qr click
class JoinBottomSheetQrClickEvent extends JoinBottomSheetEvent {}

/// Direct input click
class JoinBottomSheetDirectInputClickEvent extends JoinBottomSheetEvent {}

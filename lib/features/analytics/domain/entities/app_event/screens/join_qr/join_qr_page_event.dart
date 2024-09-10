part of '../../app_event.dart';

sealed class JoinQrPageEvent extends AppEvent {
  const JoinQrPageEvent() : super(AppEventScreen.joinBottomSheet);
}

/// Join room
class JoinQrPageJoinRoomEvent extends JoinQrPageEvent {}

/// Camera permission denied
class JoinQrPageCameraPermissionDeniedEvent extends JoinQrPageEvent {}

/// Camera permission granted
class JoinQrPageCameraPermissionGrantedEvent extends JoinQrPageEvent {}

/// Go to join page click
class JoinQrPageGoToJoinPageClickEvent extends JoinQrPageEvent {}

/// Go to setting click
class JoinQrPageGoToSettingClickEvent extends JoinQrPageEvent {}

/// Back click
class JoinQrPageBackClickEvent extends JoinQrPageEvent {}

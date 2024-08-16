part of '../x_game_res.dart';

enum XGameExceptionCode {
  /// Authentication failed
  unauthenticated('auth401'),

  /// No room
  noRoom('c003'),

  /// The room is full
  mxRoom('c004'),

  /// It is not the requester's turn
  notMyTurn('c006'),

  /// There is a game room in progress
  ongoingGame('c007'),

  /// Unhandled error
  error('c001'),
  ;

  const XGameExceptionCode(this.code);
  final String code;

  factory XGameExceptionCode.fromXGameRaw(XGameRaw raw) {
    for (final exception in values) {
      if (exception.code == raw.data['code']) return exception;
    }
    return error;
  }

  GameException toEntity() => switch (this) {
        XGameExceptionCode.unauthenticated => GameException.accessTokenExpired,
        XGameExceptionCode.noRoom => GameException.noRoom,
        XGameExceptionCode.mxRoom => GameException.maxRoom,
        XGameExceptionCode.notMyTurn => GameException.notMyTurn,
        XGameExceptionCode.ongoingGame => GameException.ongoingGame,
        XGameExceptionCode.error => GameException.error,
      };
}

class XGameException extends XGameRes {
  final XGameExceptionCode code;
  final XGameReqAction action;
  final String title;
  final String description;

  XGameException({
    required this.code,
    required this.action,
    required this.title,
    required this.description,
  });

  factory XGameException.fromXGameRaw(XGameRaw raw) {
    return XGameException(
      action: XGameReqAction.fromXGameRaw(raw),
      code: XGameExceptionCode.fromXGameRaw(raw),
      title: raw.data['title'] ?? '',
      description: raw.data['description'] ?? '',
    );
  }
  @override
  String toString() {
    return 'XGameException(code: $code, action: $action, title: $title, description: $description)';
  }
}

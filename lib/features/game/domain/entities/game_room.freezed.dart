// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameRoom {
  String get roomId;
  List<GameUser> get users;

  /// Create a copy of GameRoom
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GameRoomCopyWith<GameRoom> get copyWith =>
      _$GameRoomCopyWithImpl<GameRoom>(this as GameRoom, _$identity);

  /// Serializes this GameRoom to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as GameRoom;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GameRoom &&
            (identical(other.roomId, _this.roomId) ||
                other.roomId == _this.roomId) &&
            const DeepCollectionEquality().equals(other.users, _this.users));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as GameRoom;
    return Object.hash(runtimeType, _this.roomId,
        const DeepCollectionEquality().hash(_this.users));
  }

  @override
  String toString() {
    final _this = this as GameRoom;
    return 'GameRoom(roomId: ${_this.roomId}, users: ${_this.users})';
  }
}

/// @nodoc
abstract mixin class $GameRoomCopyWith<$Res> {
  factory $GameRoomCopyWith(GameRoom value, $Res Function(GameRoom) _then) =
      _$GameRoomCopyWithImpl;
  @useResult
  $Res call({String roomId, List<GameUser> users});
}

/// @nodoc
class _$GameRoomCopyWithImpl<$Res> implements $GameRoomCopyWith<$Res> {
  _$GameRoomCopyWithImpl(this._self, this._then);

  final GameRoom _self;
  final $Res Function(GameRoom) _then;

  /// Create a copy of GameRoom
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? users = null,
  }) {
    return _then(GameRoom(
      roomId: null == roomId
          ? _self.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      users: null == users
          ? _self.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<GameUser>,
    ));
  }
}

/// Adds pattern-matching-related methods to [GameRoom].
extension GameRoomPatterns on GameRoom {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GameRoom value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GameRoom() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GameRoom value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GameRoom():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_GameRoom value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GameRoom() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String roomId, List<GameUser> users)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GameRoom() when $default != null:
        return $default(_that.roomId, _that.users);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String roomId, List<GameUser> users) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GameRoom():
        return $default(_that.roomId, _that.users);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String roomId, List<GameUser> users)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GameRoom() when $default != null:
        return $default(_that.roomId, _that.users);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GameRoom implements GameRoom {
  _GameRoom({required this.roomId, required List<GameUser> users})
      : _users = users;
  factory _GameRoom.fromJson(Map<String, dynamic> json) =>
      _$GameRoomFromJson(json);

  @override
  final String roomId;
  final List<GameUser> _users;
  @override
  List<GameUser> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  /// Create a copy of GameRoom
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GameRoomCopyWith<_GameRoom> get copyWith =>
      __$GameRoomCopyWithImpl<_GameRoom>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GameRoomToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GameRoom &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            const DeepCollectionEquality().equals(other.users, _users));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
        runtimeType, roomId, const DeepCollectionEquality().hash(_users));
  }

  @override
  String toString() {
    return 'GameRoom(roomId: $roomId, users: $users)';
  }
}

/// @nodoc
abstract mixin class _$GameRoomCopyWith<$Res>
    implements $GameRoomCopyWith<$Res> {
  factory _$GameRoomCopyWith(_GameRoom value, $Res Function(_GameRoom) _then) =
      __$GameRoomCopyWithImpl;
  @override
  @useResult
  $Res call({String roomId, List<GameUser> users});
}

/// @nodoc
class __$GameRoomCopyWithImpl<$Res> implements _$GameRoomCopyWith<$Res> {
  __$GameRoomCopyWithImpl(this._self, this._then);

  final _GameRoom _self;
  final $Res Function(_GameRoom) _then;

  /// Create a copy of GameRoom
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? roomId = null,
    Object? users = null,
  }) {
    return _then(_GameRoom(
      roomId: null == roomId
          ? _self.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      users: null == users
          ? _self._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<GameUser>,
    ));
  }
}

// dart format on

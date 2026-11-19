// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameUser {
  int get id;
  String get nickname;
  bool get isConnect;
  @JsonKey(name: "colorCode")
  @ColorSerializer()
  Color get color;

  /// Create a copy of GameUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GameUserCopyWith<GameUser> get copyWith =>
      _$GameUserCopyWithImpl<GameUser>(this as GameUser, _$identity);

  /// Serializes this GameUser to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as GameUser;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GameUser &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.nickname, _this.nickname) ||
                other.nickname == _this.nickname) &&
            (identical(other.isConnect, _this.isConnect) ||
                other.isConnect == _this.isConnect) &&
            (identical(other.color, _this.color) ||
                other.color == _this.color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as GameUser;
    return Object.hash(
        runtimeType, _this.id, _this.nickname, _this.isConnect, _this.color);
  }

  @override
  String toString() {
    final _this = this as GameUser;
    return 'GameUser(id: ${_this.id}, nickname: ${_this.nickname}, isConnect: ${_this.isConnect}, color: ${_this.color})';
  }
}

/// @nodoc
abstract mixin class $GameUserCopyWith<$Res> {
  factory $GameUserCopyWith(GameUser value, $Res Function(GameUser) _then) =
      _$GameUserCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String nickname,
      bool isConnect,
      @JsonKey(name: "colorCode") @ColorSerializer() Color color});
}

/// @nodoc
class _$GameUserCopyWithImpl<$Res> implements $GameUserCopyWith<$Res> {
  _$GameUserCopyWithImpl(this._self, this._then);

  final GameUser _self;
  final $Res Function(GameUser) _then;

  /// Create a copy of GameUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickname = null,
    Object? isConnect = null,
    Object? color = null,
  }) {
    return _then(GameUser(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _self.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      isConnect: null == isConnect
          ? _self.isConnect
          : isConnect // ignore: cast_nullable_to_non_nullable
              as bool,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// Adds pattern-matching-related methods to [GameUser].
extension GameUserPatterns on GameUser {
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
    TResult Function(_GameUser value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GameUser() when $default != null:
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
    TResult Function(_GameUser value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GameUser():
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
    TResult? Function(_GameUser value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GameUser() when $default != null:
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
    TResult Function(int id, String nickname, bool isConnect,
            @JsonKey(name: "colorCode") @ColorSerializer() Color color)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GameUser() when $default != null:
        return $default(_that.id, _that.nickname, _that.isConnect, _that.color);
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
    TResult Function(int id, String nickname, bool isConnect,
            @JsonKey(name: "colorCode") @ColorSerializer() Color color)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GameUser():
        return $default(_that.id, _that.nickname, _that.isConnect, _that.color);
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
    TResult? Function(int id, String nickname, bool isConnect,
            @JsonKey(name: "colorCode") @ColorSerializer() Color color)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GameUser() when $default != null:
        return $default(_that.id, _that.nickname, _that.isConnect, _that.color);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GameUser extends GameUser {
  _GameUser(
      {required this.id,
      required this.nickname,
      required this.isConnect,
      @JsonKey(name: "colorCode") @ColorSerializer() required this.color})
      : super._();
  factory _GameUser.fromJson(Map<String, dynamic> json) =>
      _$GameUserFromJson(json);

  @override
  final int id;
  @override
  final String nickname;
  @override
  final bool isConnect;
  @override
  @JsonKey(name: "colorCode")
  @ColorSerializer()
  final Color color;

  /// Create a copy of GameUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GameUserCopyWith<_GameUser> get copyWith =>
      __$GameUserCopyWithImpl<_GameUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GameUserToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GameUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.isConnect, isConnect) ||
                other.isConnect == isConnect) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(runtimeType, id, nickname, isConnect, color);
  }

  @override
  String toString() {
    return 'GameUser(id: $id, nickname: $nickname, isConnect: $isConnect, color: $color)';
  }
}

/// @nodoc
abstract mixin class _$GameUserCopyWith<$Res>
    implements $GameUserCopyWith<$Res> {
  factory _$GameUserCopyWith(_GameUser value, $Res Function(_GameUser) _then) =
      __$GameUserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String nickname,
      bool isConnect,
      @JsonKey(name: "colorCode") @ColorSerializer() Color color});
}

/// @nodoc
class __$GameUserCopyWithImpl<$Res> implements _$GameUserCopyWith<$Res> {
  __$GameUserCopyWithImpl(this._self, this._then);

  final _GameUser _self;
  final $Res Function(_GameUser) _then;

  /// Create a copy of GameUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? nickname = null,
    Object? isConnect = null,
    Object? color = null,
  }) {
    return _then(_GameUser(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _self.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      isConnect: null == isConnect
          ? _self.isConnect
          : isConnect // ignore: cast_nullable_to_non_nullable
              as bool,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

// dart format on

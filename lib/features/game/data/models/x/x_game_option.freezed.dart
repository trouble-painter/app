// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'x_game_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$XGameOption {
  int get minimum;
  int get maximum;
  int get readyTime;
  int get introAnimationTime;
  int get roundAnimationTime;
  int get round;
  int get turnTime;
  int get endTime;

  /// Maximum number of strokes per turn
  int get turnCount;
  int get voteTime;
  int get answerTime;

  /// Create a copy of XGameOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $XGameOptionCopyWith<XGameOption> get copyWith =>
      _$XGameOptionCopyWithImpl<XGameOption>(this as XGameOption, _$identity);

  /// Serializes this XGameOption to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as XGameOption;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is XGameOption &&
            (identical(other.minimum, _this.minimum) ||
                other.minimum == _this.minimum) &&
            (identical(other.maximum, _this.maximum) ||
                other.maximum == _this.maximum) &&
            (identical(other.readyTime, _this.readyTime) ||
                other.readyTime == _this.readyTime) &&
            (identical(other.introAnimationTime, _this.introAnimationTime) ||
                other.introAnimationTime == _this.introAnimationTime) &&
            (identical(other.roundAnimationTime, _this.roundAnimationTime) ||
                other.roundAnimationTime == _this.roundAnimationTime) &&
            (identical(other.round, _this.round) ||
                other.round == _this.round) &&
            (identical(other.turnTime, _this.turnTime) ||
                other.turnTime == _this.turnTime) &&
            (identical(other.endTime, _this.endTime) ||
                other.endTime == _this.endTime) &&
            (identical(other.turnCount, _this.turnCount) ||
                other.turnCount == _this.turnCount) &&
            (identical(other.voteTime, _this.voteTime) ||
                other.voteTime == _this.voteTime) &&
            (identical(other.answerTime, _this.answerTime) ||
                other.answerTime == _this.answerTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as XGameOption;
    return Object.hash(
        runtimeType,
        _this.minimum,
        _this.maximum,
        _this.readyTime,
        _this.introAnimationTime,
        _this.roundAnimationTime,
        _this.round,
        _this.turnTime,
        _this.endTime,
        _this.turnCount,
        _this.voteTime,
        _this.answerTime);
  }

  @override
  String toString() {
    final _this = this as XGameOption;
    return 'XGameOption(minimum: ${_this.minimum}, maximum: ${_this.maximum}, readyTime: ${_this.readyTime}, introAnimationTime: ${_this.introAnimationTime}, roundAnimationTime: ${_this.roundAnimationTime}, round: ${_this.round}, turnTime: ${_this.turnTime}, endTime: ${_this.endTime}, turnCount: ${_this.turnCount}, voteTime: ${_this.voteTime}, answerTime: ${_this.answerTime})';
  }
}

/// @nodoc
abstract mixin class $XGameOptionCopyWith<$Res> {
  factory $XGameOptionCopyWith(
          XGameOption value, $Res Function(XGameOption) _then) =
      _$XGameOptionCopyWithImpl;
  @useResult
  $Res call(
      {int minimum,
      int maximum,
      int readyTime,
      int introAnimationTime,
      int roundAnimationTime,
      int round,
      int turnTime,
      int endTime,
      int turnCount,
      int voteTime,
      int answerTime});
}

/// @nodoc
class _$XGameOptionCopyWithImpl<$Res> implements $XGameOptionCopyWith<$Res> {
  _$XGameOptionCopyWithImpl(this._self, this._then);

  final XGameOption _self;
  final $Res Function(XGameOption) _then;

  /// Create a copy of XGameOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minimum = null,
    Object? maximum = null,
    Object? readyTime = null,
    Object? introAnimationTime = null,
    Object? roundAnimationTime = null,
    Object? round = null,
    Object? turnTime = null,
    Object? endTime = null,
    Object? turnCount = null,
    Object? voteTime = null,
    Object? answerTime = null,
  }) {
    return _then(XGameOption(
      minimum: null == minimum
          ? _self.minimum
          : minimum // ignore: cast_nullable_to_non_nullable
              as int,
      maximum: null == maximum
          ? _self.maximum
          : maximum // ignore: cast_nullable_to_non_nullable
              as int,
      readyTime: null == readyTime
          ? _self.readyTime
          : readyTime // ignore: cast_nullable_to_non_nullable
              as int,
      introAnimationTime: null == introAnimationTime
          ? _self.introAnimationTime
          : introAnimationTime // ignore: cast_nullable_to_non_nullable
              as int,
      roundAnimationTime: null == roundAnimationTime
          ? _self.roundAnimationTime
          : roundAnimationTime // ignore: cast_nullable_to_non_nullable
              as int,
      round: null == round
          ? _self.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
      turnTime: null == turnTime
          ? _self.turnTime
          : turnTime // ignore: cast_nullable_to_non_nullable
              as int,
      endTime: null == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as int,
      turnCount: null == turnCount
          ? _self.turnCount
          : turnCount // ignore: cast_nullable_to_non_nullable
              as int,
      voteTime: null == voteTime
          ? _self.voteTime
          : voteTime // ignore: cast_nullable_to_non_nullable
              as int,
      answerTime: null == answerTime
          ? _self.answerTime
          : answerTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [XGameOption].
extension XGameOptionPatterns on XGameOption {
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
    TResult Function(_XGameOption value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _XGameOption() when $default != null:
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
    TResult Function(_XGameOption value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _XGameOption():
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
    TResult? Function(_XGameOption value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _XGameOption() when $default != null:
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
    TResult Function(
            int minimum,
            int maximum,
            int readyTime,
            int introAnimationTime,
            int roundAnimationTime,
            int round,
            int turnTime,
            int endTime,
            int turnCount,
            int voteTime,
            int answerTime)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _XGameOption() when $default != null:
        return $default(
            _that.minimum,
            _that.maximum,
            _that.readyTime,
            _that.introAnimationTime,
            _that.roundAnimationTime,
            _that.round,
            _that.turnTime,
            _that.endTime,
            _that.turnCount,
            _that.voteTime,
            _that.answerTime);
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
    TResult Function(
            int minimum,
            int maximum,
            int readyTime,
            int introAnimationTime,
            int roundAnimationTime,
            int round,
            int turnTime,
            int endTime,
            int turnCount,
            int voteTime,
            int answerTime)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _XGameOption():
        return $default(
            _that.minimum,
            _that.maximum,
            _that.readyTime,
            _that.introAnimationTime,
            _that.roundAnimationTime,
            _that.round,
            _that.turnTime,
            _that.endTime,
            _that.turnCount,
            _that.voteTime,
            _that.answerTime);
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
    TResult? Function(
            int minimum,
            int maximum,
            int readyTime,
            int introAnimationTime,
            int roundAnimationTime,
            int round,
            int turnTime,
            int endTime,
            int turnCount,
            int voteTime,
            int answerTime)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _XGameOption() when $default != null:
        return $default(
            _that.minimum,
            _that.maximum,
            _that.readyTime,
            _that.introAnimationTime,
            _that.roundAnimationTime,
            _that.round,
            _that.turnTime,
            _that.endTime,
            _that.turnCount,
            _that.voteTime,
            _that.answerTime);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _XGameOption implements XGameOption {
  _XGameOption(
      {required this.minimum,
      required this.maximum,
      required this.readyTime,
      required this.introAnimationTime,
      required this.roundAnimationTime,
      required this.round,
      required this.turnTime,
      required this.endTime,
      required this.turnCount,
      required this.voteTime,
      required this.answerTime});
  factory _XGameOption.fromJson(Map<String, dynamic> json) =>
      _$XGameOptionFromJson(json);

  @override
  final int minimum;
  @override
  final int maximum;
  @override
  final int readyTime;
  @override
  final int introAnimationTime;
  @override
  final int roundAnimationTime;
  @override
  final int round;
  @override
  final int turnTime;
  @override
  final int endTime;

  /// Maximum number of strokes per turn
  @override
  final int turnCount;
  @override
  final int voteTime;
  @override
  final int answerTime;

  /// Create a copy of XGameOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$XGameOptionCopyWith<_XGameOption> get copyWith =>
      __$XGameOptionCopyWithImpl<_XGameOption>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$XGameOptionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _XGameOption &&
            (identical(other.minimum, minimum) || other.minimum == minimum) &&
            (identical(other.maximum, maximum) || other.maximum == maximum) &&
            (identical(other.readyTime, readyTime) ||
                other.readyTime == readyTime) &&
            (identical(other.introAnimationTime, introAnimationTime) ||
                other.introAnimationTime == introAnimationTime) &&
            (identical(other.roundAnimationTime, roundAnimationTime) ||
                other.roundAnimationTime == roundAnimationTime) &&
            (identical(other.round, round) || other.round == round) &&
            (identical(other.turnTime, turnTime) ||
                other.turnTime == turnTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.turnCount, turnCount) ||
                other.turnCount == turnCount) &&
            (identical(other.voteTime, voteTime) ||
                other.voteTime == voteTime) &&
            (identical(other.answerTime, answerTime) ||
                other.answerTime == answerTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        minimum,
        maximum,
        readyTime,
        introAnimationTime,
        roundAnimationTime,
        round,
        turnTime,
        endTime,
        turnCount,
        voteTime,
        answerTime);
  }

  @override
  String toString() {
    return 'XGameOption(minimum: $minimum, maximum: $maximum, readyTime: $readyTime, introAnimationTime: $introAnimationTime, roundAnimationTime: $roundAnimationTime, round: $round, turnTime: $turnTime, endTime: $endTime, turnCount: $turnCount, voteTime: $voteTime, answerTime: $answerTime)';
  }
}

/// @nodoc
abstract mixin class _$XGameOptionCopyWith<$Res>
    implements $XGameOptionCopyWith<$Res> {
  factory _$XGameOptionCopyWith(
          _XGameOption value, $Res Function(_XGameOption) _then) =
      __$XGameOptionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int minimum,
      int maximum,
      int readyTime,
      int introAnimationTime,
      int roundAnimationTime,
      int round,
      int turnTime,
      int endTime,
      int turnCount,
      int voteTime,
      int answerTime});
}

/// @nodoc
class __$XGameOptionCopyWithImpl<$Res> implements _$XGameOptionCopyWith<$Res> {
  __$XGameOptionCopyWithImpl(this._self, this._then);

  final _XGameOption _self;
  final $Res Function(_XGameOption) _then;

  /// Create a copy of XGameOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? minimum = null,
    Object? maximum = null,
    Object? readyTime = null,
    Object? introAnimationTime = null,
    Object? roundAnimationTime = null,
    Object? round = null,
    Object? turnTime = null,
    Object? endTime = null,
    Object? turnCount = null,
    Object? voteTime = null,
    Object? answerTime = null,
  }) {
    return _then(_XGameOption(
      minimum: null == minimum
          ? _self.minimum
          : minimum // ignore: cast_nullable_to_non_nullable
              as int,
      maximum: null == maximum
          ? _self.maximum
          : maximum // ignore: cast_nullable_to_non_nullable
              as int,
      readyTime: null == readyTime
          ? _self.readyTime
          : readyTime // ignore: cast_nullable_to_non_nullable
              as int,
      introAnimationTime: null == introAnimationTime
          ? _self.introAnimationTime
          : introAnimationTime // ignore: cast_nullable_to_non_nullable
              as int,
      roundAnimationTime: null == roundAnimationTime
          ? _self.roundAnimationTime
          : roundAnimationTime // ignore: cast_nullable_to_non_nullable
              as int,
      round: null == round
          ? _self.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
      turnTime: null == turnTime
          ? _self.turnTime
          : turnTime // ignore: cast_nullable_to_non_nullable
              as int,
      endTime: null == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as int,
      turnCount: null == turnCount
          ? _self.turnCount
          : turnCount // ignore: cast_nullable_to_non_nullable
              as int,
      voteTime: null == voteTime
          ? _self.voteTime
          : voteTime // ignore: cast_nullable_to_non_nullable
              as int,
      answerTime: null == answerTime
          ? _self.answerTime
          : answerTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on

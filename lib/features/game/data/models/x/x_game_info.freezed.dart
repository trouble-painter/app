// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'x_game_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$XGameInfo {
  int get mafiaUserId;
  String get roomId;
  String get category;
  String get answer;
  bool get isRandomMatching;
  List<XGameUser> get turnList;
  @JsonKey(name: "gameOption")
  XGameOption get option;

  /// Create a copy of XGameInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $XGameInfoCopyWith<XGameInfo> get copyWith =>
      _$XGameInfoCopyWithImpl<XGameInfo>(this as XGameInfo, _$identity);

  /// Serializes this XGameInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as XGameInfo;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is XGameInfo &&
            (identical(other.mafiaUserId, _this.mafiaUserId) ||
                other.mafiaUserId == _this.mafiaUserId) &&
            (identical(other.roomId, _this.roomId) ||
                other.roomId == _this.roomId) &&
            (identical(other.category, _this.category) ||
                other.category == _this.category) &&
            (identical(other.answer, _this.answer) ||
                other.answer == _this.answer) &&
            (identical(other.isRandomMatching, _this.isRandomMatching) ||
                other.isRandomMatching == _this.isRandomMatching) &&
            const DeepCollectionEquality()
                .equals(other.turnList, _this.turnList) &&
            (identical(other.option, _this.option) ||
                other.option == _this.option));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as XGameInfo;
    return Object.hash(
        runtimeType,
        _this.mafiaUserId,
        _this.roomId,
        _this.category,
        _this.answer,
        _this.isRandomMatching,
        const DeepCollectionEquality().hash(_this.turnList),
        _this.option);
  }

  @override
  String toString() {
    final _this = this as XGameInfo;
    return 'XGameInfo(mafiaUserId: ${_this.mafiaUserId}, roomId: ${_this.roomId}, category: ${_this.category}, answer: ${_this.answer}, isRandomMatching: ${_this.isRandomMatching}, turnList: ${_this.turnList}, option: ${_this.option})';
  }
}

/// @nodoc
abstract mixin class $XGameInfoCopyWith<$Res> {
  factory $XGameInfoCopyWith(XGameInfo value, $Res Function(XGameInfo) _then) =
      _$XGameInfoCopyWithImpl;
  @useResult
  $Res call(
      {int mafiaUserId,
      String roomId,
      String category,
      String answer,
      bool isRandomMatching,
      List<XGameUser> turnList,
      @JsonKey(name: "gameOption") XGameOption option});

  $XGameOptionCopyWith<$Res> get option;
}

/// @nodoc
class _$XGameInfoCopyWithImpl<$Res> implements $XGameInfoCopyWith<$Res> {
  _$XGameInfoCopyWithImpl(this._self, this._then);

  final XGameInfo _self;
  final $Res Function(XGameInfo) _then;

  /// Create a copy of XGameInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mafiaUserId = null,
    Object? roomId = null,
    Object? category = null,
    Object? answer = null,
    Object? isRandomMatching = null,
    Object? turnList = null,
    Object? option = null,
  }) {
    return _then(XGameInfo(
      mafiaUserId: null == mafiaUserId
          ? _self.mafiaUserId
          : mafiaUserId // ignore: cast_nullable_to_non_nullable
              as int,
      roomId: null == roomId
          ? _self.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      isRandomMatching: null == isRandomMatching
          ? _self.isRandomMatching
          : isRandomMatching // ignore: cast_nullable_to_non_nullable
              as bool,
      turnList: null == turnList
          ? _self.turnList
          : turnList // ignore: cast_nullable_to_non_nullable
              as List<XGameUser>,
      option: null == option
          ? _self.option
          : option // ignore: cast_nullable_to_non_nullable
              as XGameOption,
    ));
  }

  /// Create a copy of XGameInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $XGameOptionCopyWith<$Res> get option {
    return $XGameOptionCopyWith<$Res>(_self.option, (value) {
      return _then(_self.copyWith(option: value));
    });
  }
}

/// Adds pattern-matching-related methods to [XGameInfo].
extension XGameInfoPatterns on XGameInfo {
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
    TResult Function(_XGameInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _XGameInfo() when $default != null:
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
    TResult Function(_XGameInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _XGameInfo():
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
    TResult? Function(_XGameInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _XGameInfo() when $default != null:
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
            int mafiaUserId,
            String roomId,
            String category,
            String answer,
            bool isRandomMatching,
            List<XGameUser> turnList,
            @JsonKey(name: "gameOption") XGameOption option)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _XGameInfo() when $default != null:
        return $default(_that.mafiaUserId, _that.roomId, _that.category,
            _that.answer, _that.isRandomMatching, _that.turnList, _that.option);
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
            int mafiaUserId,
            String roomId,
            String category,
            String answer,
            bool isRandomMatching,
            List<XGameUser> turnList,
            @JsonKey(name: "gameOption") XGameOption option)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _XGameInfo():
        return $default(_that.mafiaUserId, _that.roomId, _that.category,
            _that.answer, _that.isRandomMatching, _that.turnList, _that.option);
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
            int mafiaUserId,
            String roomId,
            String category,
            String answer,
            bool isRandomMatching,
            List<XGameUser> turnList,
            @JsonKey(name: "gameOption") XGameOption option)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _XGameInfo() when $default != null:
        return $default(_that.mafiaUserId, _that.roomId, _that.category,
            _that.answer, _that.isRandomMatching, _that.turnList, _that.option);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _XGameInfo extends XGameInfo {
  _XGameInfo(
      {required this.mafiaUserId,
      required this.roomId,
      required this.category,
      required this.answer,
      required this.isRandomMatching,
      required List<XGameUser> turnList,
      @JsonKey(name: "gameOption") required this.option})
      : _turnList = turnList,
        super._();
  factory _XGameInfo.fromJson(Map<String, dynamic> json) =>
      _$XGameInfoFromJson(json);

  @override
  final int mafiaUserId;
  @override
  final String roomId;
  @override
  final String category;
  @override
  final String answer;
  @override
  final bool isRandomMatching;
  final List<XGameUser> _turnList;
  @override
  List<XGameUser> get turnList {
    if (_turnList is EqualUnmodifiableListView) return _turnList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_turnList);
  }

  @override
  @JsonKey(name: "gameOption")
  final XGameOption option;

  /// Create a copy of XGameInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$XGameInfoCopyWith<_XGameInfo> get copyWith =>
      __$XGameInfoCopyWithImpl<_XGameInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$XGameInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _XGameInfo &&
            (identical(other.mafiaUserId, mafiaUserId) ||
                other.mafiaUserId == mafiaUserId) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.isRandomMatching, isRandomMatching) ||
                other.isRandomMatching == isRandomMatching) &&
            const DeepCollectionEquality().equals(other.turnList, _turnList) &&
            (identical(other.option, option) || other.option == option));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        mafiaUserId,
        roomId,
        category,
        answer,
        isRandomMatching,
        const DeepCollectionEquality().hash(_turnList),
        option);
  }

  @override
  String toString() {
    return 'XGameInfo(mafiaUserId: $mafiaUserId, roomId: $roomId, category: $category, answer: $answer, isRandomMatching: $isRandomMatching, turnList: $turnList, option: $option)';
  }
}

/// @nodoc
abstract mixin class _$XGameInfoCopyWith<$Res>
    implements $XGameInfoCopyWith<$Res> {
  factory _$XGameInfoCopyWith(
          _XGameInfo value, $Res Function(_XGameInfo) _then) =
      __$XGameInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int mafiaUserId,
      String roomId,
      String category,
      String answer,
      bool isRandomMatching,
      List<XGameUser> turnList,
      @JsonKey(name: "gameOption") XGameOption option});

  @override
  $XGameOptionCopyWith<$Res> get option;
}

/// @nodoc
class __$XGameInfoCopyWithImpl<$Res> implements _$XGameInfoCopyWith<$Res> {
  __$XGameInfoCopyWithImpl(this._self, this._then);

  final _XGameInfo _self;
  final $Res Function(_XGameInfo) _then;

  /// Create a copy of XGameInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mafiaUserId = null,
    Object? roomId = null,
    Object? category = null,
    Object? answer = null,
    Object? isRandomMatching = null,
    Object? turnList = null,
    Object? option = null,
  }) {
    return _then(_XGameInfo(
      mafiaUserId: null == mafiaUserId
          ? _self.mafiaUserId
          : mafiaUserId // ignore: cast_nullable_to_non_nullable
              as int,
      roomId: null == roomId
          ? _self.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      isRandomMatching: null == isRandomMatching
          ? _self.isRandomMatching
          : isRandomMatching // ignore: cast_nullable_to_non_nullable
              as bool,
      turnList: null == turnList
          ? _self._turnList
          : turnList // ignore: cast_nullable_to_non_nullable
              as List<XGameUser>,
      option: null == option
          ? _self.option
          : option // ignore: cast_nullable_to_non_nullable
              as XGameOption,
    ));
  }

  /// Create a copy of XGameInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $XGameOptionCopyWith<$Res> get option {
    return $XGameOptionCopyWith<$Res>(_self.option, (value) {
      return _then(_self.copyWith(option: value));
    });
  }
}

// dart format on

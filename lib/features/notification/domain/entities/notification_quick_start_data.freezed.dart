// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_quick_start_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationQuickStartData _$NotificationQuickStartDataFromJson(
    Map<String, dynamic> json) {
  return _NotificationQuickStartData.fromJson(json);
}

/// @nodoc
mixin _$NotificationQuickStartData {
  String get title => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationQuickStartDataCopyWith<NotificationQuickStartData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationQuickStartDataCopyWith<$Res> {
  factory $NotificationQuickStartDataCopyWith(NotificationQuickStartData value,
          $Res Function(NotificationQuickStartData) then) =
      _$NotificationQuickStartDataCopyWithImpl<$Res,
          NotificationQuickStartData>;
  @useResult
  $Res call({String title, String desc});
}

/// @nodoc
class _$NotificationQuickStartDataCopyWithImpl<$Res,
        $Val extends NotificationQuickStartData>
    implements $NotificationQuickStartDataCopyWith<$Res> {
  _$NotificationQuickStartDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? desc = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationQuickStartDataImplCopyWith<$Res>
    implements $NotificationQuickStartDataCopyWith<$Res> {
  factory _$$NotificationQuickStartDataImplCopyWith(
          _$NotificationQuickStartDataImpl value,
          $Res Function(_$NotificationQuickStartDataImpl) then) =
      __$$NotificationQuickStartDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String desc});
}

/// @nodoc
class __$$NotificationQuickStartDataImplCopyWithImpl<$Res>
    extends _$NotificationQuickStartDataCopyWithImpl<$Res,
        _$NotificationQuickStartDataImpl>
    implements _$$NotificationQuickStartDataImplCopyWith<$Res> {
  __$$NotificationQuickStartDataImplCopyWithImpl(
      _$NotificationQuickStartDataImpl _value,
      $Res Function(_$NotificationQuickStartDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? desc = null,
  }) {
    return _then(_$NotificationQuickStartDataImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationQuickStartDataImpl implements _NotificationQuickStartData {
  _$NotificationQuickStartDataImpl({required this.title, required this.desc});

  factory _$NotificationQuickStartDataImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$NotificationQuickStartDataImplFromJson(json);

  @override
  final String title;
  @override
  final String desc;

  @override
  String toString() {
    return 'NotificationQuickStartData(title: $title, desc: $desc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationQuickStartDataImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.desc, desc) || other.desc == desc));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, desc);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationQuickStartDataImplCopyWith<_$NotificationQuickStartDataImpl>
      get copyWith => __$$NotificationQuickStartDataImplCopyWithImpl<
          _$NotificationQuickStartDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationQuickStartDataImplToJson(
      this,
    );
  }
}

abstract class _NotificationQuickStartData
    implements NotificationQuickStartData {
  factory _NotificationQuickStartData(
      {required final String title,
      required final String desc}) = _$NotificationQuickStartDataImpl;

  factory _NotificationQuickStartData.fromJson(Map<String, dynamic> json) =
      _$NotificationQuickStartDataImpl.fromJson;

  @override
  String get title;
  @override
  String get desc;
  @override
  @JsonKey(ignore: true)
  _$$NotificationQuickStartDataImplCopyWith<_$NotificationQuickStartDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

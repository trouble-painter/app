// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notice_dialog_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NoticeDialogData _$NoticeDialogDataFromJson(Map<String, dynamic> json) {
  return _NoticeDialogData.fromJson(json);
}

/// @nodoc
mixin _$NoticeDialogData {
  int get version => throw _privateConstructorUsedError;
  int get exposureIntervalHour => throw _privateConstructorUsedError;
  bool get isShow => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime get endedAt => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  Uri? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoticeDialogDataCopyWith<NoticeDialogData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticeDialogDataCopyWith<$Res> {
  factory $NoticeDialogDataCopyWith(
          NoticeDialogData value, $Res Function(NoticeDialogData) then) =
      _$NoticeDialogDataCopyWithImpl<$Res, NoticeDialogData>;
  @useResult
  $Res call(
      {int version,
      int exposureIntervalHour,
      bool isShow,
      DateTime startedAt,
      DateTime endedAt,
      String title,
      String desc,
      Uri? url});
}

/// @nodoc
class _$NoticeDialogDataCopyWithImpl<$Res, $Val extends NoticeDialogData>
    implements $NoticeDialogDataCopyWith<$Res> {
  _$NoticeDialogDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? exposureIntervalHour = null,
    Object? isShow = null,
    Object? startedAt = null,
    Object? endedAt = null,
    Object? title = null,
    Object? desc = null,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      exposureIntervalHour: null == exposureIntervalHour
          ? _value.exposureIntervalHour
          : exposureIntervalHour // ignore: cast_nullable_to_non_nullable
              as int,
      isShow: null == isShow
          ? _value.isShow
          : isShow // ignore: cast_nullable_to_non_nullable
              as bool,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endedAt: null == endedAt
          ? _value.endedAt
          : endedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoticeDialogDataImplCopyWith<$Res>
    implements $NoticeDialogDataCopyWith<$Res> {
  factory _$$NoticeDialogDataImplCopyWith(_$NoticeDialogDataImpl value,
          $Res Function(_$NoticeDialogDataImpl) then) =
      __$$NoticeDialogDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int version,
      int exposureIntervalHour,
      bool isShow,
      DateTime startedAt,
      DateTime endedAt,
      String title,
      String desc,
      Uri? url});
}

/// @nodoc
class __$$NoticeDialogDataImplCopyWithImpl<$Res>
    extends _$NoticeDialogDataCopyWithImpl<$Res, _$NoticeDialogDataImpl>
    implements _$$NoticeDialogDataImplCopyWith<$Res> {
  __$$NoticeDialogDataImplCopyWithImpl(_$NoticeDialogDataImpl _value,
      $Res Function(_$NoticeDialogDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? exposureIntervalHour = null,
    Object? isShow = null,
    Object? startedAt = null,
    Object? endedAt = null,
    Object? title = null,
    Object? desc = null,
    Object? url = freezed,
  }) {
    return _then(_$NoticeDialogDataImpl(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      exposureIntervalHour: null == exposureIntervalHour
          ? _value.exposureIntervalHour
          : exposureIntervalHour // ignore: cast_nullable_to_non_nullable
              as int,
      isShow: null == isShow
          ? _value.isShow
          : isShow // ignore: cast_nullable_to_non_nullable
              as bool,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endedAt: null == endedAt
          ? _value.endedAt
          : endedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoticeDialogDataImpl extends _NoticeDialogData {
  _$NoticeDialogDataImpl(
      {required this.version,
      required this.exposureIntervalHour,
      required this.isShow,
      required this.startedAt,
      required this.endedAt,
      required this.title,
      required this.desc,
      this.url})
      : super._();

  factory _$NoticeDialogDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoticeDialogDataImplFromJson(json);

  @override
  final int version;
  @override
  final int exposureIntervalHour;
  @override
  final bool isShow;
  @override
  final DateTime startedAt;
  @override
  final DateTime endedAt;
  @override
  final String title;
  @override
  final String desc;
  @override
  final Uri? url;

  @override
  String toString() {
    return 'NoticeDialogData(version: $version, exposureIntervalHour: $exposureIntervalHour, isShow: $isShow, startedAt: $startedAt, endedAt: $endedAt, title: $title, desc: $desc, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoticeDialogDataImpl &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.exposureIntervalHour, exposureIntervalHour) ||
                other.exposureIntervalHour == exposureIntervalHour) &&
            (identical(other.isShow, isShow) || other.isShow == isShow) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.endedAt, endedAt) || other.endedAt == endedAt) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, version, exposureIntervalHour,
      isShow, startedAt, endedAt, title, desc, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoticeDialogDataImplCopyWith<_$NoticeDialogDataImpl> get copyWith =>
      __$$NoticeDialogDataImplCopyWithImpl<_$NoticeDialogDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoticeDialogDataImplToJson(
      this,
    );
  }
}

abstract class _NoticeDialogData extends NoticeDialogData {
  factory _NoticeDialogData(
      {required final int version,
      required final int exposureIntervalHour,
      required final bool isShow,
      required final DateTime startedAt,
      required final DateTime endedAt,
      required final String title,
      required final String desc,
      final Uri? url}) = _$NoticeDialogDataImpl;
  _NoticeDialogData._() : super._();

  factory _NoticeDialogData.fromJson(Map<String, dynamic> json) =
      _$NoticeDialogDataImpl.fromJson;

  @override
  int get version;
  @override
  int get exposureIntervalHour;
  @override
  bool get isShow;
  @override
  DateTime get startedAt;
  @override
  DateTime get endedAt;
  @override
  String get title;
  @override
  String get desc;
  @override
  Uri? get url;
  @override
  @JsonKey(ignore: true)
  _$$NoticeDialogDataImplCopyWith<_$NoticeDialogDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

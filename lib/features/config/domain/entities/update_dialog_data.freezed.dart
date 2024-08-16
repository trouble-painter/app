// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_dialog_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateDialogData _$UpdateDialogDataFromJson(Map<String, dynamic> json) {
  return _UpdateDialogData.fromJson(json);
}

/// @nodoc
mixin _$UpdateDialogData {
  String get title => throw _privateConstructorUsedError;
  String get button => throw _privateConstructorUsedError;
  Uri get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateDialogDataCopyWith<UpdateDialogData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateDialogDataCopyWith<$Res> {
  factory $UpdateDialogDataCopyWith(
          UpdateDialogData value, $Res Function(UpdateDialogData) then) =
      _$UpdateDialogDataCopyWithImpl<$Res, UpdateDialogData>;
  @useResult
  $Res call({String title, String button, Uri url});
}

/// @nodoc
class _$UpdateDialogDataCopyWithImpl<$Res, $Val extends UpdateDialogData>
    implements $UpdateDialogDataCopyWith<$Res> {
  _$UpdateDialogDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? button = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      button: null == button
          ? _value.button
          : button // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateDialogDataImplCopyWith<$Res>
    implements $UpdateDialogDataCopyWith<$Res> {
  factory _$$UpdateDialogDataImplCopyWith(_$UpdateDialogDataImpl value,
          $Res Function(_$UpdateDialogDataImpl) then) =
      __$$UpdateDialogDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String button, Uri url});
}

/// @nodoc
class __$$UpdateDialogDataImplCopyWithImpl<$Res>
    extends _$UpdateDialogDataCopyWithImpl<$Res, _$UpdateDialogDataImpl>
    implements _$$UpdateDialogDataImplCopyWith<$Res> {
  __$$UpdateDialogDataImplCopyWithImpl(_$UpdateDialogDataImpl _value,
      $Res Function(_$UpdateDialogDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? button = null,
    Object? url = null,
  }) {
    return _then(_$UpdateDialogDataImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      button: null == button
          ? _value.button
          : button // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateDialogDataImpl extends _UpdateDialogData {
  _$UpdateDialogDataImpl(
      {required this.title, required this.button, required this.url})
      : super._();

  factory _$UpdateDialogDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateDialogDataImplFromJson(json);

  @override
  final String title;
  @override
  final String button;
  @override
  final Uri url;

  @override
  String toString() {
    return 'UpdateDialogData(title: $title, button: $button, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDialogDataImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.button, button) || other.button == button) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, button, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateDialogDataImplCopyWith<_$UpdateDialogDataImpl> get copyWith =>
      __$$UpdateDialogDataImplCopyWithImpl<_$UpdateDialogDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateDialogDataImplToJson(
      this,
    );
  }
}

abstract class _UpdateDialogData extends UpdateDialogData {
  factory _UpdateDialogData(
      {required final String title,
      required final String button,
      required final Uri url}) = _$UpdateDialogDataImpl;
  _UpdateDialogData._() : super._();

  factory _UpdateDialogData.fromJson(Map<String, dynamic> json) =
      _$UpdateDialogDataImpl.fromJson;

  @override
  String get title;
  @override
  String get button;
  @override
  Uri get url;
  @override
  @JsonKey(ignore: true)
  _$$UpdateDialogDataImplCopyWith<_$UpdateDialogDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

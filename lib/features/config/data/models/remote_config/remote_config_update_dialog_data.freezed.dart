// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config_update_dialog_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RemoteConfigUpdateDialogData _$RemoteConfigUpdateDialogDataFromJson(
    Map<String, dynamic> json) {
  return _RemoteConfigUpdateDialogData.fromJson(json);
}

/// @nodoc
mixin _$RemoteConfigUpdateDialogData {
  RemoteConfigLang get title => throw _privateConstructorUsedError;
  RemoteConfigLang get button => throw _privateConstructorUsedError;
  RemoteConfigLang get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoteConfigUpdateDialogDataCopyWith<RemoteConfigUpdateDialogData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteConfigUpdateDialogDataCopyWith<$Res> {
  factory $RemoteConfigUpdateDialogDataCopyWith(
          RemoteConfigUpdateDialogData value,
          $Res Function(RemoteConfigUpdateDialogData) then) =
      _$RemoteConfigUpdateDialogDataCopyWithImpl<$Res,
          RemoteConfigUpdateDialogData>;
  @useResult
  $Res call(
      {RemoteConfigLang title, RemoteConfigLang button, RemoteConfigLang url});

  $RemoteConfigLangCopyWith<$Res> get title;
  $RemoteConfigLangCopyWith<$Res> get button;
  $RemoteConfigLangCopyWith<$Res> get url;
}

/// @nodoc
class _$RemoteConfigUpdateDialogDataCopyWithImpl<$Res,
        $Val extends RemoteConfigUpdateDialogData>
    implements $RemoteConfigUpdateDialogDataCopyWith<$Res> {
  _$RemoteConfigUpdateDialogDataCopyWithImpl(this._value, this._then);

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
              as RemoteConfigLang,
      button: null == button
          ? _value.button
          : button // ignore: cast_nullable_to_non_nullable
              as RemoteConfigLang,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as RemoteConfigLang,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<$Res> get title {
    return $RemoteConfigLangCopyWith<$Res>(_value.title, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<$Res> get button {
    return $RemoteConfigLangCopyWith<$Res>(_value.button, (value) {
      return _then(_value.copyWith(button: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<$Res> get url {
    return $RemoteConfigLangCopyWith<$Res>(_value.url, (value) {
      return _then(_value.copyWith(url: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RemoteConfigUpdateDialogDataImplCopyWith<$Res>
    implements $RemoteConfigUpdateDialogDataCopyWith<$Res> {
  factory _$$RemoteConfigUpdateDialogDataImplCopyWith(
          _$RemoteConfigUpdateDialogDataImpl value,
          $Res Function(_$RemoteConfigUpdateDialogDataImpl) then) =
      __$$RemoteConfigUpdateDialogDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RemoteConfigLang title, RemoteConfigLang button, RemoteConfigLang url});

  @override
  $RemoteConfigLangCopyWith<$Res> get title;
  @override
  $RemoteConfigLangCopyWith<$Res> get button;
  @override
  $RemoteConfigLangCopyWith<$Res> get url;
}

/// @nodoc
class __$$RemoteConfigUpdateDialogDataImplCopyWithImpl<$Res>
    extends _$RemoteConfigUpdateDialogDataCopyWithImpl<$Res,
        _$RemoteConfigUpdateDialogDataImpl>
    implements _$$RemoteConfigUpdateDialogDataImplCopyWith<$Res> {
  __$$RemoteConfigUpdateDialogDataImplCopyWithImpl(
      _$RemoteConfigUpdateDialogDataImpl _value,
      $Res Function(_$RemoteConfigUpdateDialogDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? button = null,
    Object? url = null,
  }) {
    return _then(_$RemoteConfigUpdateDialogDataImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as RemoteConfigLang,
      button: null == button
          ? _value.button
          : button // ignore: cast_nullable_to_non_nullable
              as RemoteConfigLang,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as RemoteConfigLang,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RemoteConfigUpdateDialogDataImpl extends _RemoteConfigUpdateDialogData {
  _$RemoteConfigUpdateDialogDataImpl(
      {required this.title, required this.button, required this.url})
      : super._();

  factory _$RemoteConfigUpdateDialogDataImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RemoteConfigUpdateDialogDataImplFromJson(json);

  @override
  final RemoteConfigLang title;
  @override
  final RemoteConfigLang button;
  @override
  final RemoteConfigLang url;

  @override
  String toString() {
    return 'RemoteConfigUpdateDialogData(title: $title, button: $button, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteConfigUpdateDialogDataImpl &&
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
  _$$RemoteConfigUpdateDialogDataImplCopyWith<
          _$RemoteConfigUpdateDialogDataImpl>
      get copyWith => __$$RemoteConfigUpdateDialogDataImplCopyWithImpl<
          _$RemoteConfigUpdateDialogDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemoteConfigUpdateDialogDataImplToJson(
      this,
    );
  }
}

abstract class _RemoteConfigUpdateDialogData
    extends RemoteConfigUpdateDialogData {
  factory _RemoteConfigUpdateDialogData(
          {required final RemoteConfigLang title,
          required final RemoteConfigLang button,
          required final RemoteConfigLang url}) =
      _$RemoteConfigUpdateDialogDataImpl;
  _RemoteConfigUpdateDialogData._() : super._();

  factory _RemoteConfigUpdateDialogData.fromJson(Map<String, dynamic> json) =
      _$RemoteConfigUpdateDialogDataImpl.fromJson;

  @override
  RemoteConfigLang get title;
  @override
  RemoteConfigLang get button;
  @override
  RemoteConfigLang get url;
  @override
  @JsonKey(ignore: true)
  _$$RemoteConfigUpdateDialogDataImplCopyWith<
          _$RemoteConfigUpdateDialogDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

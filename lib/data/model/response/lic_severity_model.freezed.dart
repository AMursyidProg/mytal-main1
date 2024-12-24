// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lic_severity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LicSeverityModel _$LicSeverityModelFromJson(Map<String, dynamic> json) {
  return _LicSeverityModel.fromJson(json);
}

/// @nodoc
mixin _$LicSeverityModel {
  int get id => throw _privateConstructorUsedError;
  String get severityDescr => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LicSeverityModelCopyWith<LicSeverityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LicSeverityModelCopyWith<$Res> {
  factory $LicSeverityModelCopyWith(
          LicSeverityModel value, $Res Function(LicSeverityModel) then) =
      _$LicSeverityModelCopyWithImpl<$Res, LicSeverityModel>;
  @useResult
  $Res call({int id, String severityDescr});
}

/// @nodoc
class _$LicSeverityModelCopyWithImpl<$Res, $Val extends LicSeverityModel>
    implements $LicSeverityModelCopyWith<$Res> {
  _$LicSeverityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? severityDescr = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      severityDescr: null == severityDescr
          ? _value.severityDescr
          : severityDescr // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LicSeverityModelImplCopyWith<$Res>
    implements $LicSeverityModelCopyWith<$Res> {
  factory _$$LicSeverityModelImplCopyWith(_$LicSeverityModelImpl value,
          $Res Function(_$LicSeverityModelImpl) then) =
      __$$LicSeverityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String severityDescr});
}

/// @nodoc
class __$$LicSeverityModelImplCopyWithImpl<$Res>
    extends _$LicSeverityModelCopyWithImpl<$Res, _$LicSeverityModelImpl>
    implements _$$LicSeverityModelImplCopyWith<$Res> {
  __$$LicSeverityModelImplCopyWithImpl(_$LicSeverityModelImpl _value,
      $Res Function(_$LicSeverityModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? severityDescr = null,
  }) {
    return _then(_$LicSeverityModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      severityDescr: null == severityDescr
          ? _value.severityDescr
          : severityDescr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LicSeverityModelImpl
    with DiagnosticableTreeMixin
    implements _LicSeverityModel {
  const _$LicSeverityModelImpl({required this.id, required this.severityDescr});

  factory _$LicSeverityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LicSeverityModelImplFromJson(json);

  @override
  final int id;
  @override
  final String severityDescr;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LicSeverityModel(id: $id, severityDescr: $severityDescr)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LicSeverityModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('severityDescr', severityDescr));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LicSeverityModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.severityDescr, severityDescr) ||
                other.severityDescr == severityDescr));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, severityDescr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LicSeverityModelImplCopyWith<_$LicSeverityModelImpl> get copyWith =>
      __$$LicSeverityModelImplCopyWithImpl<_$LicSeverityModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LicSeverityModelImplToJson(
      this,
    );
  }
}

abstract class _LicSeverityModel implements LicSeverityModel {
  const factory _LicSeverityModel(
      {required final int id,
      required final String severityDescr}) = _$LicSeverityModelImpl;

  factory _LicSeverityModel.fromJson(Map<String, dynamic> json) =
      _$LicSeverityModelImpl.fromJson;

  @override
  int get id;
  @override
  String get severityDescr;
  @override
  @JsonKey(ignore: true)
  _$$LicSeverityModelImplCopyWith<_$LicSeverityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

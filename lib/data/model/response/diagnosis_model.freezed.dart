// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagnosis_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiagnosisModel _$DiagnosisModelFromJson(Map<String, dynamic> json) {
  return _DiagnosisModel.fromJson(json);
}

/// @nodoc
mixin _$DiagnosisModel {
  int get patientId => throw _privateConstructorUsedError;
  String get dateDiagnosed => throw _privateConstructorUsedError;
  String get diagnosisDescr => throw _privateConstructorUsedError;
  bool? get clinical => throw _privateConstructorUsedError;
  bool? get lab => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiagnosisModelCopyWith<DiagnosisModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagnosisModelCopyWith<$Res> {
  factory $DiagnosisModelCopyWith(
          DiagnosisModel value, $Res Function(DiagnosisModel) then) =
      _$DiagnosisModelCopyWithImpl<$Res, DiagnosisModel>;
  @useResult
  $Res call(
      {int patientId,
      String dateDiagnosed,
      String diagnosisDescr,
      bool? clinical,
      bool? lab});
}

/// @nodoc
class _$DiagnosisModelCopyWithImpl<$Res, $Val extends DiagnosisModel>
    implements $DiagnosisModelCopyWith<$Res> {
  _$DiagnosisModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patientId = null,
    Object? dateDiagnosed = null,
    Object? diagnosisDescr = null,
    Object? clinical = freezed,
    Object? lab = freezed,
  }) {
    return _then(_value.copyWith(
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as int,
      dateDiagnosed: null == dateDiagnosed
          ? _value.dateDiagnosed
          : dateDiagnosed // ignore: cast_nullable_to_non_nullable
              as String,
      diagnosisDescr: null == diagnosisDescr
          ? _value.diagnosisDescr
          : diagnosisDescr // ignore: cast_nullable_to_non_nullable
              as String,
      clinical: freezed == clinical
          ? _value.clinical
          : clinical // ignore: cast_nullable_to_non_nullable
              as bool?,
      lab: freezed == lab
          ? _value.lab
          : lab // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiagnosisModelImplCopyWith<$Res>
    implements $DiagnosisModelCopyWith<$Res> {
  factory _$$DiagnosisModelImplCopyWith(_$DiagnosisModelImpl value,
          $Res Function(_$DiagnosisModelImpl) then) =
      __$$DiagnosisModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int patientId,
      String dateDiagnosed,
      String diagnosisDescr,
      bool? clinical,
      bool? lab});
}

/// @nodoc
class __$$DiagnosisModelImplCopyWithImpl<$Res>
    extends _$DiagnosisModelCopyWithImpl<$Res, _$DiagnosisModelImpl>
    implements _$$DiagnosisModelImplCopyWith<$Res> {
  __$$DiagnosisModelImplCopyWithImpl(
      _$DiagnosisModelImpl _value, $Res Function(_$DiagnosisModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patientId = null,
    Object? dateDiagnosed = null,
    Object? diagnosisDescr = null,
    Object? clinical = freezed,
    Object? lab = freezed,
  }) {
    return _then(_$DiagnosisModelImpl(
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as int,
      dateDiagnosed: null == dateDiagnosed
          ? _value.dateDiagnosed
          : dateDiagnosed // ignore: cast_nullable_to_non_nullable
              as String,
      diagnosisDescr: null == diagnosisDescr
          ? _value.diagnosisDescr
          : diagnosisDescr // ignore: cast_nullable_to_non_nullable
              as String,
      clinical: freezed == clinical
          ? _value.clinical
          : clinical // ignore: cast_nullable_to_non_nullable
              as bool?,
      lab: freezed == lab
          ? _value.lab
          : lab // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiagnosisModelImpl
    with DiagnosticableTreeMixin
    implements _DiagnosisModel {
  const _$DiagnosisModelImpl(
      {required this.patientId,
      required this.dateDiagnosed,
      required this.diagnosisDescr,
      this.clinical,
      this.lab});

  factory _$DiagnosisModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiagnosisModelImplFromJson(json);

  @override
  final int patientId;
  @override
  final String dateDiagnosed;
  @override
  final String diagnosisDescr;
  @override
  final bool? clinical;
  @override
  final bool? lab;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DiagnosisModel(patientId: $patientId, dateDiagnosed: $dateDiagnosed, diagnosisDescr: $diagnosisDescr, clinical: $clinical, lab: $lab)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DiagnosisModel'))
      ..add(DiagnosticsProperty('patientId', patientId))
      ..add(DiagnosticsProperty('dateDiagnosed', dateDiagnosed))
      ..add(DiagnosticsProperty('diagnosisDescr', diagnosisDescr))
      ..add(DiagnosticsProperty('clinical', clinical))
      ..add(DiagnosticsProperty('lab', lab));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagnosisModelImpl &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.dateDiagnosed, dateDiagnosed) ||
                other.dateDiagnosed == dateDiagnosed) &&
            (identical(other.diagnosisDescr, diagnosisDescr) ||
                other.diagnosisDescr == diagnosisDescr) &&
            (identical(other.clinical, clinical) ||
                other.clinical == clinical) &&
            (identical(other.lab, lab) || other.lab == lab));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, patientId, dateDiagnosed, diagnosisDescr, clinical, lab);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagnosisModelImplCopyWith<_$DiagnosisModelImpl> get copyWith =>
      __$$DiagnosisModelImplCopyWithImpl<_$DiagnosisModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiagnosisModelImplToJson(
      this,
    );
  }
}

abstract class _DiagnosisModel implements DiagnosisModel {
  const factory _DiagnosisModel(
      {required final int patientId,
      required final String dateDiagnosed,
      required final String diagnosisDescr,
      final bool? clinical,
      final bool? lab}) = _$DiagnosisModelImpl;

  factory _DiagnosisModel.fromJson(Map<String, dynamic> json) =
      _$DiagnosisModelImpl.fromJson;

  @override
  int get patientId;
  @override
  String get dateDiagnosed;
  @override
  String get diagnosisDescr;
  @override
  bool? get clinical;
  @override
  bool? get lab;
  @override
  @JsonKey(ignore: true)
  _$$DiagnosisModelImplCopyWith<_$DiagnosisModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

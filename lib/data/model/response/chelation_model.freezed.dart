// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chelation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChelationModel _$ChelationModelFromJson(Map<String, dynamic> json) {
  return _ChelationModel.fromJson(json);
}

/// @nodoc
mixin _$ChelationModel {
  int get id => throw _privateConstructorUsedError;
  int get chelationTypeId => throw _privateConstructorUsedError;
  String get chelationTypeDescr => throw _privateConstructorUsedError;
  String get dateStarted => throw _privateConstructorUsedError;
  double? get dosage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChelationModelCopyWith<ChelationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChelationModelCopyWith<$Res> {
  factory $ChelationModelCopyWith(
          ChelationModel value, $Res Function(ChelationModel) then) =
      _$ChelationModelCopyWithImpl<$Res, ChelationModel>;
  @useResult
  $Res call(
      {int id,
      int chelationTypeId,
      String chelationTypeDescr,
      String dateStarted,
      double? dosage});
}

/// @nodoc
class _$ChelationModelCopyWithImpl<$Res, $Val extends ChelationModel>
    implements $ChelationModelCopyWith<$Res> {
  _$ChelationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? chelationTypeId = null,
    Object? chelationTypeDescr = null,
    Object? dateStarted = null,
    Object? dosage = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      chelationTypeId: null == chelationTypeId
          ? _value.chelationTypeId
          : chelationTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      chelationTypeDescr: null == chelationTypeDescr
          ? _value.chelationTypeDescr
          : chelationTypeDescr // ignore: cast_nullable_to_non_nullable
              as String,
      dateStarted: null == dateStarted
          ? _value.dateStarted
          : dateStarted // ignore: cast_nullable_to_non_nullable
              as String,
      dosage: freezed == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChelationModelImplCopyWith<$Res>
    implements $ChelationModelCopyWith<$Res> {
  factory _$$ChelationModelImplCopyWith(_$ChelationModelImpl value,
          $Res Function(_$ChelationModelImpl) then) =
      __$$ChelationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int chelationTypeId,
      String chelationTypeDescr,
      String dateStarted,
      double? dosage});
}

/// @nodoc
class __$$ChelationModelImplCopyWithImpl<$Res>
    extends _$ChelationModelCopyWithImpl<$Res, _$ChelationModelImpl>
    implements _$$ChelationModelImplCopyWith<$Res> {
  __$$ChelationModelImplCopyWithImpl(
      _$ChelationModelImpl _value, $Res Function(_$ChelationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? chelationTypeId = null,
    Object? chelationTypeDescr = null,
    Object? dateStarted = null,
    Object? dosage = freezed,
  }) {
    return _then(_$ChelationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      chelationTypeId: null == chelationTypeId
          ? _value.chelationTypeId
          : chelationTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      chelationTypeDescr: null == chelationTypeDescr
          ? _value.chelationTypeDescr
          : chelationTypeDescr // ignore: cast_nullable_to_non_nullable
              as String,
      dateStarted: null == dateStarted
          ? _value.dateStarted
          : dateStarted // ignore: cast_nullable_to_non_nullable
              as String,
      dosage: freezed == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChelationModelImpl
    with DiagnosticableTreeMixin
    implements _ChelationModel {
  const _$ChelationModelImpl(
      {required this.id,
      required this.chelationTypeId,
      required this.chelationTypeDescr,
      required this.dateStarted,
      this.dosage});

  factory _$ChelationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChelationModelImplFromJson(json);

  @override
  final int id;
  @override
  final int chelationTypeId;
  @override
  final String chelationTypeDescr;
  @override
  final String dateStarted;
  @override
  final double? dosage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChelationModel(id: $id, chelationTypeId: $chelationTypeId, chelationTypeDescr: $chelationTypeDescr, dateStarted: $dateStarted, dosage: $dosage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChelationModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('chelationTypeId', chelationTypeId))
      ..add(DiagnosticsProperty('chelationTypeDescr', chelationTypeDescr))
      ..add(DiagnosticsProperty('dateStarted', dateStarted))
      ..add(DiagnosticsProperty('dosage', dosage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChelationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.chelationTypeId, chelationTypeId) ||
                other.chelationTypeId == chelationTypeId) &&
            (identical(other.chelationTypeDescr, chelationTypeDescr) ||
                other.chelationTypeDescr == chelationTypeDescr) &&
            (identical(other.dateStarted, dateStarted) ||
                other.dateStarted == dateStarted) &&
            (identical(other.dosage, dosage) || other.dosage == dosage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, chelationTypeId,
      chelationTypeDescr, dateStarted, dosage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChelationModelImplCopyWith<_$ChelationModelImpl> get copyWith =>
      __$$ChelationModelImplCopyWithImpl<_$ChelationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChelationModelImplToJson(
      this,
    );
  }
}

abstract class _ChelationModel implements ChelationModel {
  const factory _ChelationModel(
      {required final int id,
      required final int chelationTypeId,
      required final String chelationTypeDescr,
      required final String dateStarted,
      final double? dosage}) = _$ChelationModelImpl;

  factory _ChelationModel.fromJson(Map<String, dynamic> json) =
      _$ChelationModelImpl.fromJson;

  @override
  int get id;
  @override
  int get chelationTypeId;
  @override
  String get chelationTypeDescr;
  @override
  String get dateStarted;
  @override
  double? get dosage;
  @override
  @JsonKey(ignore: true)
  _$$ChelationModelImplCopyWith<_$ChelationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

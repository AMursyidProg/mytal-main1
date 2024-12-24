// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chelation_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddChelationBody _$AddChelationBodyFromJson(Map<String, dynamic> json) {
  return _AddChelationBody.fromJson(json);
}

/// @nodoc
mixin _$AddChelationBody {
  String get dateStarted => throw _privateConstructorUsedError;
  int get chelationTypeId => throw _privateConstructorUsedError;
  String get chelationTypeDescr => throw _privateConstructorUsedError;
  double get dosage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddChelationBodyCopyWith<AddChelationBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddChelationBodyCopyWith<$Res> {
  factory $AddChelationBodyCopyWith(
          AddChelationBody value, $Res Function(AddChelationBody) then) =
      _$AddChelationBodyCopyWithImpl<$Res, AddChelationBody>;
  @useResult
  $Res call(
      {String dateStarted,
      int chelationTypeId,
      String chelationTypeDescr,
      double dosage});
}

/// @nodoc
class _$AddChelationBodyCopyWithImpl<$Res, $Val extends AddChelationBody>
    implements $AddChelationBodyCopyWith<$Res> {
  _$AddChelationBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateStarted = null,
    Object? chelationTypeId = null,
    Object? chelationTypeDescr = null,
    Object? dosage = null,
  }) {
    return _then(_value.copyWith(
      dateStarted: null == dateStarted
          ? _value.dateStarted
          : dateStarted // ignore: cast_nullable_to_non_nullable
              as String,
      chelationTypeId: null == chelationTypeId
          ? _value.chelationTypeId
          : chelationTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      chelationTypeDescr: null == chelationTypeDescr
          ? _value.chelationTypeDescr
          : chelationTypeDescr // ignore: cast_nullable_to_non_nullable
              as String,
      dosage: null == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddChelationBodyImplCopyWith<$Res>
    implements $AddChelationBodyCopyWith<$Res> {
  factory _$$AddChelationBodyImplCopyWith(_$AddChelationBodyImpl value,
          $Res Function(_$AddChelationBodyImpl) then) =
      __$$AddChelationBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String dateStarted,
      int chelationTypeId,
      String chelationTypeDescr,
      double dosage});
}

/// @nodoc
class __$$AddChelationBodyImplCopyWithImpl<$Res>
    extends _$AddChelationBodyCopyWithImpl<$Res, _$AddChelationBodyImpl>
    implements _$$AddChelationBodyImplCopyWith<$Res> {
  __$$AddChelationBodyImplCopyWithImpl(_$AddChelationBodyImpl _value,
      $Res Function(_$AddChelationBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateStarted = null,
    Object? chelationTypeId = null,
    Object? chelationTypeDescr = null,
    Object? dosage = null,
  }) {
    return _then(_$AddChelationBodyImpl(
      dateStarted: null == dateStarted
          ? _value.dateStarted
          : dateStarted // ignore: cast_nullable_to_non_nullable
              as String,
      chelationTypeId: null == chelationTypeId
          ? _value.chelationTypeId
          : chelationTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      chelationTypeDescr: null == chelationTypeDescr
          ? _value.chelationTypeDescr
          : chelationTypeDescr // ignore: cast_nullable_to_non_nullable
              as String,
      dosage: null == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddChelationBodyImpl
    with DiagnosticableTreeMixin
    implements _AddChelationBody {
  const _$AddChelationBodyImpl(
      {required this.dateStarted,
      required this.chelationTypeId,
      required this.chelationTypeDescr,
      required this.dosage});

  factory _$AddChelationBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddChelationBodyImplFromJson(json);

  @override
  final String dateStarted;
  @override
  final int chelationTypeId;
  @override
  final String chelationTypeDescr;
  @override
  final double dosage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddChelationBody(dateStarted: $dateStarted, chelationTypeId: $chelationTypeId, chelationTypeDescr: $chelationTypeDescr, dosage: $dosage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddChelationBody'))
      ..add(DiagnosticsProperty('dateStarted', dateStarted))
      ..add(DiagnosticsProperty('chelationTypeId', chelationTypeId))
      ..add(DiagnosticsProperty('chelationTypeDescr', chelationTypeDescr))
      ..add(DiagnosticsProperty('dosage', dosage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddChelationBodyImpl &&
            (identical(other.dateStarted, dateStarted) ||
                other.dateStarted == dateStarted) &&
            (identical(other.chelationTypeId, chelationTypeId) ||
                other.chelationTypeId == chelationTypeId) &&
            (identical(other.chelationTypeDescr, chelationTypeDescr) ||
                other.chelationTypeDescr == chelationTypeDescr) &&
            (identical(other.dosage, dosage) || other.dosage == dosage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, dateStarted, chelationTypeId, chelationTypeDescr, dosage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddChelationBodyImplCopyWith<_$AddChelationBodyImpl> get copyWith =>
      __$$AddChelationBodyImplCopyWithImpl<_$AddChelationBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddChelationBodyImplToJson(
      this,
    );
  }
}

abstract class _AddChelationBody implements AddChelationBody {
  const factory _AddChelationBody(
      {required final String dateStarted,
      required final int chelationTypeId,
      required final String chelationTypeDescr,
      required final double dosage}) = _$AddChelationBodyImpl;

  factory _AddChelationBody.fromJson(Map<String, dynamic> json) =
      _$AddChelationBodyImpl.fromJson;

  @override
  String get dateStarted;
  @override
  int get chelationTypeId;
  @override
  String get chelationTypeDescr;
  @override
  double get dosage;
  @override
  @JsonKey(ignore: true)
  _$$AddChelationBodyImplCopyWith<_$AddChelationBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EditChelationBody _$EditChelationBodyFromJson(Map<String, dynamic> json) {
  return _EditChelationBody.fromJson(json);
}

/// @nodoc
mixin _$EditChelationBody {
  int get id => throw _privateConstructorUsedError;
  String get dateStarted => throw _privateConstructorUsedError;
  int get chelationTypeId => throw _privateConstructorUsedError;
  String get chelationTypeDescr => throw _privateConstructorUsedError;
  double get dosage => throw _privateConstructorUsedError;
  int? get patientId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditChelationBodyCopyWith<EditChelationBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditChelationBodyCopyWith<$Res> {
  factory $EditChelationBodyCopyWith(
          EditChelationBody value, $Res Function(EditChelationBody) then) =
      _$EditChelationBodyCopyWithImpl<$Res, EditChelationBody>;
  @useResult
  $Res call(
      {int id,
      String dateStarted,
      int chelationTypeId,
      String chelationTypeDescr,
      double dosage,
      int? patientId});
}

/// @nodoc
class _$EditChelationBodyCopyWithImpl<$Res, $Val extends EditChelationBody>
    implements $EditChelationBodyCopyWith<$Res> {
  _$EditChelationBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dateStarted = null,
    Object? chelationTypeId = null,
    Object? chelationTypeDescr = null,
    Object? dosage = null,
    Object? patientId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dateStarted: null == dateStarted
          ? _value.dateStarted
          : dateStarted // ignore: cast_nullable_to_non_nullable
              as String,
      chelationTypeId: null == chelationTypeId
          ? _value.chelationTypeId
          : chelationTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      chelationTypeDescr: null == chelationTypeDescr
          ? _value.chelationTypeDescr
          : chelationTypeDescr // ignore: cast_nullable_to_non_nullable
              as String,
      dosage: null == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as double,
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditChelationBodyImplCopyWith<$Res>
    implements $EditChelationBodyCopyWith<$Res> {
  factory _$$EditChelationBodyImplCopyWith(_$EditChelationBodyImpl value,
          $Res Function(_$EditChelationBodyImpl) then) =
      __$$EditChelationBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String dateStarted,
      int chelationTypeId,
      String chelationTypeDescr,
      double dosage,
      int? patientId});
}

/// @nodoc
class __$$EditChelationBodyImplCopyWithImpl<$Res>
    extends _$EditChelationBodyCopyWithImpl<$Res, _$EditChelationBodyImpl>
    implements _$$EditChelationBodyImplCopyWith<$Res> {
  __$$EditChelationBodyImplCopyWithImpl(_$EditChelationBodyImpl _value,
      $Res Function(_$EditChelationBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dateStarted = null,
    Object? chelationTypeId = null,
    Object? chelationTypeDescr = null,
    Object? dosage = null,
    Object? patientId = freezed,
  }) {
    return _then(_$EditChelationBodyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dateStarted: null == dateStarted
          ? _value.dateStarted
          : dateStarted // ignore: cast_nullable_to_non_nullable
              as String,
      chelationTypeId: null == chelationTypeId
          ? _value.chelationTypeId
          : chelationTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      chelationTypeDescr: null == chelationTypeDescr
          ? _value.chelationTypeDescr
          : chelationTypeDescr // ignore: cast_nullable_to_non_nullable
              as String,
      dosage: null == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as double,
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EditChelationBodyImpl
    with DiagnosticableTreeMixin
    implements _EditChelationBody {
  const _$EditChelationBodyImpl(
      {required this.id,
      required this.dateStarted,
      required this.chelationTypeId,
      required this.chelationTypeDescr,
      required this.dosage,
      this.patientId});

  factory _$EditChelationBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditChelationBodyImplFromJson(json);

  @override
  final int id;
  @override
  final String dateStarted;
  @override
  final int chelationTypeId;
  @override
  final String chelationTypeDescr;
  @override
  final double dosage;
  @override
  final int? patientId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditChelationBody(id: $id, dateStarted: $dateStarted, chelationTypeId: $chelationTypeId, chelationTypeDescr: $chelationTypeDescr, dosage: $dosage, patientId: $patientId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EditChelationBody'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('dateStarted', dateStarted))
      ..add(DiagnosticsProperty('chelationTypeId', chelationTypeId))
      ..add(DiagnosticsProperty('chelationTypeDescr', chelationTypeDescr))
      ..add(DiagnosticsProperty('dosage', dosage))
      ..add(DiagnosticsProperty('patientId', patientId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditChelationBodyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dateStarted, dateStarted) ||
                other.dateStarted == dateStarted) &&
            (identical(other.chelationTypeId, chelationTypeId) ||
                other.chelationTypeId == chelationTypeId) &&
            (identical(other.chelationTypeDescr, chelationTypeDescr) ||
                other.chelationTypeDescr == chelationTypeDescr) &&
            (identical(other.dosage, dosage) || other.dosage == dosage) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, dateStarted, chelationTypeId,
      chelationTypeDescr, dosage, patientId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditChelationBodyImplCopyWith<_$EditChelationBodyImpl> get copyWith =>
      __$$EditChelationBodyImplCopyWithImpl<_$EditChelationBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EditChelationBodyImplToJson(
      this,
    );
  }
}

abstract class _EditChelationBody implements EditChelationBody {
  const factory _EditChelationBody(
      {required final int id,
      required final String dateStarted,
      required final int chelationTypeId,
      required final String chelationTypeDescr,
      required final double dosage,
      final int? patientId}) = _$EditChelationBodyImpl;

  factory _EditChelationBody.fromJson(Map<String, dynamic> json) =
      _$EditChelationBodyImpl.fromJson;

  @override
  int get id;
  @override
  String get dateStarted;
  @override
  int get chelationTypeId;
  @override
  String get chelationTypeDescr;
  @override
  double get dosage;
  @override
  int? get patientId;
  @override
  @JsonKey(ignore: true)
  _$$EditChelationBodyImplCopyWith<_$EditChelationBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ferritin_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddFerritinBody _$AddFerritinBodyFromJson(Map<String, dynamic> json) {
  return _AddFerritinBody.fromJson(json);
}

/// @nodoc
mixin _$AddFerritinBody {
  String get dateMeasured => throw _privateConstructorUsedError;
  double get level => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddFerritinBodyCopyWith<AddFerritinBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddFerritinBodyCopyWith<$Res> {
  factory $AddFerritinBodyCopyWith(
          AddFerritinBody value, $Res Function(AddFerritinBody) then) =
      _$AddFerritinBodyCopyWithImpl<$Res, AddFerritinBody>;
  @useResult
  $Res call({String dateMeasured, double level});
}

/// @nodoc
class _$AddFerritinBodyCopyWithImpl<$Res, $Val extends AddFerritinBody>
    implements $AddFerritinBodyCopyWith<$Res> {
  _$AddFerritinBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateMeasured = null,
    Object? level = null,
  }) {
    return _then(_value.copyWith(
      dateMeasured: null == dateMeasured
          ? _value.dateMeasured
          : dateMeasured // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddFerritinBodyImplCopyWith<$Res>
    implements $AddFerritinBodyCopyWith<$Res> {
  factory _$$AddFerritinBodyImplCopyWith(_$AddFerritinBodyImpl value,
          $Res Function(_$AddFerritinBodyImpl) then) =
      __$$AddFerritinBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String dateMeasured, double level});
}

/// @nodoc
class __$$AddFerritinBodyImplCopyWithImpl<$Res>
    extends _$AddFerritinBodyCopyWithImpl<$Res, _$AddFerritinBodyImpl>
    implements _$$AddFerritinBodyImplCopyWith<$Res> {
  __$$AddFerritinBodyImplCopyWithImpl(
      _$AddFerritinBodyImpl _value, $Res Function(_$AddFerritinBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateMeasured = null,
    Object? level = null,
  }) {
    return _then(_$AddFerritinBodyImpl(
      dateMeasured: null == dateMeasured
          ? _value.dateMeasured
          : dateMeasured // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddFerritinBodyImpl
    with DiagnosticableTreeMixin
    implements _AddFerritinBody {
  const _$AddFerritinBodyImpl(
      {required this.dateMeasured, required this.level});

  factory _$AddFerritinBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddFerritinBodyImplFromJson(json);

  @override
  final String dateMeasured;
  @override
  final double level;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddFerritinBody(dateMeasured: $dateMeasured, level: $level)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddFerritinBody'))
      ..add(DiagnosticsProperty('dateMeasured', dateMeasured))
      ..add(DiagnosticsProperty('level', level));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddFerritinBodyImpl &&
            (identical(other.dateMeasured, dateMeasured) ||
                other.dateMeasured == dateMeasured) &&
            (identical(other.level, level) || other.level == level));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dateMeasured, level);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddFerritinBodyImplCopyWith<_$AddFerritinBodyImpl> get copyWith =>
      __$$AddFerritinBodyImplCopyWithImpl<_$AddFerritinBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddFerritinBodyImplToJson(
      this,
    );
  }
}

abstract class _AddFerritinBody implements AddFerritinBody {
  const factory _AddFerritinBody(
      {required final String dateMeasured,
      required final double level}) = _$AddFerritinBodyImpl;

  factory _AddFerritinBody.fromJson(Map<String, dynamic> json) =
      _$AddFerritinBodyImpl.fromJson;

  @override
  String get dateMeasured;
  @override
  double get level;
  @override
  @JsonKey(ignore: true)
  _$$AddFerritinBodyImplCopyWith<_$AddFerritinBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EditFerritinBody _$EditFerritinBodyFromJson(Map<String, dynamic> json) {
  return _EditFerritinBody.fromJson(json);
}

/// @nodoc
mixin _$EditFerritinBody {
  int get id => throw _privateConstructorUsedError;
  String get dateMeasured => throw _privateConstructorUsedError;
  double get level => throw _privateConstructorUsedError;
  int? get patientId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditFerritinBodyCopyWith<EditFerritinBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditFerritinBodyCopyWith<$Res> {
  factory $EditFerritinBodyCopyWith(
          EditFerritinBody value, $Res Function(EditFerritinBody) then) =
      _$EditFerritinBodyCopyWithImpl<$Res, EditFerritinBody>;
  @useResult
  $Res call({int id, String dateMeasured, double level, int? patientId});
}

/// @nodoc
class _$EditFerritinBodyCopyWithImpl<$Res, $Val extends EditFerritinBody>
    implements $EditFerritinBodyCopyWith<$Res> {
  _$EditFerritinBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dateMeasured = null,
    Object? level = null,
    Object? patientId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dateMeasured: null == dateMeasured
          ? _value.dateMeasured
          : dateMeasured // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as double,
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditFerritinBodyImplCopyWith<$Res>
    implements $EditFerritinBodyCopyWith<$Res> {
  factory _$$EditFerritinBodyImplCopyWith(_$EditFerritinBodyImpl value,
          $Res Function(_$EditFerritinBodyImpl) then) =
      __$$EditFerritinBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String dateMeasured, double level, int? patientId});
}

/// @nodoc
class __$$EditFerritinBodyImplCopyWithImpl<$Res>
    extends _$EditFerritinBodyCopyWithImpl<$Res, _$EditFerritinBodyImpl>
    implements _$$EditFerritinBodyImplCopyWith<$Res> {
  __$$EditFerritinBodyImplCopyWithImpl(_$EditFerritinBodyImpl _value,
      $Res Function(_$EditFerritinBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dateMeasured = null,
    Object? level = null,
    Object? patientId = freezed,
  }) {
    return _then(_$EditFerritinBodyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dateMeasured: null == dateMeasured
          ? _value.dateMeasured
          : dateMeasured // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
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
class _$EditFerritinBodyImpl
    with DiagnosticableTreeMixin
    implements _EditFerritinBody {
  const _$EditFerritinBodyImpl(
      {required this.id,
      required this.dateMeasured,
      required this.level,
      this.patientId});

  factory _$EditFerritinBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditFerritinBodyImplFromJson(json);

  @override
  final int id;
  @override
  final String dateMeasured;
  @override
  final double level;
  @override
  final int? patientId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditFerritinBody(id: $id, dateMeasured: $dateMeasured, level: $level, patientId: $patientId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EditFerritinBody'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('dateMeasured', dateMeasured))
      ..add(DiagnosticsProperty('level', level))
      ..add(DiagnosticsProperty('patientId', patientId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditFerritinBodyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dateMeasured, dateMeasured) ||
                other.dateMeasured == dateMeasured) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, dateMeasured, level, patientId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditFerritinBodyImplCopyWith<_$EditFerritinBodyImpl> get copyWith =>
      __$$EditFerritinBodyImplCopyWithImpl<_$EditFerritinBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EditFerritinBodyImplToJson(
      this,
    );
  }
}

abstract class _EditFerritinBody implements EditFerritinBody {
  const factory _EditFerritinBody(
      {required final int id,
      required final String dateMeasured,
      required final double level,
      final int? patientId}) = _$EditFerritinBodyImpl;

  factory _EditFerritinBody.fromJson(Map<String, dynamic> json) =
      _$EditFerritinBodyImpl.fromJson;

  @override
  int get id;
  @override
  String get dateMeasured;
  @override
  double get level;
  @override
  int? get patientId;
  @override
  @JsonKey(ignore: true)
  _$$EditFerritinBodyImplCopyWith<_$EditFerritinBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

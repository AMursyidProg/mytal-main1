// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mri_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddMriBody _$AddMriBodyFromJson(Map<String, dynamic> json) {
  return _AddMriBody.fromJson(json);
}

/// @nodoc
mixin _$AddMriBody {
  String get dateMri => throw _privateConstructorUsedError;
  int get micSeverityId => throw _privateConstructorUsedError;
  double get mic => throw _privateConstructorUsedError;
  int get licSeverityId => throw _privateConstructorUsedError;
  double get lic => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddMriBodyCopyWith<AddMriBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddMriBodyCopyWith<$Res> {
  factory $AddMriBodyCopyWith(
          AddMriBody value, $Res Function(AddMriBody) then) =
      _$AddMriBodyCopyWithImpl<$Res, AddMriBody>;
  @useResult
  $Res call(
      {String dateMri,
      int micSeverityId,
      double mic,
      int licSeverityId,
      double lic});
}

/// @nodoc
class _$AddMriBodyCopyWithImpl<$Res, $Val extends AddMriBody>
    implements $AddMriBodyCopyWith<$Res> {
  _$AddMriBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateMri = null,
    Object? micSeverityId = null,
    Object? mic = null,
    Object? licSeverityId = null,
    Object? lic = null,
  }) {
    return _then(_value.copyWith(
      dateMri: null == dateMri
          ? _value.dateMri
          : dateMri // ignore: cast_nullable_to_non_nullable
              as String,
      micSeverityId: null == micSeverityId
          ? _value.micSeverityId
          : micSeverityId // ignore: cast_nullable_to_non_nullable
              as int,
      mic: null == mic
          ? _value.mic
          : mic // ignore: cast_nullable_to_non_nullable
              as double,
      licSeverityId: null == licSeverityId
          ? _value.licSeverityId
          : licSeverityId // ignore: cast_nullable_to_non_nullable
              as int,
      lic: null == lic
          ? _value.lic
          : lic // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddMriBodyImplCopyWith<$Res>
    implements $AddMriBodyCopyWith<$Res> {
  factory _$$AddMriBodyImplCopyWith(
          _$AddMriBodyImpl value, $Res Function(_$AddMriBodyImpl) then) =
      __$$AddMriBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String dateMri,
      int micSeverityId,
      double mic,
      int licSeverityId,
      double lic});
}

/// @nodoc
class __$$AddMriBodyImplCopyWithImpl<$Res>
    extends _$AddMriBodyCopyWithImpl<$Res, _$AddMriBodyImpl>
    implements _$$AddMriBodyImplCopyWith<$Res> {
  __$$AddMriBodyImplCopyWithImpl(
      _$AddMriBodyImpl _value, $Res Function(_$AddMriBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateMri = null,
    Object? micSeverityId = null,
    Object? mic = null,
    Object? licSeverityId = null,
    Object? lic = null,
  }) {
    return _then(_$AddMriBodyImpl(
      dateMri: null == dateMri
          ? _value.dateMri
          : dateMri // ignore: cast_nullable_to_non_nullable
              as String,
      micSeverityId: null == micSeverityId
          ? _value.micSeverityId
          : micSeverityId // ignore: cast_nullable_to_non_nullable
              as int,
      mic: null == mic
          ? _value.mic
          : mic // ignore: cast_nullable_to_non_nullable
              as double,
      licSeverityId: null == licSeverityId
          ? _value.licSeverityId
          : licSeverityId // ignore: cast_nullable_to_non_nullable
              as int,
      lic: null == lic
          ? _value.lic
          : lic // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddMriBodyImpl with DiagnosticableTreeMixin implements _AddMriBody {
  const _$AddMriBodyImpl(
      {required this.dateMri,
      required this.micSeverityId,
      required this.mic,
      required this.licSeverityId,
      required this.lic});

  factory _$AddMriBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddMriBodyImplFromJson(json);

  @override
  final String dateMri;
  @override
  final int micSeverityId;
  @override
  final double mic;
  @override
  final int licSeverityId;
  @override
  final double lic;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddMriBody(dateMri: $dateMri, micSeverityId: $micSeverityId, mic: $mic, licSeverityId: $licSeverityId, lic: $lic)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddMriBody'))
      ..add(DiagnosticsProperty('dateMri', dateMri))
      ..add(DiagnosticsProperty('micSeverityId', micSeverityId))
      ..add(DiagnosticsProperty('mic', mic))
      ..add(DiagnosticsProperty('licSeverityId', licSeverityId))
      ..add(DiagnosticsProperty('lic', lic));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddMriBodyImpl &&
            (identical(other.dateMri, dateMri) || other.dateMri == dateMri) &&
            (identical(other.micSeverityId, micSeverityId) ||
                other.micSeverityId == micSeverityId) &&
            (identical(other.mic, mic) || other.mic == mic) &&
            (identical(other.licSeverityId, licSeverityId) ||
                other.licSeverityId == licSeverityId) &&
            (identical(other.lic, lic) || other.lic == lic));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, dateMri, micSeverityId, mic, licSeverityId, lic);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddMriBodyImplCopyWith<_$AddMriBodyImpl> get copyWith =>
      __$$AddMriBodyImplCopyWithImpl<_$AddMriBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddMriBodyImplToJson(
      this,
    );
  }
}

abstract class _AddMriBody implements AddMriBody {
  const factory _AddMriBody(
      {required final String dateMri,
      required final int micSeverityId,
      required final double mic,
      required final int licSeverityId,
      required final double lic}) = _$AddMriBodyImpl;

  factory _AddMriBody.fromJson(Map<String, dynamic> json) =
      _$AddMriBodyImpl.fromJson;

  @override
  String get dateMri;
  @override
  int get micSeverityId;
  @override
  double get mic;
  @override
  int get licSeverityId;
  @override
  double get lic;
  @override
  @JsonKey(ignore: true)
  _$$AddMriBodyImplCopyWith<_$AddMriBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EditMriBody _$EditMriBodyFromJson(Map<String, dynamic> json) {
  return _EditMriBody.fromJson(json);
}

/// @nodoc
mixin _$EditMriBody {
  int get id => throw _privateConstructorUsedError;
  String get dateMri => throw _privateConstructorUsedError;
  int get micSeverityId => throw _privateConstructorUsedError;
  double get mic => throw _privateConstructorUsedError;
  int get licSeverityId => throw _privateConstructorUsedError;
  double get lic => throw _privateConstructorUsedError;
  int? get patientId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditMriBodyCopyWith<EditMriBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditMriBodyCopyWith<$Res> {
  factory $EditMriBodyCopyWith(
          EditMriBody value, $Res Function(EditMriBody) then) =
      _$EditMriBodyCopyWithImpl<$Res, EditMriBody>;
  @useResult
  $Res call(
      {int id,
      String dateMri,
      int micSeverityId,
      double mic,
      int licSeverityId,
      double lic,
      int? patientId});
}

/// @nodoc
class _$EditMriBodyCopyWithImpl<$Res, $Val extends EditMriBody>
    implements $EditMriBodyCopyWith<$Res> {
  _$EditMriBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dateMri = null,
    Object? micSeverityId = null,
    Object? mic = null,
    Object? licSeverityId = null,
    Object? lic = null,
    Object? patientId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dateMri: null == dateMri
          ? _value.dateMri
          : dateMri // ignore: cast_nullable_to_non_nullable
              as String,
      micSeverityId: null == micSeverityId
          ? _value.micSeverityId
          : micSeverityId // ignore: cast_nullable_to_non_nullable
              as int,
      mic: null == mic
          ? _value.mic
          : mic // ignore: cast_nullable_to_non_nullable
              as double,
      licSeverityId: null == licSeverityId
          ? _value.licSeverityId
          : licSeverityId // ignore: cast_nullable_to_non_nullable
              as int,
      lic: null == lic
          ? _value.lic
          : lic // ignore: cast_nullable_to_non_nullable
              as double,
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditMriBodyImplCopyWith<$Res>
    implements $EditMriBodyCopyWith<$Res> {
  factory _$$EditMriBodyImplCopyWith(
          _$EditMriBodyImpl value, $Res Function(_$EditMriBodyImpl) then) =
      __$$EditMriBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String dateMri,
      int micSeverityId,
      double mic,
      int licSeverityId,
      double lic,
      int? patientId});
}

/// @nodoc
class __$$EditMriBodyImplCopyWithImpl<$Res>
    extends _$EditMriBodyCopyWithImpl<$Res, _$EditMriBodyImpl>
    implements _$$EditMriBodyImplCopyWith<$Res> {
  __$$EditMriBodyImplCopyWithImpl(
      _$EditMriBodyImpl _value, $Res Function(_$EditMriBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dateMri = null,
    Object? micSeverityId = null,
    Object? mic = null,
    Object? licSeverityId = null,
    Object? lic = null,
    Object? patientId = freezed,
  }) {
    return _then(_$EditMriBodyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dateMri: null == dateMri
          ? _value.dateMri
          : dateMri // ignore: cast_nullable_to_non_nullable
              as String,
      micSeverityId: null == micSeverityId
          ? _value.micSeverityId
          : micSeverityId // ignore: cast_nullable_to_non_nullable
              as int,
      mic: null == mic
          ? _value.mic
          : mic // ignore: cast_nullable_to_non_nullable
              as double,
      licSeverityId: null == licSeverityId
          ? _value.licSeverityId
          : licSeverityId // ignore: cast_nullable_to_non_nullable
              as int,
      lic: null == lic
          ? _value.lic
          : lic // ignore: cast_nullable_to_non_nullable
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
class _$EditMriBodyImpl with DiagnosticableTreeMixin implements _EditMriBody {
  const _$EditMriBodyImpl(
      {required this.id,
      required this.dateMri,
      required this.micSeverityId,
      required this.mic,
      required this.licSeverityId,
      required this.lic,
      this.patientId});

  factory _$EditMriBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditMriBodyImplFromJson(json);

  @override
  final int id;
  @override
  final String dateMri;
  @override
  final int micSeverityId;
  @override
  final double mic;
  @override
  final int licSeverityId;
  @override
  final double lic;
  @override
  final int? patientId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditMriBody(id: $id, dateMri: $dateMri, micSeverityId: $micSeverityId, mic: $mic, licSeverityId: $licSeverityId, lic: $lic, patientId: $patientId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EditMriBody'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('dateMri', dateMri))
      ..add(DiagnosticsProperty('micSeverityId', micSeverityId))
      ..add(DiagnosticsProperty('mic', mic))
      ..add(DiagnosticsProperty('licSeverityId', licSeverityId))
      ..add(DiagnosticsProperty('lic', lic))
      ..add(DiagnosticsProperty('patientId', patientId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditMriBodyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dateMri, dateMri) || other.dateMri == dateMri) &&
            (identical(other.micSeverityId, micSeverityId) ||
                other.micSeverityId == micSeverityId) &&
            (identical(other.mic, mic) || other.mic == mic) &&
            (identical(other.licSeverityId, licSeverityId) ||
                other.licSeverityId == licSeverityId) &&
            (identical(other.lic, lic) || other.lic == lic) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, dateMri, micSeverityId, mic,
      licSeverityId, lic, patientId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditMriBodyImplCopyWith<_$EditMriBodyImpl> get copyWith =>
      __$$EditMriBodyImplCopyWithImpl<_$EditMriBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EditMriBodyImplToJson(
      this,
    );
  }
}

abstract class _EditMriBody implements EditMriBody {
  const factory _EditMriBody(
      {required final int id,
      required final String dateMri,
      required final int micSeverityId,
      required final double mic,
      required final int licSeverityId,
      required final double lic,
      final int? patientId}) = _$EditMriBodyImpl;

  factory _EditMriBody.fromJson(Map<String, dynamic> json) =
      _$EditMriBodyImpl.fromJson;

  @override
  int get id;
  @override
  String get dateMri;
  @override
  int get micSeverityId;
  @override
  double get mic;
  @override
  int get licSeverityId;
  @override
  double get lic;
  @override
  int? get patientId;
  @override
  @JsonKey(ignore: true)
  _$$EditMriBodyImplCopyWith<_$EditMriBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mri_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MriModel _$MriModelFromJson(Map<String, dynamic> json) {
  return _MriModel.fromJson(json);
}

/// @nodoc
mixin _$MriModel {
  int get id => throw _privateConstructorUsedError;
  String get dateMri => throw _privateConstructorUsedError;
  int get micSeverityId => throw _privateConstructorUsedError;
  double get mic => throw _privateConstructorUsedError;
  int get licSeverityId => throw _privateConstructorUsedError;
  double get lic => throw _privateConstructorUsedError;
  String? get micSeverityDescr => throw _privateConstructorUsedError;
  String? get licSeverityDescr => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MriModelCopyWith<MriModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MriModelCopyWith<$Res> {
  factory $MriModelCopyWith(MriModel value, $Res Function(MriModel) then) =
      _$MriModelCopyWithImpl<$Res, MriModel>;
  @useResult
  $Res call(
      {int id,
      String dateMri,
      int micSeverityId,
      double mic,
      int licSeverityId,
      double lic,
      String? micSeverityDescr,
      String? licSeverityDescr});
}

/// @nodoc
class _$MriModelCopyWithImpl<$Res, $Val extends MriModel>
    implements $MriModelCopyWith<$Res> {
  _$MriModelCopyWithImpl(this._value, this._then);

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
    Object? micSeverityDescr = freezed,
    Object? licSeverityDescr = freezed,
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
      micSeverityDescr: freezed == micSeverityDescr
          ? _value.micSeverityDescr
          : micSeverityDescr // ignore: cast_nullable_to_non_nullable
              as String?,
      licSeverityDescr: freezed == licSeverityDescr
          ? _value.licSeverityDescr
          : licSeverityDescr // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MriModelImplCopyWith<$Res>
    implements $MriModelCopyWith<$Res> {
  factory _$$MriModelImplCopyWith(
          _$MriModelImpl value, $Res Function(_$MriModelImpl) then) =
      __$$MriModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String dateMri,
      int micSeverityId,
      double mic,
      int licSeverityId,
      double lic,
      String? micSeverityDescr,
      String? licSeverityDescr});
}

/// @nodoc
class __$$MriModelImplCopyWithImpl<$Res>
    extends _$MriModelCopyWithImpl<$Res, _$MriModelImpl>
    implements _$$MriModelImplCopyWith<$Res> {
  __$$MriModelImplCopyWithImpl(
      _$MriModelImpl _value, $Res Function(_$MriModelImpl) _then)
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
    Object? micSeverityDescr = freezed,
    Object? licSeverityDescr = freezed,
  }) {
    return _then(_$MriModelImpl(
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
      micSeverityDescr: freezed == micSeverityDescr
          ? _value.micSeverityDescr
          : micSeverityDescr // ignore: cast_nullable_to_non_nullable
              as String?,
      licSeverityDescr: freezed == licSeverityDescr
          ? _value.licSeverityDescr
          : licSeverityDescr // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MriModelImpl with DiagnosticableTreeMixin implements _MriModel {
  const _$MriModelImpl(
      {required this.id,
      required this.dateMri,
      required this.micSeverityId,
      required this.mic,
      required this.licSeverityId,
      required this.lic,
      this.micSeverityDescr,
      this.licSeverityDescr});

  factory _$MriModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MriModelImplFromJson(json);

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
  final String? micSeverityDescr;
  @override
  final String? licSeverityDescr;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MriModel(id: $id, dateMri: $dateMri, micSeverityId: $micSeverityId, mic: $mic, licSeverityId: $licSeverityId, lic: $lic, micSeverityDescr: $micSeverityDescr, licSeverityDescr: $licSeverityDescr)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MriModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('dateMri', dateMri))
      ..add(DiagnosticsProperty('micSeverityId', micSeverityId))
      ..add(DiagnosticsProperty('mic', mic))
      ..add(DiagnosticsProperty('licSeverityId', licSeverityId))
      ..add(DiagnosticsProperty('lic', lic))
      ..add(DiagnosticsProperty('micSeverityDescr', micSeverityDescr))
      ..add(DiagnosticsProperty('licSeverityDescr', licSeverityDescr));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MriModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dateMri, dateMri) || other.dateMri == dateMri) &&
            (identical(other.micSeverityId, micSeverityId) ||
                other.micSeverityId == micSeverityId) &&
            (identical(other.mic, mic) || other.mic == mic) &&
            (identical(other.licSeverityId, licSeverityId) ||
                other.licSeverityId == licSeverityId) &&
            (identical(other.lic, lic) || other.lic == lic) &&
            (identical(other.micSeverityDescr, micSeverityDescr) ||
                other.micSeverityDescr == micSeverityDescr) &&
            (identical(other.licSeverityDescr, licSeverityDescr) ||
                other.licSeverityDescr == licSeverityDescr));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, dateMri, micSeverityId, mic,
      licSeverityId, lic, micSeverityDescr, licSeverityDescr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MriModelImplCopyWith<_$MriModelImpl> get copyWith =>
      __$$MriModelImplCopyWithImpl<_$MriModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MriModelImplToJson(
      this,
    );
  }
}

abstract class _MriModel implements MriModel {
  const factory _MriModel(
      {required final int id,
      required final String dateMri,
      required final int micSeverityId,
      required final double mic,
      required final int licSeverityId,
      required final double lic,
      final String? micSeverityDescr,
      final String? licSeverityDescr}) = _$MriModelImpl;

  factory _MriModel.fromJson(Map<String, dynamic> json) =
      _$MriModelImpl.fromJson;

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
  String? get micSeverityDescr;
  @override
  String? get licSeverityDescr;
  @override
  @JsonKey(ignore: true)
  _$$MriModelImplCopyWith<_$MriModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

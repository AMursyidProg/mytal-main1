// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mic_severity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MicSeverityModel _$MicSeverityModelFromJson(Map<String, dynamic> json) {
  return _MicSeverityModel.fromJson(json);
}

/// @nodoc
mixin _$MicSeverityModel {
  int get id => throw _privateConstructorUsedError;
  String get severityDescr => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MicSeverityModelCopyWith<MicSeverityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MicSeverityModelCopyWith<$Res> {
  factory $MicSeverityModelCopyWith(
          MicSeverityModel value, $Res Function(MicSeverityModel) then) =
      _$MicSeverityModelCopyWithImpl<$Res, MicSeverityModel>;
  @useResult
  $Res call({int id, String severityDescr});
}

/// @nodoc
class _$MicSeverityModelCopyWithImpl<$Res, $Val extends MicSeverityModel>
    implements $MicSeverityModelCopyWith<$Res> {
  _$MicSeverityModelCopyWithImpl(this._value, this._then);

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
abstract class _$$MicSeverityModelImplCopyWith<$Res>
    implements $MicSeverityModelCopyWith<$Res> {
  factory _$$MicSeverityModelImplCopyWith(_$MicSeverityModelImpl value,
          $Res Function(_$MicSeverityModelImpl) then) =
      __$$MicSeverityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String severityDescr});
}

/// @nodoc
class __$$MicSeverityModelImplCopyWithImpl<$Res>
    extends _$MicSeverityModelCopyWithImpl<$Res, _$MicSeverityModelImpl>
    implements _$$MicSeverityModelImplCopyWith<$Res> {
  __$$MicSeverityModelImplCopyWithImpl(_$MicSeverityModelImpl _value,
      $Res Function(_$MicSeverityModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? severityDescr = null,
  }) {
    return _then(_$MicSeverityModelImpl(
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
class _$MicSeverityModelImpl
    with DiagnosticableTreeMixin
    implements _MicSeverityModel {
  const _$MicSeverityModelImpl({required this.id, required this.severityDescr});

  factory _$MicSeverityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MicSeverityModelImplFromJson(json);

  @override
  final int id;
  @override
  final String severityDescr;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MicSeverityModel(id: $id, severityDescr: $severityDescr)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MicSeverityModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('severityDescr', severityDescr));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MicSeverityModelImpl &&
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
  _$$MicSeverityModelImplCopyWith<_$MicSeverityModelImpl> get copyWith =>
      __$$MicSeverityModelImplCopyWithImpl<_$MicSeverityModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MicSeverityModelImplToJson(
      this,
    );
  }
}

abstract class _MicSeverityModel implements MicSeverityModel {
  const factory _MicSeverityModel(
      {required final int id,
      required final String severityDescr}) = _$MicSeverityModelImpl;

  factory _MicSeverityModel.fromJson(Map<String, dynamic> json) =
      _$MicSeverityModelImpl.fromJson;

  @override
  int get id;
  @override
  String get severityDescr;
  @override
  @JsonKey(ignore: true)
  _$$MicSeverityModelImplCopyWith<_$MicSeverityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

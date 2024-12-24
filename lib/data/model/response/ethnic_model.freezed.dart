// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ethnic_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EthnicModel _$EthnicModelFromJson(Map<String, dynamic> json) {
  return _EthnicModel.fromJson(json);
}

/// @nodoc
mixin _$EthnicModel {
  int get id => throw _privateConstructorUsedError;
  String get ethnicDescr => throw _privateConstructorUsedError;
  String get tenantId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EthnicModelCopyWith<EthnicModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EthnicModelCopyWith<$Res> {
  factory $EthnicModelCopyWith(
          EthnicModel value, $Res Function(EthnicModel) then) =
      _$EthnicModelCopyWithImpl<$Res, EthnicModel>;
  @useResult
  $Res call({int id, String ethnicDescr, String tenantId});
}

/// @nodoc
class _$EthnicModelCopyWithImpl<$Res, $Val extends EthnicModel>
    implements $EthnicModelCopyWith<$Res> {
  _$EthnicModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ethnicDescr = null,
    Object? tenantId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ethnicDescr: null == ethnicDescr
          ? _value.ethnicDescr
          : ethnicDescr // ignore: cast_nullable_to_non_nullable
              as String,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EthnicModelImplCopyWith<$Res>
    implements $EthnicModelCopyWith<$Res> {
  factory _$$EthnicModelImplCopyWith(
          _$EthnicModelImpl value, $Res Function(_$EthnicModelImpl) then) =
      __$$EthnicModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String ethnicDescr, String tenantId});
}

/// @nodoc
class __$$EthnicModelImplCopyWithImpl<$Res>
    extends _$EthnicModelCopyWithImpl<$Res, _$EthnicModelImpl>
    implements _$$EthnicModelImplCopyWith<$Res> {
  __$$EthnicModelImplCopyWithImpl(
      _$EthnicModelImpl _value, $Res Function(_$EthnicModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ethnicDescr = null,
    Object? tenantId = null,
  }) {
    return _then(_$EthnicModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ethnicDescr: null == ethnicDescr
          ? _value.ethnicDescr
          : ethnicDescr // ignore: cast_nullable_to_non_nullable
              as String,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EthnicModelImpl with DiagnosticableTreeMixin implements _EthnicModel {
  const _$EthnicModelImpl(
      {required this.id, required this.ethnicDescr, required this.tenantId});

  factory _$EthnicModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EthnicModelImplFromJson(json);

  @override
  final int id;
  @override
  final String ethnicDescr;
  @override
  final String tenantId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EthnicModel(id: $id, ethnicDescr: $ethnicDescr, tenantId: $tenantId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EthnicModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('ethnicDescr', ethnicDescr))
      ..add(DiagnosticsProperty('tenantId', tenantId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EthnicModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ethnicDescr, ethnicDescr) ||
                other.ethnicDescr == ethnicDescr) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, ethnicDescr, tenantId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EthnicModelImplCopyWith<_$EthnicModelImpl> get copyWith =>
      __$$EthnicModelImplCopyWithImpl<_$EthnicModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EthnicModelImplToJson(
      this,
    );
  }
}

abstract class _EthnicModel implements EthnicModel {
  const factory _EthnicModel(
      {required final int id,
      required final String ethnicDescr,
      required final String tenantId}) = _$EthnicModelImpl;

  factory _EthnicModel.fromJson(Map<String, dynamic> json) =
      _$EthnicModelImpl.fromJson;

  @override
  int get id;
  @override
  String get ethnicDescr;
  @override
  String get tenantId;
  @override
  @JsonKey(ignore: true)
  _$$EthnicModelImplCopyWith<_$EthnicModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

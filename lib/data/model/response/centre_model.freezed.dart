// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'centre_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CentreModel _$CentreModelFromJson(Map<String, dynamic> json) {
  return _CentreModel.fromJson(json);
}

/// @nodoc
mixin _$CentreModel {
  int get id => throw _privateConstructorUsedError;
  int get stateId => throw _privateConstructorUsedError;
  String get tenantId => throw _privateConstructorUsedError;
  String get centreName => throw _privateConstructorUsedError;
  String get shortName => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CentreModelCopyWith<CentreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CentreModelCopyWith<$Res> {
  factory $CentreModelCopyWith(
          CentreModel value, $Res Function(CentreModel) then) =
      _$CentreModelCopyWithImpl<$Res, CentreModel>;
  @useResult
  $Res call(
      {int id,
      int stateId,
      String tenantId,
      String centreName,
      String shortName,
      bool active});
}

/// @nodoc
class _$CentreModelCopyWithImpl<$Res, $Val extends CentreModel>
    implements $CentreModelCopyWith<$Res> {
  _$CentreModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? stateId = null,
    Object? tenantId = null,
    Object? centreName = null,
    Object? shortName = null,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      stateId: null == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      centreName: null == centreName
          ? _value.centreName
          : centreName // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CentreModelImplCopyWith<$Res>
    implements $CentreModelCopyWith<$Res> {
  factory _$$CentreModelImplCopyWith(
          _$CentreModelImpl value, $Res Function(_$CentreModelImpl) then) =
      __$$CentreModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int stateId,
      String tenantId,
      String centreName,
      String shortName,
      bool active});
}

/// @nodoc
class __$$CentreModelImplCopyWithImpl<$Res>
    extends _$CentreModelCopyWithImpl<$Res, _$CentreModelImpl>
    implements _$$CentreModelImplCopyWith<$Res> {
  __$$CentreModelImplCopyWithImpl(
      _$CentreModelImpl _value, $Res Function(_$CentreModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? stateId = null,
    Object? tenantId = null,
    Object? centreName = null,
    Object? shortName = null,
    Object? active = null,
  }) {
    return _then(_$CentreModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      stateId: null == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      centreName: null == centreName
          ? _value.centreName
          : centreName // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CentreModelImpl with DiagnosticableTreeMixin implements _CentreModel {
  const _$CentreModelImpl(
      {required this.id,
      required this.stateId,
      required this.tenantId,
      required this.centreName,
      required this.shortName,
      required this.active});

  factory _$CentreModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CentreModelImplFromJson(json);

  @override
  final int id;
  @override
  final int stateId;
  @override
  final String tenantId;
  @override
  final String centreName;
  @override
  final String shortName;
  @override
  final bool active;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CentreModel(id: $id, stateId: $stateId, tenantId: $tenantId, centreName: $centreName, shortName: $shortName, active: $active)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CentreModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('stateId', stateId))
      ..add(DiagnosticsProperty('tenantId', tenantId))
      ..add(DiagnosticsProperty('centreName', centreName))
      ..add(DiagnosticsProperty('shortName', shortName))
      ..add(DiagnosticsProperty('active', active));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CentreModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stateId, stateId) || other.stateId == stateId) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.centreName, centreName) ||
                other.centreName == centreName) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, stateId, tenantId, centreName, shortName, active);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CentreModelImplCopyWith<_$CentreModelImpl> get copyWith =>
      __$$CentreModelImplCopyWithImpl<_$CentreModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CentreModelImplToJson(
      this,
    );
  }
}

abstract class _CentreModel implements CentreModel {
  const factory _CentreModel(
      {required final int id,
      required final int stateId,
      required final String tenantId,
      required final String centreName,
      required final String shortName,
      required final bool active}) = _$CentreModelImpl;

  factory _CentreModel.fromJson(Map<String, dynamic> json) =
      _$CentreModelImpl.fromJson;

  @override
  int get id;
  @override
  int get stateId;
  @override
  String get tenantId;
  @override
  String get centreName;
  @override
  String get shortName;
  @override
  bool get active;
  @override
  @JsonKey(ignore: true)
  _$$CentreModelImplCopyWith<_$CentreModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

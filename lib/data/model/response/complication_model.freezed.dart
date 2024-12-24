// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complication_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ComplicationModel _$ComplicationModelFromJson(Map<String, dynamic> json) {
  return _ComplicationModel.fromJson(json);
}

/// @nodoc
mixin _$ComplicationModel {
  int get id => throw _privateConstructorUsedError;
  int get complicationTypeId => throw _privateConstructorUsedError;
  int get complicationStatusId => throw _privateConstructorUsedError;
  String get complicationStatusDescr => throw _privateConstructorUsedError;
  String get complicationTypeDescr => throw _privateConstructorUsedError;
  String? get dateComplication => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComplicationModelCopyWith<ComplicationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComplicationModelCopyWith<$Res> {
  factory $ComplicationModelCopyWith(
          ComplicationModel value, $Res Function(ComplicationModel) then) =
      _$ComplicationModelCopyWithImpl<$Res, ComplicationModel>;
  @useResult
  $Res call(
      {int id,
      int complicationTypeId,
      int complicationStatusId,
      String complicationStatusDescr,
      String complicationTypeDescr,
      String? dateComplication});
}

/// @nodoc
class _$ComplicationModelCopyWithImpl<$Res, $Val extends ComplicationModel>
    implements $ComplicationModelCopyWith<$Res> {
  _$ComplicationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? complicationTypeId = null,
    Object? complicationStatusId = null,
    Object? complicationStatusDescr = null,
    Object? complicationTypeDescr = null,
    Object? dateComplication = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      complicationTypeId: null == complicationTypeId
          ? _value.complicationTypeId
          : complicationTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      complicationStatusId: null == complicationStatusId
          ? _value.complicationStatusId
          : complicationStatusId // ignore: cast_nullable_to_non_nullable
              as int,
      complicationStatusDescr: null == complicationStatusDescr
          ? _value.complicationStatusDescr
          : complicationStatusDescr // ignore: cast_nullable_to_non_nullable
              as String,
      complicationTypeDescr: null == complicationTypeDescr
          ? _value.complicationTypeDescr
          : complicationTypeDescr // ignore: cast_nullable_to_non_nullable
              as String,
      dateComplication: freezed == dateComplication
          ? _value.dateComplication
          : dateComplication // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ComplicationModelImplCopyWith<$Res>
    implements $ComplicationModelCopyWith<$Res> {
  factory _$$ComplicationModelImplCopyWith(_$ComplicationModelImpl value,
          $Res Function(_$ComplicationModelImpl) then) =
      __$$ComplicationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int complicationTypeId,
      int complicationStatusId,
      String complicationStatusDescr,
      String complicationTypeDescr,
      String? dateComplication});
}

/// @nodoc
class __$$ComplicationModelImplCopyWithImpl<$Res>
    extends _$ComplicationModelCopyWithImpl<$Res, _$ComplicationModelImpl>
    implements _$$ComplicationModelImplCopyWith<$Res> {
  __$$ComplicationModelImplCopyWithImpl(_$ComplicationModelImpl _value,
      $Res Function(_$ComplicationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? complicationTypeId = null,
    Object? complicationStatusId = null,
    Object? complicationStatusDescr = null,
    Object? complicationTypeDescr = null,
    Object? dateComplication = freezed,
  }) {
    return _then(_$ComplicationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      complicationTypeId: null == complicationTypeId
          ? _value.complicationTypeId
          : complicationTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      complicationStatusId: null == complicationStatusId
          ? _value.complicationStatusId
          : complicationStatusId // ignore: cast_nullable_to_non_nullable
              as int,
      complicationStatusDescr: null == complicationStatusDescr
          ? _value.complicationStatusDescr
          : complicationStatusDescr // ignore: cast_nullable_to_non_nullable
              as String,
      complicationTypeDescr: null == complicationTypeDescr
          ? _value.complicationTypeDescr
          : complicationTypeDescr // ignore: cast_nullable_to_non_nullable
              as String,
      dateComplication: freezed == dateComplication
          ? _value.dateComplication
          : dateComplication // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ComplicationModelImpl
    with DiagnosticableTreeMixin
    implements _ComplicationModel {
  const _$ComplicationModelImpl(
      {required this.id,
      required this.complicationTypeId,
      required this.complicationStatusId,
      required this.complicationStatusDescr,
      required this.complicationTypeDescr,
      this.dateComplication});

  factory _$ComplicationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComplicationModelImplFromJson(json);

  @override
  final int id;
  @override
  final int complicationTypeId;
  @override
  final int complicationStatusId;
  @override
  final String complicationStatusDescr;
  @override
  final String complicationTypeDescr;
  @override
  final String? dateComplication;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ComplicationModel(id: $id, complicationTypeId: $complicationTypeId, complicationStatusId: $complicationStatusId, complicationStatusDescr: $complicationStatusDescr, complicationTypeDescr: $complicationTypeDescr, dateComplication: $dateComplication)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ComplicationModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('complicationTypeId', complicationTypeId))
      ..add(DiagnosticsProperty('complicationStatusId', complicationStatusId))
      ..add(DiagnosticsProperty(
          'complicationStatusDescr', complicationStatusDescr))
      ..add(DiagnosticsProperty('complicationTypeDescr', complicationTypeDescr))
      ..add(DiagnosticsProperty('dateComplication', dateComplication));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComplicationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.complicationTypeId, complicationTypeId) ||
                other.complicationTypeId == complicationTypeId) &&
            (identical(other.complicationStatusId, complicationStatusId) ||
                other.complicationStatusId == complicationStatusId) &&
            (identical(
                    other.complicationStatusDescr, complicationStatusDescr) ||
                other.complicationStatusDescr == complicationStatusDescr) &&
            (identical(other.complicationTypeDescr, complicationTypeDescr) ||
                other.complicationTypeDescr == complicationTypeDescr) &&
            (identical(other.dateComplication, dateComplication) ||
                other.dateComplication == dateComplication));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      complicationTypeId,
      complicationStatusId,
      complicationStatusDescr,
      complicationTypeDescr,
      dateComplication);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComplicationModelImplCopyWith<_$ComplicationModelImpl> get copyWith =>
      __$$ComplicationModelImplCopyWithImpl<_$ComplicationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComplicationModelImplToJson(
      this,
    );
  }
}

abstract class _ComplicationModel implements ComplicationModel {
  const factory _ComplicationModel(
      {required final int id,
      required final int complicationTypeId,
      required final int complicationStatusId,
      required final String complicationStatusDescr,
      required final String complicationTypeDescr,
      final String? dateComplication}) = _$ComplicationModelImpl;

  factory _ComplicationModel.fromJson(Map<String, dynamic> json) =
      _$ComplicationModelImpl.fromJson;

  @override
  int get id;
  @override
  int get complicationTypeId;
  @override
  int get complicationStatusId;
  @override
  String get complicationStatusDescr;
  @override
  String get complicationTypeDescr;
  @override
  String? get dateComplication;
  @override
  @JsonKey(ignore: true)
  _$$ComplicationModelImplCopyWith<_$ComplicationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

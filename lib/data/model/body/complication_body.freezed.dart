// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complication_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EditComplicationBody _$EditComplicationBodyFromJson(Map<String, dynamic> json) {
  return _EditComplicationBody.fromJson(json);
}

/// @nodoc
mixin _$EditComplicationBody {
  int get id => throw _privateConstructorUsedError;
  int get complicationStatusId => throw _privateConstructorUsedError;
  int get complicationStatusTypeId => throw _privateConstructorUsedError;
  String get complicationTypeDescr => throw _privateConstructorUsedError;
  int get complicationTypeId => throw _privateConstructorUsedError;
  String? get dateComplication => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditComplicationBodyCopyWith<EditComplicationBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditComplicationBodyCopyWith<$Res> {
  factory $EditComplicationBodyCopyWith(EditComplicationBody value,
          $Res Function(EditComplicationBody) then) =
      _$EditComplicationBodyCopyWithImpl<$Res, EditComplicationBody>;
  @useResult
  $Res call(
      {int id,
      int complicationStatusId,
      int complicationStatusTypeId,
      String complicationTypeDescr,
      int complicationTypeId,
      String? dateComplication});
}

/// @nodoc
class _$EditComplicationBodyCopyWithImpl<$Res,
        $Val extends EditComplicationBody>
    implements $EditComplicationBodyCopyWith<$Res> {
  _$EditComplicationBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? complicationStatusId = null,
    Object? complicationStatusTypeId = null,
    Object? complicationTypeDescr = null,
    Object? complicationTypeId = null,
    Object? dateComplication = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      complicationStatusId: null == complicationStatusId
          ? _value.complicationStatusId
          : complicationStatusId // ignore: cast_nullable_to_non_nullable
              as int,
      complicationStatusTypeId: null == complicationStatusTypeId
          ? _value.complicationStatusTypeId
          : complicationStatusTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      complicationTypeDescr: null == complicationTypeDescr
          ? _value.complicationTypeDescr
          : complicationTypeDescr // ignore: cast_nullable_to_non_nullable
              as String,
      complicationTypeId: null == complicationTypeId
          ? _value.complicationTypeId
          : complicationTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      dateComplication: freezed == dateComplication
          ? _value.dateComplication
          : dateComplication // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditComplicationBodyImplCopyWith<$Res>
    implements $EditComplicationBodyCopyWith<$Res> {
  factory _$$EditComplicationBodyImplCopyWith(_$EditComplicationBodyImpl value,
          $Res Function(_$EditComplicationBodyImpl) then) =
      __$$EditComplicationBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int complicationStatusId,
      int complicationStatusTypeId,
      String complicationTypeDescr,
      int complicationTypeId,
      String? dateComplication});
}

/// @nodoc
class __$$EditComplicationBodyImplCopyWithImpl<$Res>
    extends _$EditComplicationBodyCopyWithImpl<$Res, _$EditComplicationBodyImpl>
    implements _$$EditComplicationBodyImplCopyWith<$Res> {
  __$$EditComplicationBodyImplCopyWithImpl(_$EditComplicationBodyImpl _value,
      $Res Function(_$EditComplicationBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? complicationStatusId = null,
    Object? complicationStatusTypeId = null,
    Object? complicationTypeDescr = null,
    Object? complicationTypeId = null,
    Object? dateComplication = freezed,
  }) {
    return _then(_$EditComplicationBodyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      complicationStatusId: null == complicationStatusId
          ? _value.complicationStatusId
          : complicationStatusId // ignore: cast_nullable_to_non_nullable
              as int,
      complicationStatusTypeId: null == complicationStatusTypeId
          ? _value.complicationStatusTypeId
          : complicationStatusTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      complicationTypeDescr: null == complicationTypeDescr
          ? _value.complicationTypeDescr
          : complicationTypeDescr // ignore: cast_nullable_to_non_nullable
              as String,
      complicationTypeId: null == complicationTypeId
          ? _value.complicationTypeId
          : complicationTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      dateComplication: freezed == dateComplication
          ? _value.dateComplication
          : dateComplication // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EditComplicationBodyImpl
    with DiagnosticableTreeMixin
    implements _EditComplicationBody {
  const _$EditComplicationBodyImpl(
      {required this.id,
      required this.complicationStatusId,
      required this.complicationStatusTypeId,
      required this.complicationTypeDescr,
      required this.complicationTypeId,
      this.dateComplication});

  factory _$EditComplicationBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditComplicationBodyImplFromJson(json);

  @override
  final int id;
  @override
  final int complicationStatusId;
  @override
  final int complicationStatusTypeId;
  @override
  final String complicationTypeDescr;
  @override
  final int complicationTypeId;
  @override
  final String? dateComplication;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditComplicationBody(id: $id, complicationStatusId: $complicationStatusId, complicationStatusTypeId: $complicationStatusTypeId, complicationTypeDescr: $complicationTypeDescr, complicationTypeId: $complicationTypeId, dateComplication: $dateComplication)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EditComplicationBody'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('complicationStatusId', complicationStatusId))
      ..add(DiagnosticsProperty(
          'complicationStatusTypeId', complicationStatusTypeId))
      ..add(DiagnosticsProperty('complicationTypeDescr', complicationTypeDescr))
      ..add(DiagnosticsProperty('complicationTypeId', complicationTypeId))
      ..add(DiagnosticsProperty('dateComplication', dateComplication));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditComplicationBodyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.complicationStatusId, complicationStatusId) ||
                other.complicationStatusId == complicationStatusId) &&
            (identical(
                    other.complicationStatusTypeId, complicationStatusTypeId) ||
                other.complicationStatusTypeId == complicationStatusTypeId) &&
            (identical(other.complicationTypeDescr, complicationTypeDescr) ||
                other.complicationTypeDescr == complicationTypeDescr) &&
            (identical(other.complicationTypeId, complicationTypeId) ||
                other.complicationTypeId == complicationTypeId) &&
            (identical(other.dateComplication, dateComplication) ||
                other.dateComplication == dateComplication));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      complicationStatusId,
      complicationStatusTypeId,
      complicationTypeDescr,
      complicationTypeId,
      dateComplication);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditComplicationBodyImplCopyWith<_$EditComplicationBodyImpl>
      get copyWith =>
          __$$EditComplicationBodyImplCopyWithImpl<_$EditComplicationBodyImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EditComplicationBodyImplToJson(
      this,
    );
  }
}

abstract class _EditComplicationBody implements EditComplicationBody {
  const factory _EditComplicationBody(
      {required final int id,
      required final int complicationStatusId,
      required final int complicationStatusTypeId,
      required final String complicationTypeDescr,
      required final int complicationTypeId,
      final String? dateComplication}) = _$EditComplicationBodyImpl;

  factory _EditComplicationBody.fromJson(Map<String, dynamic> json) =
      _$EditComplicationBodyImpl.fromJson;

  @override
  int get id;
  @override
  int get complicationStatusId;
  @override
  int get complicationStatusTypeId;
  @override
  String get complicationTypeDescr;
  @override
  int get complicationTypeId;
  @override
  String? get dateComplication;
  @override
  @JsonKey(ignore: true)
  _$$EditComplicationBodyImplCopyWith<_$EditComplicationBodyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

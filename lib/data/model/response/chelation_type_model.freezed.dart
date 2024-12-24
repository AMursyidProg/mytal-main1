// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chelation_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChelationTypeModel _$ChelationTypeModelFromJson(Map<String, dynamic> json) {
  return _ChelationTypeModel.fromJson(json);
}

/// @nodoc
mixin _$ChelationTypeModel {
  int get id => throw _privateConstructorUsedError;
  String get chelationTypeDescr => throw _privateConstructorUsedError;
  String get shortname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChelationTypeModelCopyWith<ChelationTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChelationTypeModelCopyWith<$Res> {
  factory $ChelationTypeModelCopyWith(
          ChelationTypeModel value, $Res Function(ChelationTypeModel) then) =
      _$ChelationTypeModelCopyWithImpl<$Res, ChelationTypeModel>;
  @useResult
  $Res call({int id, String chelationTypeDescr, String shortname});
}

/// @nodoc
class _$ChelationTypeModelCopyWithImpl<$Res, $Val extends ChelationTypeModel>
    implements $ChelationTypeModelCopyWith<$Res> {
  _$ChelationTypeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? chelationTypeDescr = null,
    Object? shortname = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      chelationTypeDescr: null == chelationTypeDescr
          ? _value.chelationTypeDescr
          : chelationTypeDescr // ignore: cast_nullable_to_non_nullable
              as String,
      shortname: null == shortname
          ? _value.shortname
          : shortname // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChelationTypeModelImplCopyWith<$Res>
    implements $ChelationTypeModelCopyWith<$Res> {
  factory _$$ChelationTypeModelImplCopyWith(_$ChelationTypeModelImpl value,
          $Res Function(_$ChelationTypeModelImpl) then) =
      __$$ChelationTypeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String chelationTypeDescr, String shortname});
}

/// @nodoc
class __$$ChelationTypeModelImplCopyWithImpl<$Res>
    extends _$ChelationTypeModelCopyWithImpl<$Res, _$ChelationTypeModelImpl>
    implements _$$ChelationTypeModelImplCopyWith<$Res> {
  __$$ChelationTypeModelImplCopyWithImpl(_$ChelationTypeModelImpl _value,
      $Res Function(_$ChelationTypeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? chelationTypeDescr = null,
    Object? shortname = null,
  }) {
    return _then(_$ChelationTypeModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      chelationTypeDescr: null == chelationTypeDescr
          ? _value.chelationTypeDescr
          : chelationTypeDescr // ignore: cast_nullable_to_non_nullable
              as String,
      shortname: null == shortname
          ? _value.shortname
          : shortname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChelationTypeModelImpl
    with DiagnosticableTreeMixin
    implements _ChelationTypeModel {
  const _$ChelationTypeModelImpl(
      {required this.id,
      required this.chelationTypeDescr,
      required this.shortname});

  factory _$ChelationTypeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChelationTypeModelImplFromJson(json);

  @override
  final int id;
  @override
  final String chelationTypeDescr;
  @override
  final String shortname;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChelationTypeModel(id: $id, chelationTypeDescr: $chelationTypeDescr, shortname: $shortname)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChelationTypeModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('chelationTypeDescr', chelationTypeDescr))
      ..add(DiagnosticsProperty('shortname', shortname));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChelationTypeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.chelationTypeDescr, chelationTypeDescr) ||
                other.chelationTypeDescr == chelationTypeDescr) &&
            (identical(other.shortname, shortname) ||
                other.shortname == shortname));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, chelationTypeDescr, shortname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChelationTypeModelImplCopyWith<_$ChelationTypeModelImpl> get copyWith =>
      __$$ChelationTypeModelImplCopyWithImpl<_$ChelationTypeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChelationTypeModelImplToJson(
      this,
    );
  }
}

abstract class _ChelationTypeModel implements ChelationTypeModel {
  const factory _ChelationTypeModel(
      {required final int id,
      required final String chelationTypeDescr,
      required final String shortname}) = _$ChelationTypeModelImpl;

  factory _ChelationTypeModel.fromJson(Map<String, dynamic> json) =
      _$ChelationTypeModelImpl.fromJson;

  @override
  int get id;
  @override
  String get chelationTypeDescr;
  @override
  String get shortname;
  @override
  @JsonKey(ignore: true)
  _$$ChelationTypeModelImplCopyWith<_$ChelationTypeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

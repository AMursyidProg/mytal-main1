// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sex_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SexModel _$SexModelFromJson(Map<String, dynamic> json) {
  return _SexModel.fromJson(json);
}

/// @nodoc
mixin _$SexModel {
  int get id => throw _privateConstructorUsedError;
  String get sexDescr => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SexModelCopyWith<SexModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SexModelCopyWith<$Res> {
  factory $SexModelCopyWith(SexModel value, $Res Function(SexModel) then) =
      _$SexModelCopyWithImpl<$Res, SexModel>;
  @useResult
  $Res call({int id, String sexDescr});
}

/// @nodoc
class _$SexModelCopyWithImpl<$Res, $Val extends SexModel>
    implements $SexModelCopyWith<$Res> {
  _$SexModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sexDescr = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sexDescr: null == sexDescr
          ? _value.sexDescr
          : sexDescr // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SexModelImplCopyWith<$Res>
    implements $SexModelCopyWith<$Res> {
  factory _$$SexModelImplCopyWith(
          _$SexModelImpl value, $Res Function(_$SexModelImpl) then) =
      __$$SexModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String sexDescr});
}

/// @nodoc
class __$$SexModelImplCopyWithImpl<$Res>
    extends _$SexModelCopyWithImpl<$Res, _$SexModelImpl>
    implements _$$SexModelImplCopyWith<$Res> {
  __$$SexModelImplCopyWithImpl(
      _$SexModelImpl _value, $Res Function(_$SexModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sexDescr = null,
  }) {
    return _then(_$SexModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sexDescr: null == sexDescr
          ? _value.sexDescr
          : sexDescr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SexModelImpl with DiagnosticableTreeMixin implements _SexModel {
  const _$SexModelImpl({required this.id, required this.sexDescr});

  factory _$SexModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SexModelImplFromJson(json);

  @override
  final int id;
  @override
  final String sexDescr;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SexModel(id: $id, sexDescr: $sexDescr)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SexModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('sexDescr', sexDescr));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SexModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sexDescr, sexDescr) ||
                other.sexDescr == sexDescr));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, sexDescr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SexModelImplCopyWith<_$SexModelImpl> get copyWith =>
      __$$SexModelImplCopyWithImpl<_$SexModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SexModelImplToJson(
      this,
    );
  }
}

abstract class _SexModel implements SexModel {
  const factory _SexModel(
      {required final int id, required final String sexDescr}) = _$SexModelImpl;

  factory _SexModel.fromJson(Map<String, dynamic> json) =
      _$SexModelImpl.fromJson;

  @override
  int get id;
  @override
  String get sexDescr;
  @override
  @JsonKey(ignore: true)
  _$$SexModelImplCopyWith<_$SexModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

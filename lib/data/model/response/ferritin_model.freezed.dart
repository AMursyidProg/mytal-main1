// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ferritin_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FerritinModel _$FerritinModelFromJson(Map<String, dynamic> json) {
  return _FerritinModel.fromJson(json);
}

/// @nodoc
mixin _$FerritinModel {
  int get id => throw _privateConstructorUsedError;
  String get dateMeasured => throw _privateConstructorUsedError;
  double get level => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FerritinModelCopyWith<FerritinModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FerritinModelCopyWith<$Res> {
  factory $FerritinModelCopyWith(
          FerritinModel value, $Res Function(FerritinModel) then) =
      _$FerritinModelCopyWithImpl<$Res, FerritinModel>;
  @useResult
  $Res call({int id, String dateMeasured, double level});
}

/// @nodoc
class _$FerritinModelCopyWithImpl<$Res, $Val extends FerritinModel>
    implements $FerritinModelCopyWith<$Res> {
  _$FerritinModelCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FerritinModelImplCopyWith<$Res>
    implements $FerritinModelCopyWith<$Res> {
  factory _$$FerritinModelImplCopyWith(
          _$FerritinModelImpl value, $Res Function(_$FerritinModelImpl) then) =
      __$$FerritinModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String dateMeasured, double level});
}

/// @nodoc
class __$$FerritinModelImplCopyWithImpl<$Res>
    extends _$FerritinModelCopyWithImpl<$Res, _$FerritinModelImpl>
    implements _$$FerritinModelImplCopyWith<$Res> {
  __$$FerritinModelImplCopyWithImpl(
      _$FerritinModelImpl _value, $Res Function(_$FerritinModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dateMeasured = null,
    Object? level = null,
  }) {
    return _then(_$FerritinModelImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FerritinModelImpl
    with DiagnosticableTreeMixin
    implements _FerritinModel {
  const _$FerritinModelImpl(
      {required this.id, required this.dateMeasured, required this.level});

  factory _$FerritinModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FerritinModelImplFromJson(json);

  @override
  final int id;
  @override
  final String dateMeasured;
  @override
  final double level;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FerritinModel(id: $id, dateMeasured: $dateMeasured, level: $level)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FerritinModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('dateMeasured', dateMeasured))
      ..add(DiagnosticsProperty('level', level));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FerritinModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dateMeasured, dateMeasured) ||
                other.dateMeasured == dateMeasured) &&
            (identical(other.level, level) || other.level == level));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, dateMeasured, level);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FerritinModelImplCopyWith<_$FerritinModelImpl> get copyWith =>
      __$$FerritinModelImplCopyWithImpl<_$FerritinModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FerritinModelImplToJson(
      this,
    );
  }
}

abstract class _FerritinModel implements FerritinModel {
  const factory _FerritinModel(
      {required final int id,
      required final String dateMeasured,
      required final double level}) = _$FerritinModelImpl;

  factory _FerritinModel.fromJson(Map<String, dynamic> json) =
      _$FerritinModelImpl.fromJson;

  @override
  int get id;
  @override
  String get dateMeasured;
  @override
  double get level;
  @override
  @JsonKey(ignore: true)
  _$$FerritinModelImplCopyWith<_$FerritinModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

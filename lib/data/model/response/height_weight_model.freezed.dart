// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'height_weight_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HeightWeightModel _$HeightWeightModelFromJson(Map<String, dynamic> json) {
  return _HeightWeightModel.fromJson(json);
}

/// @nodoc
mixin _$HeightWeightModel {
  int get id => throw _privateConstructorUsedError;
  String get measuredDate => throw _privateConstructorUsedError;
  double? get height => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HeightWeightModelCopyWith<HeightWeightModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeightWeightModelCopyWith<$Res> {
  factory $HeightWeightModelCopyWith(
          HeightWeightModel value, $Res Function(HeightWeightModel) then) =
      _$HeightWeightModelCopyWithImpl<$Res, HeightWeightModel>;
  @useResult
  $Res call({int id, String measuredDate, double? height, double? weight});
}

/// @nodoc
class _$HeightWeightModelCopyWithImpl<$Res, $Val extends HeightWeightModel>
    implements $HeightWeightModelCopyWith<$Res> {
  _$HeightWeightModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? measuredDate = null,
    Object? height = freezed,
    Object? weight = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      measuredDate: null == measuredDate
          ? _value.measuredDate
          : measuredDate // ignore: cast_nullable_to_non_nullable
              as String,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HeightWeightModelImplCopyWith<$Res>
    implements $HeightWeightModelCopyWith<$Res> {
  factory _$$HeightWeightModelImplCopyWith(_$HeightWeightModelImpl value,
          $Res Function(_$HeightWeightModelImpl) then) =
      __$$HeightWeightModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String measuredDate, double? height, double? weight});
}

/// @nodoc
class __$$HeightWeightModelImplCopyWithImpl<$Res>
    extends _$HeightWeightModelCopyWithImpl<$Res, _$HeightWeightModelImpl>
    implements _$$HeightWeightModelImplCopyWith<$Res> {
  __$$HeightWeightModelImplCopyWithImpl(_$HeightWeightModelImpl _value,
      $Res Function(_$HeightWeightModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? measuredDate = null,
    Object? height = freezed,
    Object? weight = freezed,
  }) {
    return _then(_$HeightWeightModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      measuredDate: null == measuredDate
          ? _value.measuredDate
          : measuredDate // ignore: cast_nullable_to_non_nullable
              as String,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HeightWeightModelImpl
    with DiagnosticableTreeMixin
    implements _HeightWeightModel {
  const _$HeightWeightModelImpl(
      {required this.id,
      required this.measuredDate,
      this.height = 0,
      this.weight = 0});

  factory _$HeightWeightModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HeightWeightModelImplFromJson(json);

  @override
  final int id;
  @override
  final String measuredDate;
  @override
  @JsonKey()
  final double? height;
  @override
  @JsonKey()
  final double? weight;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HeightWeightModel(id: $id, measuredDate: $measuredDate, height: $height, weight: $weight)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HeightWeightModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('measuredDate', measuredDate))
      ..add(DiagnosticsProperty('height', height))
      ..add(DiagnosticsProperty('weight', weight));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeightWeightModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.measuredDate, measuredDate) ||
                other.measuredDate == measuredDate) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, measuredDate, height, weight);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HeightWeightModelImplCopyWith<_$HeightWeightModelImpl> get copyWith =>
      __$$HeightWeightModelImplCopyWithImpl<_$HeightWeightModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HeightWeightModelImplToJson(
      this,
    );
  }
}

abstract class _HeightWeightModel implements HeightWeightModel {
  const factory _HeightWeightModel(
      {required final int id,
      required final String measuredDate,
      final double? height,
      final double? weight}) = _$HeightWeightModelImpl;

  factory _HeightWeightModel.fromJson(Map<String, dynamic> json) =
      _$HeightWeightModelImpl.fromJson;

  @override
  int get id;
  @override
  String get measuredDate;
  @override
  double? get height;
  @override
  double? get weight;
  @override
  @JsonKey(ignore: true)
  _$$HeightWeightModelImplCopyWith<_$HeightWeightModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

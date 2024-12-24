// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'height_weight_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddHeightWeightBody _$AddHeightWeightBodyFromJson(Map<String, dynamic> json) {
  return _AddHeightWeightBody.fromJson(json);
}

/// @nodoc
mixin _$AddHeightWeightBody {
  String get measuredDate => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddHeightWeightBodyCopyWith<AddHeightWeightBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddHeightWeightBodyCopyWith<$Res> {
  factory $AddHeightWeightBodyCopyWith(
          AddHeightWeightBody value, $Res Function(AddHeightWeightBody) then) =
      _$AddHeightWeightBodyCopyWithImpl<$Res, AddHeightWeightBody>;
  @useResult
  $Res call({String measuredDate, double height, double weight});
}

/// @nodoc
class _$AddHeightWeightBodyCopyWithImpl<$Res, $Val extends AddHeightWeightBody>
    implements $AddHeightWeightBodyCopyWith<$Res> {
  _$AddHeightWeightBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? measuredDate = null,
    Object? height = null,
    Object? weight = null,
  }) {
    return _then(_value.copyWith(
      measuredDate: null == measuredDate
          ? _value.measuredDate
          : measuredDate // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddHeightWeightBodyImplCopyWith<$Res>
    implements $AddHeightWeightBodyCopyWith<$Res> {
  factory _$$AddHeightWeightBodyImplCopyWith(_$AddHeightWeightBodyImpl value,
          $Res Function(_$AddHeightWeightBodyImpl) then) =
      __$$AddHeightWeightBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String measuredDate, double height, double weight});
}

/// @nodoc
class __$$AddHeightWeightBodyImplCopyWithImpl<$Res>
    extends _$AddHeightWeightBodyCopyWithImpl<$Res, _$AddHeightWeightBodyImpl>
    implements _$$AddHeightWeightBodyImplCopyWith<$Res> {
  __$$AddHeightWeightBodyImplCopyWithImpl(_$AddHeightWeightBodyImpl _value,
      $Res Function(_$AddHeightWeightBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? measuredDate = null,
    Object? height = null,
    Object? weight = null,
  }) {
    return _then(_$AddHeightWeightBodyImpl(
      measuredDate: null == measuredDate
          ? _value.measuredDate
          : measuredDate // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddHeightWeightBodyImpl
    with DiagnosticableTreeMixin
    implements _AddHeightWeightBody {
  const _$AddHeightWeightBodyImpl(
      {required this.measuredDate, required this.height, required this.weight});

  factory _$AddHeightWeightBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddHeightWeightBodyImplFromJson(json);

  @override
  final String measuredDate;
  @override
  final double height;
  @override
  final double weight;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddHeightWeightBody(measuredDate: $measuredDate, height: $height, weight: $weight)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddHeightWeightBody'))
      ..add(DiagnosticsProperty('measuredDate', measuredDate))
      ..add(DiagnosticsProperty('height', height))
      ..add(DiagnosticsProperty('weight', weight));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddHeightWeightBodyImpl &&
            (identical(other.measuredDate, measuredDate) ||
                other.measuredDate == measuredDate) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, measuredDate, height, weight);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddHeightWeightBodyImplCopyWith<_$AddHeightWeightBodyImpl> get copyWith =>
      __$$AddHeightWeightBodyImplCopyWithImpl<_$AddHeightWeightBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddHeightWeightBodyImplToJson(
      this,
    );
  }
}

abstract class _AddHeightWeightBody implements AddHeightWeightBody {
  const factory _AddHeightWeightBody(
      {required final String measuredDate,
      required final double height,
      required final double weight}) = _$AddHeightWeightBodyImpl;

  factory _AddHeightWeightBody.fromJson(Map<String, dynamic> json) =
      _$AddHeightWeightBodyImpl.fromJson;

  @override
  String get measuredDate;
  @override
  double get height;
  @override
  double get weight;
  @override
  @JsonKey(ignore: true)
  _$$AddHeightWeightBodyImplCopyWith<_$AddHeightWeightBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EditHeightWeightBody _$EditHeightWeightBodyFromJson(Map<String, dynamic> json) {
  return _EditHeightWeightBody.fromJson(json);
}

/// @nodoc
mixin _$EditHeightWeightBody {
  int get id => throw _privateConstructorUsedError;
  String get measuredDate => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;
  int? get patientID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditHeightWeightBodyCopyWith<EditHeightWeightBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditHeightWeightBodyCopyWith<$Res> {
  factory $EditHeightWeightBodyCopyWith(EditHeightWeightBody value,
          $Res Function(EditHeightWeightBody) then) =
      _$EditHeightWeightBodyCopyWithImpl<$Res, EditHeightWeightBody>;
  @useResult
  $Res call(
      {int id,
      String measuredDate,
      double height,
      double weight,
      int? patientID});
}

/// @nodoc
class _$EditHeightWeightBodyCopyWithImpl<$Res,
        $Val extends EditHeightWeightBody>
    implements $EditHeightWeightBodyCopyWith<$Res> {
  _$EditHeightWeightBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? measuredDate = null,
    Object? height = null,
    Object? weight = null,
    Object? patientID = freezed,
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
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      patientID: freezed == patientID
          ? _value.patientID
          : patientID // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditHeightWeightBodyImplCopyWith<$Res>
    implements $EditHeightWeightBodyCopyWith<$Res> {
  factory _$$EditHeightWeightBodyImplCopyWith(_$EditHeightWeightBodyImpl value,
          $Res Function(_$EditHeightWeightBodyImpl) then) =
      __$$EditHeightWeightBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String measuredDate,
      double height,
      double weight,
      int? patientID});
}

/// @nodoc
class __$$EditHeightWeightBodyImplCopyWithImpl<$Res>
    extends _$EditHeightWeightBodyCopyWithImpl<$Res, _$EditHeightWeightBodyImpl>
    implements _$$EditHeightWeightBodyImplCopyWith<$Res> {
  __$$EditHeightWeightBodyImplCopyWithImpl(_$EditHeightWeightBodyImpl _value,
      $Res Function(_$EditHeightWeightBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? measuredDate = null,
    Object? height = null,
    Object? weight = null,
    Object? patientID = freezed,
  }) {
    return _then(_$EditHeightWeightBodyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      measuredDate: null == measuredDate
          ? _value.measuredDate
          : measuredDate // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      patientID: freezed == patientID
          ? _value.patientID
          : patientID // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EditHeightWeightBodyImpl
    with DiagnosticableTreeMixin
    implements _EditHeightWeightBody {
  const _$EditHeightWeightBodyImpl(
      {required this.id,
      required this.measuredDate,
      required this.height,
      required this.weight,
      this.patientID});

  factory _$EditHeightWeightBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditHeightWeightBodyImplFromJson(json);

  @override
  final int id;
  @override
  final String measuredDate;
  @override
  final double height;
  @override
  final double weight;
  @override
  final int? patientID;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditHeightWeightBody(id: $id, measuredDate: $measuredDate, height: $height, weight: $weight, patientID: $patientID)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EditHeightWeightBody'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('measuredDate', measuredDate))
      ..add(DiagnosticsProperty('height', height))
      ..add(DiagnosticsProperty('weight', weight))
      ..add(DiagnosticsProperty('patientID', patientID));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditHeightWeightBodyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.measuredDate, measuredDate) ||
                other.measuredDate == measuredDate) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.patientID, patientID) ||
                other.patientID == patientID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, measuredDate, height, weight, patientID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditHeightWeightBodyImplCopyWith<_$EditHeightWeightBodyImpl>
      get copyWith =>
          __$$EditHeightWeightBodyImplCopyWithImpl<_$EditHeightWeightBodyImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EditHeightWeightBodyImplToJson(
      this,
    );
  }
}

abstract class _EditHeightWeightBody implements EditHeightWeightBody {
  const factory _EditHeightWeightBody(
      {required final int id,
      required final String measuredDate,
      required final double height,
      required final double weight,
      final int? patientID}) = _$EditHeightWeightBodyImpl;

  factory _EditHeightWeightBody.fromJson(Map<String, dynamic> json) =
      _$EditHeightWeightBodyImpl.fromJson;

  @override
  int get id;
  @override
  String get measuredDate;
  @override
  double get height;
  @override
  double get weight;
  @override
  int? get patientID;
  @override
  @JsonKey(ignore: true)
  _$$EditHeightWeightBodyImplCopyWith<_$EditHeightWeightBodyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

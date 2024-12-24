// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sex_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SexReportModel _$SexReportModelFromJson(Map<String, dynamic> json) {
  return _SexReportModel.fromJson(json);
}

/// @nodoc
mixin _$SexReportModel {
  int get id => throw _privateConstructorUsedError;
  int get categoryId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SexReportModelCopyWith<SexReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SexReportModelCopyWith<$Res> {
  factory $SexReportModelCopyWith(
          SexReportModel value, $Res Function(SexReportModel) then) =
      _$SexReportModelCopyWithImpl<$Res, SexReportModel>;
  @useResult
  $Res call({int id, int categoryId, int quantity, String description});
}

/// @nodoc
class _$SexReportModelCopyWithImpl<$Res, $Val extends SexReportModel>
    implements $SexReportModelCopyWith<$Res> {
  _$SexReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = null,
    Object? quantity = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SexReportModelImplCopyWith<$Res>
    implements $SexReportModelCopyWith<$Res> {
  factory _$$SexReportModelImplCopyWith(_$SexReportModelImpl value,
          $Res Function(_$SexReportModelImpl) then) =
      __$$SexReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int categoryId, int quantity, String description});
}

/// @nodoc
class __$$SexReportModelImplCopyWithImpl<$Res>
    extends _$SexReportModelCopyWithImpl<$Res, _$SexReportModelImpl>
    implements _$$SexReportModelImplCopyWith<$Res> {
  __$$SexReportModelImplCopyWithImpl(
      _$SexReportModelImpl _value, $Res Function(_$SexReportModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = null,
    Object? quantity = null,
    Object? description = null,
  }) {
    return _then(_$SexReportModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SexReportModelImpl
    with DiagnosticableTreeMixin
    implements _SexReportModel {
  const _$SexReportModelImpl(
      {required this.id,
      required this.categoryId,
      required this.quantity,
      required this.description});

  factory _$SexReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SexReportModelImplFromJson(json);

  @override
  final int id;
  @override
  final int categoryId;
  @override
  final int quantity;
  @override
  final String description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SexReportModel(id: $id, categoryId: $categoryId, quantity: $quantity, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SexReportModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('categoryId', categoryId))
      ..add(DiagnosticsProperty('quantity', quantity))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SexReportModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, categoryId, quantity, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SexReportModelImplCopyWith<_$SexReportModelImpl> get copyWith =>
      __$$SexReportModelImplCopyWithImpl<_$SexReportModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SexReportModelImplToJson(
      this,
    );
  }
}

abstract class _SexReportModel implements SexReportModel {
  const factory _SexReportModel(
      {required final int id,
      required final int categoryId,
      required final int quantity,
      required final String description}) = _$SexReportModelImpl;

  factory _SexReportModel.fromJson(Map<String, dynamic> json) =
      _$SexReportModelImpl.fromJson;

  @override
  int get id;
  @override
  int get categoryId;
  @override
  int get quantity;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$SexReportModelImplCopyWith<_$SexReportModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

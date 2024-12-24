// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagnosis_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiagnosisReportModel _$DiagnosisReportModelFromJson(Map<String, dynamic> json) {
  return _DiagnosisReportModel.fromJson(json);
}

/// @nodoc
mixin _$DiagnosisReportModel {
  int get id => throw _privateConstructorUsedError;
  int get categoryId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiagnosisReportModelCopyWith<DiagnosisReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagnosisReportModelCopyWith<$Res> {
  factory $DiagnosisReportModelCopyWith(DiagnosisReportModel value,
          $Res Function(DiagnosisReportModel) then) =
      _$DiagnosisReportModelCopyWithImpl<$Res, DiagnosisReportModel>;
  @useResult
  $Res call({int id, int categoryId, int quantity, String description});
}

/// @nodoc
class _$DiagnosisReportModelCopyWithImpl<$Res,
        $Val extends DiagnosisReportModel>
    implements $DiagnosisReportModelCopyWith<$Res> {
  _$DiagnosisReportModelCopyWithImpl(this._value, this._then);

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
abstract class _$$DiagnosisReportModelImplCopyWith<$Res>
    implements $DiagnosisReportModelCopyWith<$Res> {
  factory _$$DiagnosisReportModelImplCopyWith(_$DiagnosisReportModelImpl value,
          $Res Function(_$DiagnosisReportModelImpl) then) =
      __$$DiagnosisReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int categoryId, int quantity, String description});
}

/// @nodoc
class __$$DiagnosisReportModelImplCopyWithImpl<$Res>
    extends _$DiagnosisReportModelCopyWithImpl<$Res, _$DiagnosisReportModelImpl>
    implements _$$DiagnosisReportModelImplCopyWith<$Res> {
  __$$DiagnosisReportModelImplCopyWithImpl(_$DiagnosisReportModelImpl _value,
      $Res Function(_$DiagnosisReportModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = null,
    Object? quantity = null,
    Object? description = null,
  }) {
    return _then(_$DiagnosisReportModelImpl(
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
class _$DiagnosisReportModelImpl
    with DiagnosticableTreeMixin
    implements _DiagnosisReportModel {
  const _$DiagnosisReportModelImpl(
      {required this.id,
      required this.categoryId,
      required this.quantity,
      required this.description});

  factory _$DiagnosisReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiagnosisReportModelImplFromJson(json);

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
    return 'DiagnosisReportModel(id: $id, categoryId: $categoryId, quantity: $quantity, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DiagnosisReportModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('categoryId', categoryId))
      ..add(DiagnosticsProperty('quantity', quantity))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagnosisReportModelImpl &&
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
  _$$DiagnosisReportModelImplCopyWith<_$DiagnosisReportModelImpl>
      get copyWith =>
          __$$DiagnosisReportModelImplCopyWithImpl<_$DiagnosisReportModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiagnosisReportModelImplToJson(
      this,
    );
  }
}

abstract class _DiagnosisReportModel implements DiagnosisReportModel {
  const factory _DiagnosisReportModel(
      {required final int id,
      required final int categoryId,
      required final int quantity,
      required final String description}) = _$DiagnosisReportModelImpl;

  factory _DiagnosisReportModel.fromJson(Map<String, dynamic> json) =
      _$DiagnosisReportModelImpl.fromJson;

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
  _$$DiagnosisReportModelImplCopyWith<_$DiagnosisReportModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

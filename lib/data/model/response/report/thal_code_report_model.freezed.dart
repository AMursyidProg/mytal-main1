// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thal_code_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ThalCodeReportModel _$ThalCodeReportModelFromJson(Map<String, dynamic> json) {
  return _ThalCodeReportModel.fromJson(json);
}

/// @nodoc
mixin _$ThalCodeReportModel {
  int get id => throw _privateConstructorUsedError;
  int get categoryId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThalCodeReportModelCopyWith<ThalCodeReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThalCodeReportModelCopyWith<$Res> {
  factory $ThalCodeReportModelCopyWith(
          ThalCodeReportModel value, $Res Function(ThalCodeReportModel) then) =
      _$ThalCodeReportModelCopyWithImpl<$Res, ThalCodeReportModel>;
  @useResult
  $Res call(
      {int id, int categoryId, int quantity, String description, String code});
}

/// @nodoc
class _$ThalCodeReportModelCopyWithImpl<$Res, $Val extends ThalCodeReportModel>
    implements $ThalCodeReportModelCopyWith<$Res> {
  _$ThalCodeReportModelCopyWithImpl(this._value, this._then);

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
    Object? code = null,
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
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThalCodeReportModelImplCopyWith<$Res>
    implements $ThalCodeReportModelCopyWith<$Res> {
  factory _$$ThalCodeReportModelImplCopyWith(_$ThalCodeReportModelImpl value,
          $Res Function(_$ThalCodeReportModelImpl) then) =
      __$$ThalCodeReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, int categoryId, int quantity, String description, String code});
}

/// @nodoc
class __$$ThalCodeReportModelImplCopyWithImpl<$Res>
    extends _$ThalCodeReportModelCopyWithImpl<$Res, _$ThalCodeReportModelImpl>
    implements _$$ThalCodeReportModelImplCopyWith<$Res> {
  __$$ThalCodeReportModelImplCopyWithImpl(_$ThalCodeReportModelImpl _value,
      $Res Function(_$ThalCodeReportModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = null,
    Object? quantity = null,
    Object? description = null,
    Object? code = null,
  }) {
    return _then(_$ThalCodeReportModelImpl(
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
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThalCodeReportModelImpl
    with DiagnosticableTreeMixin
    implements _ThalCodeReportModel {
  const _$ThalCodeReportModelImpl(
      {required this.id,
      required this.categoryId,
      required this.quantity,
      required this.description,
      required this.code});

  factory _$ThalCodeReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThalCodeReportModelImplFromJson(json);

  @override
  final int id;
  @override
  final int categoryId;
  @override
  final int quantity;
  @override
  final String description;
  @override
  final String code;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThalCodeReportModel(id: $id, categoryId: $categoryId, quantity: $quantity, description: $description, code: $code)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ThalCodeReportModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('categoryId', categoryId))
      ..add(DiagnosticsProperty('quantity', quantity))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('code', code));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThalCodeReportModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, categoryId, quantity, description, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThalCodeReportModelImplCopyWith<_$ThalCodeReportModelImpl> get copyWith =>
      __$$ThalCodeReportModelImplCopyWithImpl<_$ThalCodeReportModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThalCodeReportModelImplToJson(
      this,
    );
  }
}

abstract class _ThalCodeReportModel implements ThalCodeReportModel {
  const factory _ThalCodeReportModel(
      {required final int id,
      required final int categoryId,
      required final int quantity,
      required final String description,
      required final String code}) = _$ThalCodeReportModelImpl;

  factory _ThalCodeReportModel.fromJson(Map<String, dynamic> json) =
      _$ThalCodeReportModelImpl.fromJson;

  @override
  int get id;
  @override
  int get categoryId;
  @override
  int get quantity;
  @override
  String get description;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$ThalCodeReportModelImplCopyWith<_$ThalCodeReportModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

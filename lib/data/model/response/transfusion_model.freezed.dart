// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfusion_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransfusionModel _$TransfusionModelFromJson(Map<String, dynamic> json) {
  return _TransfusionModel.fromJson(json);
}

/// @nodoc
mixin _$TransfusionModel {
  int get id => throw _privateConstructorUsedError;
  String get dateTransfusion => throw _privateConstructorUsedError;
  int get volume => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransfusionModelCopyWith<TransfusionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransfusionModelCopyWith<$Res> {
  factory $TransfusionModelCopyWith(
          TransfusionModel value, $Res Function(TransfusionModel) then) =
      _$TransfusionModelCopyWithImpl<$Res, TransfusionModel>;
  @useResult
  $Res call({int id, String dateTransfusion, int volume});
}

/// @nodoc
class _$TransfusionModelCopyWithImpl<$Res, $Val extends TransfusionModel>
    implements $TransfusionModelCopyWith<$Res> {
  _$TransfusionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dateTransfusion = null,
    Object? volume = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dateTransfusion: null == dateTransfusion
          ? _value.dateTransfusion
          : dateTransfusion // ignore: cast_nullable_to_non_nullable
              as String,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransfusionModelImplCopyWith<$Res>
    implements $TransfusionModelCopyWith<$Res> {
  factory _$$TransfusionModelImplCopyWith(_$TransfusionModelImpl value,
          $Res Function(_$TransfusionModelImpl) then) =
      __$$TransfusionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String dateTransfusion, int volume});
}

/// @nodoc
class __$$TransfusionModelImplCopyWithImpl<$Res>
    extends _$TransfusionModelCopyWithImpl<$Res, _$TransfusionModelImpl>
    implements _$$TransfusionModelImplCopyWith<$Res> {
  __$$TransfusionModelImplCopyWithImpl(_$TransfusionModelImpl _value,
      $Res Function(_$TransfusionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dateTransfusion = null,
    Object? volume = null,
  }) {
    return _then(_$TransfusionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dateTransfusion: null == dateTransfusion
          ? _value.dateTransfusion
          : dateTransfusion // ignore: cast_nullable_to_non_nullable
              as String,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransfusionModelImpl
    with DiagnosticableTreeMixin
    implements _TransfusionModel {
  const _$TransfusionModelImpl(
      {required this.id, required this.dateTransfusion, required this.volume});

  factory _$TransfusionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransfusionModelImplFromJson(json);

  @override
  final int id;
  @override
  final String dateTransfusion;
  @override
  final int volume;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TransfusionModel(id: $id, dateTransfusion: $dateTransfusion, volume: $volume)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TransfusionModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('dateTransfusion', dateTransfusion))
      ..add(DiagnosticsProperty('volume', volume));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransfusionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dateTransfusion, dateTransfusion) ||
                other.dateTransfusion == dateTransfusion) &&
            (identical(other.volume, volume) || other.volume == volume));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, dateTransfusion, volume);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransfusionModelImplCopyWith<_$TransfusionModelImpl> get copyWith =>
      __$$TransfusionModelImplCopyWithImpl<_$TransfusionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransfusionModelImplToJson(
      this,
    );
  }
}

abstract class _TransfusionModel implements TransfusionModel {
  const factory _TransfusionModel(
      {required final int id,
      required final String dateTransfusion,
      required final int volume}) = _$TransfusionModelImpl;

  factory _TransfusionModel.fromJson(Map<String, dynamic> json) =
      _$TransfusionModelImpl.fromJson;

  @override
  int get id;
  @override
  String get dateTransfusion;
  @override
  int get volume;
  @override
  @JsonKey(ignore: true)
  _$$TransfusionModelImplCopyWith<_$TransfusionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfusion_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddTransfusionBody _$AddTransfusionBodyFromJson(Map<String, dynamic> json) {
  return _AddTransfusionBody.fromJson(json);
}

/// @nodoc
mixin _$AddTransfusionBody {
  String get dateTransfusion => throw _privateConstructorUsedError;
  int get volume => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddTransfusionBodyCopyWith<AddTransfusionBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTransfusionBodyCopyWith<$Res> {
  factory $AddTransfusionBodyCopyWith(
          AddTransfusionBody value, $Res Function(AddTransfusionBody) then) =
      _$AddTransfusionBodyCopyWithImpl<$Res, AddTransfusionBody>;
  @useResult
  $Res call({String dateTransfusion, int volume});
}

/// @nodoc
class _$AddTransfusionBodyCopyWithImpl<$Res, $Val extends AddTransfusionBody>
    implements $AddTransfusionBodyCopyWith<$Res> {
  _$AddTransfusionBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTransfusion = null,
    Object? volume = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$AddTransfusionBodyImplCopyWith<$Res>
    implements $AddTransfusionBodyCopyWith<$Res> {
  factory _$$AddTransfusionBodyImplCopyWith(_$AddTransfusionBodyImpl value,
          $Res Function(_$AddTransfusionBodyImpl) then) =
      __$$AddTransfusionBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String dateTransfusion, int volume});
}

/// @nodoc
class __$$AddTransfusionBodyImplCopyWithImpl<$Res>
    extends _$AddTransfusionBodyCopyWithImpl<$Res, _$AddTransfusionBodyImpl>
    implements _$$AddTransfusionBodyImplCopyWith<$Res> {
  __$$AddTransfusionBodyImplCopyWithImpl(_$AddTransfusionBodyImpl _value,
      $Res Function(_$AddTransfusionBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTransfusion = null,
    Object? volume = null,
  }) {
    return _then(_$AddTransfusionBodyImpl(
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
class _$AddTransfusionBodyImpl
    with DiagnosticableTreeMixin
    implements _AddTransfusionBody {
  const _$AddTransfusionBodyImpl(
      {required this.dateTransfusion, required this.volume});

  factory _$AddTransfusionBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddTransfusionBodyImplFromJson(json);

  @override
  final String dateTransfusion;
  @override
  final int volume;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddTransfusionBody(dateTransfusion: $dateTransfusion, volume: $volume)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddTransfusionBody'))
      ..add(DiagnosticsProperty('dateTransfusion', dateTransfusion))
      ..add(DiagnosticsProperty('volume', volume));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTransfusionBodyImpl &&
            (identical(other.dateTransfusion, dateTransfusion) ||
                other.dateTransfusion == dateTransfusion) &&
            (identical(other.volume, volume) || other.volume == volume));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dateTransfusion, volume);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddTransfusionBodyImplCopyWith<_$AddTransfusionBodyImpl> get copyWith =>
      __$$AddTransfusionBodyImplCopyWithImpl<_$AddTransfusionBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddTransfusionBodyImplToJson(
      this,
    );
  }
}

abstract class _AddTransfusionBody implements AddTransfusionBody {
  const factory _AddTransfusionBody(
      {required final String dateTransfusion,
      required final int volume}) = _$AddTransfusionBodyImpl;

  factory _AddTransfusionBody.fromJson(Map<String, dynamic> json) =
      _$AddTransfusionBodyImpl.fromJson;

  @override
  String get dateTransfusion;
  @override
  int get volume;
  @override
  @JsonKey(ignore: true)
  _$$AddTransfusionBodyImplCopyWith<_$AddTransfusionBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EditTransfusionBody _$EditTransfusionBodyFromJson(Map<String, dynamic> json) {
  return _EditTransfusionBody.fromJson(json);
}

/// @nodoc
mixin _$EditTransfusionBody {
  int get id => throw _privateConstructorUsedError;
  String get dateTransfusion => throw _privateConstructorUsedError;
  int get volume => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditTransfusionBodyCopyWith<EditTransfusionBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditTransfusionBodyCopyWith<$Res> {
  factory $EditTransfusionBodyCopyWith(
          EditTransfusionBody value, $Res Function(EditTransfusionBody) then) =
      _$EditTransfusionBodyCopyWithImpl<$Res, EditTransfusionBody>;
  @useResult
  $Res call({int id, String dateTransfusion, int volume});
}

/// @nodoc
class _$EditTransfusionBodyCopyWithImpl<$Res, $Val extends EditTransfusionBody>
    implements $EditTransfusionBodyCopyWith<$Res> {
  _$EditTransfusionBodyCopyWithImpl(this._value, this._then);

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
abstract class _$$EditTransfusionBodyImplCopyWith<$Res>
    implements $EditTransfusionBodyCopyWith<$Res> {
  factory _$$EditTransfusionBodyImplCopyWith(_$EditTransfusionBodyImpl value,
          $Res Function(_$EditTransfusionBodyImpl) then) =
      __$$EditTransfusionBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String dateTransfusion, int volume});
}

/// @nodoc
class __$$EditTransfusionBodyImplCopyWithImpl<$Res>
    extends _$EditTransfusionBodyCopyWithImpl<$Res, _$EditTransfusionBodyImpl>
    implements _$$EditTransfusionBodyImplCopyWith<$Res> {
  __$$EditTransfusionBodyImplCopyWithImpl(_$EditTransfusionBodyImpl _value,
      $Res Function(_$EditTransfusionBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dateTransfusion = null,
    Object? volume = null,
  }) {
    return _then(_$EditTransfusionBodyImpl(
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
class _$EditTransfusionBodyImpl
    with DiagnosticableTreeMixin
    implements _EditTransfusionBody {
  const _$EditTransfusionBodyImpl(
      {required this.id, required this.dateTransfusion, required this.volume});

  factory _$EditTransfusionBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditTransfusionBodyImplFromJson(json);

  @override
  final int id;
  @override
  final String dateTransfusion;
  @override
  final int volume;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditTransfusionBody(id: $id, dateTransfusion: $dateTransfusion, volume: $volume)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EditTransfusionBody'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('dateTransfusion', dateTransfusion))
      ..add(DiagnosticsProperty('volume', volume));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditTransfusionBodyImpl &&
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
  _$$EditTransfusionBodyImplCopyWith<_$EditTransfusionBodyImpl> get copyWith =>
      __$$EditTransfusionBodyImplCopyWithImpl<_$EditTransfusionBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EditTransfusionBodyImplToJson(
      this,
    );
  }
}

abstract class _EditTransfusionBody implements EditTransfusionBody {
  const factory _EditTransfusionBody(
      {required final int id,
      required final String dateTransfusion,
      required final int volume}) = _$EditTransfusionBodyImpl;

  factory _EditTransfusionBody.fromJson(Map<String, dynamic> json) =
      _$EditTransfusionBodyImpl.fromJson;

  @override
  int get id;
  @override
  String get dateTransfusion;
  @override
  int get volume;
  @override
  @JsonKey(ignore: true)
  _$$EditTransfusionBodyImplCopyWith<_$EditTransfusionBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

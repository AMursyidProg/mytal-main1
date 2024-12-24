// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'therapy_complications_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EditTherapyComplicationsBody _$EditTherapyComplicationsBodyFromJson(
    Map<String, dynamic> json) {
  return _EditTherapyComplicationsBody.fromJson(json);
}

/// @nodoc
mixin _$EditTherapyComplicationsBody {
  int get id => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;
  String get therapyComplicationDescr => throw _privateConstructorUsedError;
  int get therapyComplicationTypeID => throw _privateConstructorUsedError;
  String get therapyComplicationTypeDescr => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditTherapyComplicationsBodyCopyWith<EditTherapyComplicationsBody>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditTherapyComplicationsBodyCopyWith<$Res> {
  factory $EditTherapyComplicationsBodyCopyWith(
          EditTherapyComplicationsBody value,
          $Res Function(EditTherapyComplicationsBody) then) =
      _$EditTherapyComplicationsBodyCopyWithImpl<$Res,
          EditTherapyComplicationsBody>;
  @useResult
  $Res call(
      {int id,
      bool selected,
      String therapyComplicationDescr,
      int therapyComplicationTypeID,
      String therapyComplicationTypeDescr});
}

/// @nodoc
class _$EditTherapyComplicationsBodyCopyWithImpl<$Res,
        $Val extends EditTherapyComplicationsBody>
    implements $EditTherapyComplicationsBodyCopyWith<$Res> {
  _$EditTherapyComplicationsBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? selected = null,
    Object? therapyComplicationDescr = null,
    Object? therapyComplicationTypeID = null,
    Object? therapyComplicationTypeDescr = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
      therapyComplicationDescr: null == therapyComplicationDescr
          ? _value.therapyComplicationDescr
          : therapyComplicationDescr // ignore: cast_nullable_to_non_nullable
              as String,
      therapyComplicationTypeID: null == therapyComplicationTypeID
          ? _value.therapyComplicationTypeID
          : therapyComplicationTypeID // ignore: cast_nullable_to_non_nullable
              as int,
      therapyComplicationTypeDescr: null == therapyComplicationTypeDescr
          ? _value.therapyComplicationTypeDescr
          : therapyComplicationTypeDescr // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditTherapyComplicationsBodyImplCopyWith<$Res>
    implements $EditTherapyComplicationsBodyCopyWith<$Res> {
  factory _$$EditTherapyComplicationsBodyImplCopyWith(
          _$EditTherapyComplicationsBodyImpl value,
          $Res Function(_$EditTherapyComplicationsBodyImpl) then) =
      __$$EditTherapyComplicationsBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      bool selected,
      String therapyComplicationDescr,
      int therapyComplicationTypeID,
      String therapyComplicationTypeDescr});
}

/// @nodoc
class __$$EditTherapyComplicationsBodyImplCopyWithImpl<$Res>
    extends _$EditTherapyComplicationsBodyCopyWithImpl<$Res,
        _$EditTherapyComplicationsBodyImpl>
    implements _$$EditTherapyComplicationsBodyImplCopyWith<$Res> {
  __$$EditTherapyComplicationsBodyImplCopyWithImpl(
      _$EditTherapyComplicationsBodyImpl _value,
      $Res Function(_$EditTherapyComplicationsBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? selected = null,
    Object? therapyComplicationDescr = null,
    Object? therapyComplicationTypeID = null,
    Object? therapyComplicationTypeDescr = null,
  }) {
    return _then(_$EditTherapyComplicationsBodyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
      therapyComplicationDescr: null == therapyComplicationDescr
          ? _value.therapyComplicationDescr
          : therapyComplicationDescr // ignore: cast_nullable_to_non_nullable
              as String,
      therapyComplicationTypeID: null == therapyComplicationTypeID
          ? _value.therapyComplicationTypeID
          : therapyComplicationTypeID // ignore: cast_nullable_to_non_nullable
              as int,
      therapyComplicationTypeDescr: null == therapyComplicationTypeDescr
          ? _value.therapyComplicationTypeDescr
          : therapyComplicationTypeDescr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EditTherapyComplicationsBodyImpl
    with DiagnosticableTreeMixin
    implements _EditTherapyComplicationsBody {
  const _$EditTherapyComplicationsBodyImpl(
      {required this.id,
      required this.selected,
      required this.therapyComplicationDescr,
      required this.therapyComplicationTypeID,
      required this.therapyComplicationTypeDescr});

  factory _$EditTherapyComplicationsBodyImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EditTherapyComplicationsBodyImplFromJson(json);

  @override
  final int id;
  @override
  final bool selected;
  @override
  final String therapyComplicationDescr;
  @override
  final int therapyComplicationTypeID;
  @override
  final String therapyComplicationTypeDescr;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditTherapyComplicationsBody(id: $id, selected: $selected, therapyComplicationDescr: $therapyComplicationDescr, therapyComplicationTypeID: $therapyComplicationTypeID, therapyComplicationTypeDescr: $therapyComplicationTypeDescr)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EditTherapyComplicationsBody'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('selected', selected))
      ..add(DiagnosticsProperty(
          'therapyComplicationDescr', therapyComplicationDescr))
      ..add(DiagnosticsProperty(
          'therapyComplicationTypeID', therapyComplicationTypeID))
      ..add(DiagnosticsProperty(
          'therapyComplicationTypeDescr', therapyComplicationTypeDescr));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditTherapyComplicationsBodyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(
                    other.therapyComplicationDescr, therapyComplicationDescr) ||
                other.therapyComplicationDescr == therapyComplicationDescr) &&
            (identical(other.therapyComplicationTypeID,
                    therapyComplicationTypeID) ||
                other.therapyComplicationTypeID == therapyComplicationTypeID) &&
            (identical(other.therapyComplicationTypeDescr,
                    therapyComplicationTypeDescr) ||
                other.therapyComplicationTypeDescr ==
                    therapyComplicationTypeDescr));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      selected,
      therapyComplicationDescr,
      therapyComplicationTypeID,
      therapyComplicationTypeDescr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditTherapyComplicationsBodyImplCopyWith<
          _$EditTherapyComplicationsBodyImpl>
      get copyWith => __$$EditTherapyComplicationsBodyImplCopyWithImpl<
          _$EditTherapyComplicationsBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EditTherapyComplicationsBodyImplToJson(
      this,
    );
  }
}

abstract class _EditTherapyComplicationsBody
    implements EditTherapyComplicationsBody {
  const factory _EditTherapyComplicationsBody(
          {required final int id,
          required final bool selected,
          required final String therapyComplicationDescr,
          required final int therapyComplicationTypeID,
          required final String therapyComplicationTypeDescr}) =
      _$EditTherapyComplicationsBodyImpl;

  factory _EditTherapyComplicationsBody.fromJson(Map<String, dynamic> json) =
      _$EditTherapyComplicationsBodyImpl.fromJson;

  @override
  int get id;
  @override
  bool get selected;
  @override
  String get therapyComplicationDescr;
  @override
  int get therapyComplicationTypeID;
  @override
  String get therapyComplicationTypeDescr;
  @override
  @JsonKey(ignore: true)
  _$$EditTherapyComplicationsBodyImplCopyWith<
          _$EditTherapyComplicationsBodyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_appointment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileAppointmentModel _$ProfileAppointmentModelFromJson(
    Map<String, dynamic> json) {
  return _ProfileAppointmentModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileAppointmentModel {
  int get id => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileAppointmentModelCopyWith<ProfileAppointmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileAppointmentModelCopyWith<$Res> {
  factory $ProfileAppointmentModelCopyWith(ProfileAppointmentModel value,
          $Res Function(ProfileAppointmentModel) then) =
      _$ProfileAppointmentModelCopyWithImpl<$Res, ProfileAppointmentModel>;
  @useResult
  $Res call({int id, String date, String name, String? location});
}

/// @nodoc
class _$ProfileAppointmentModelCopyWithImpl<$Res,
        $Val extends ProfileAppointmentModel>
    implements $ProfileAppointmentModelCopyWith<$Res> {
  _$ProfileAppointmentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? name = null,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileAppointmentModelImplCopyWith<$Res>
    implements $ProfileAppointmentModelCopyWith<$Res> {
  factory _$$ProfileAppointmentModelImplCopyWith(
          _$ProfileAppointmentModelImpl value,
          $Res Function(_$ProfileAppointmentModelImpl) then) =
      __$$ProfileAppointmentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String date, String name, String? location});
}

/// @nodoc
class __$$ProfileAppointmentModelImplCopyWithImpl<$Res>
    extends _$ProfileAppointmentModelCopyWithImpl<$Res,
        _$ProfileAppointmentModelImpl>
    implements _$$ProfileAppointmentModelImplCopyWith<$Res> {
  __$$ProfileAppointmentModelImplCopyWithImpl(
      _$ProfileAppointmentModelImpl _value,
      $Res Function(_$ProfileAppointmentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? name = null,
    Object? location = freezed,
  }) {
    return _then(_$ProfileAppointmentModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileAppointmentModelImpl
    with DiagnosticableTreeMixin
    implements _ProfileAppointmentModel {
  const _$ProfileAppointmentModelImpl(
      {required this.id,
      required this.date,
      required this.name,
      this.location});

  factory _$ProfileAppointmentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileAppointmentModelImplFromJson(json);

  @override
  final int id;
  @override
  final String date;
  @override
  final String name;
  @override
  final String? location;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileAppointmentModel(id: $id, date: $date, name: $name, location: $location)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileAppointmentModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('location', location));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileAppointmentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, name, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileAppointmentModelImplCopyWith<_$ProfileAppointmentModelImpl>
      get copyWith => __$$ProfileAppointmentModelImplCopyWithImpl<
          _$ProfileAppointmentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileAppointmentModelImplToJson(
      this,
    );
  }
}

abstract class _ProfileAppointmentModel implements ProfileAppointmentModel {
  const factory _ProfileAppointmentModel(
      {required final int id,
      required final String date,
      required final String name,
      final String? location}) = _$ProfileAppointmentModelImpl;

  factory _ProfileAppointmentModel.fromJson(Map<String, dynamic> json) =
      _$ProfileAppointmentModelImpl.fromJson;

  @override
  int get id;
  @override
  String get date;
  @override
  String get name;
  @override
  String? get location;
  @override
  @JsonKey(ignore: true)
  _$$ProfileAppointmentModelImplCopyWith<_$ProfileAppointmentModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

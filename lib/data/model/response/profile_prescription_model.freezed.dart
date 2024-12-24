// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_prescription_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfilePrescriptionModel _$ProfilePrescriptionModelFromJson(
    Map<String, dynamic> json) {
  return _ProfilePrescriptionModel.fromJson(json);
}

/// @nodoc
mixin _$ProfilePrescriptionModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String get interval => throw _privateConstructorUsedError;
  int get totalDoses => throw _privateConstructorUsedError;
  List<PrescriptionEntry> get prescriptionEntries =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfilePrescriptionModelCopyWith<ProfilePrescriptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfilePrescriptionModelCopyWith<$Res> {
  factory $ProfilePrescriptionModelCopyWith(ProfilePrescriptionModel value,
          $Res Function(ProfilePrescriptionModel) then) =
      _$ProfilePrescriptionModelCopyWithImpl<$Res, ProfilePrescriptionModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String startDate,
      String interval,
      int totalDoses,
      List<PrescriptionEntry> prescriptionEntries});
}

/// @nodoc
class _$ProfilePrescriptionModelCopyWithImpl<$Res,
        $Val extends ProfilePrescriptionModel>
    implements $ProfilePrescriptionModelCopyWith<$Res> {
  _$ProfilePrescriptionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? startDate = null,
    Object? interval = null,
    Object? totalDoses = null,
    Object? prescriptionEntries = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as String,
      totalDoses: null == totalDoses
          ? _value.totalDoses
          : totalDoses // ignore: cast_nullable_to_non_nullable
              as int,
      prescriptionEntries: null == prescriptionEntries
          ? _value.prescriptionEntries
          : prescriptionEntries // ignore: cast_nullable_to_non_nullable
              as List<PrescriptionEntry>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfilePrescriptionModelImplCopyWith<$Res>
    implements $ProfilePrescriptionModelCopyWith<$Res> {
  factory _$$ProfilePrescriptionModelImplCopyWith(
          _$ProfilePrescriptionModelImpl value,
          $Res Function(_$ProfilePrescriptionModelImpl) then) =
      __$$ProfilePrescriptionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String startDate,
      String interval,
      int totalDoses,
      List<PrescriptionEntry> prescriptionEntries});
}

/// @nodoc
class __$$ProfilePrescriptionModelImplCopyWithImpl<$Res>
    extends _$ProfilePrescriptionModelCopyWithImpl<$Res,
        _$ProfilePrescriptionModelImpl>
    implements _$$ProfilePrescriptionModelImplCopyWith<$Res> {
  __$$ProfilePrescriptionModelImplCopyWithImpl(
      _$ProfilePrescriptionModelImpl _value,
      $Res Function(_$ProfilePrescriptionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? startDate = null,
    Object? interval = null,
    Object? totalDoses = null,
    Object? prescriptionEntries = null,
  }) {
    return _then(_$ProfilePrescriptionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as String,
      totalDoses: null == totalDoses
          ? _value.totalDoses
          : totalDoses // ignore: cast_nullable_to_non_nullable
              as int,
      prescriptionEntries: null == prescriptionEntries
          ? _value._prescriptionEntries
          : prescriptionEntries // ignore: cast_nullable_to_non_nullable
              as List<PrescriptionEntry>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfilePrescriptionModelImpl
    with DiagnosticableTreeMixin
    implements _ProfilePrescriptionModel {
  const _$ProfilePrescriptionModelImpl(
      {required this.id,
      required this.name,
      required this.startDate,
      required this.interval,
      required this.totalDoses,
      required final List<PrescriptionEntry> prescriptionEntries})
      : _prescriptionEntries = prescriptionEntries;

  factory _$ProfilePrescriptionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfilePrescriptionModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String startDate;
  @override
  final String interval;
  @override
  final int totalDoses;
  final List<PrescriptionEntry> _prescriptionEntries;
  @override
  List<PrescriptionEntry> get prescriptionEntries {
    if (_prescriptionEntries is EqualUnmodifiableListView)
      return _prescriptionEntries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_prescriptionEntries);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfilePrescriptionModel(id: $id, name: $name, startDate: $startDate, interval: $interval, totalDoses: $totalDoses, prescriptionEntries: $prescriptionEntries)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfilePrescriptionModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('startDate', startDate))
      ..add(DiagnosticsProperty('interval', interval))
      ..add(DiagnosticsProperty('totalDoses', totalDoses))
      ..add(DiagnosticsProperty('prescriptionEntries', prescriptionEntries));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfilePrescriptionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.interval, interval) ||
                other.interval == interval) &&
            (identical(other.totalDoses, totalDoses) ||
                other.totalDoses == totalDoses) &&
            const DeepCollectionEquality()
                .equals(other._prescriptionEntries, _prescriptionEntries));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, startDate, interval,
      totalDoses, const DeepCollectionEquality().hash(_prescriptionEntries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfilePrescriptionModelImplCopyWith<_$ProfilePrescriptionModelImpl>
      get copyWith => __$$ProfilePrescriptionModelImplCopyWithImpl<
          _$ProfilePrescriptionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfilePrescriptionModelImplToJson(
      this,
    );
  }
}

abstract class _ProfilePrescriptionModel implements ProfilePrescriptionModel {
  const factory _ProfilePrescriptionModel(
          {required final int id,
          required final String name,
          required final String startDate,
          required final String interval,
          required final int totalDoses,
          required final List<PrescriptionEntry> prescriptionEntries}) =
      _$ProfilePrescriptionModelImpl;

  factory _ProfilePrescriptionModel.fromJson(Map<String, dynamic> json) =
      _$ProfilePrescriptionModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get startDate;
  @override
  String get interval;
  @override
  int get totalDoses;
  @override
  List<PrescriptionEntry> get prescriptionEntries;
  @override
  @JsonKey(ignore: true)
  _$$ProfilePrescriptionModelImplCopyWith<_$ProfilePrescriptionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PrescriptionEntry _$PrescriptionEntryFromJson(Map<String, dynamic> json) {
  return _PrescriptionEntry.fromJson(json);
}

/// @nodoc
mixin _$PrescriptionEntry {
  int get id => throw _privateConstructorUsedError;
  int get prescriptionId => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  bool get taken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrescriptionEntryCopyWith<PrescriptionEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrescriptionEntryCopyWith<$Res> {
  factory $PrescriptionEntryCopyWith(
          PrescriptionEntry value, $Res Function(PrescriptionEntry) then) =
      _$PrescriptionEntryCopyWithImpl<$Res, PrescriptionEntry>;
  @useResult
  $Res call({int id, int prescriptionId, String date, bool taken});
}

/// @nodoc
class _$PrescriptionEntryCopyWithImpl<$Res, $Val extends PrescriptionEntry>
    implements $PrescriptionEntryCopyWith<$Res> {
  _$PrescriptionEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? prescriptionId = null,
    Object? date = null,
    Object? taken = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      prescriptionId: null == prescriptionId
          ? _value.prescriptionId
          : prescriptionId // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      taken: null == taken
          ? _value.taken
          : taken // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrescriptionEntryImplCopyWith<$Res>
    implements $PrescriptionEntryCopyWith<$Res> {
  factory _$$PrescriptionEntryImplCopyWith(_$PrescriptionEntryImpl value,
          $Res Function(_$PrescriptionEntryImpl) then) =
      __$$PrescriptionEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int prescriptionId, String date, bool taken});
}

/// @nodoc
class __$$PrescriptionEntryImplCopyWithImpl<$Res>
    extends _$PrescriptionEntryCopyWithImpl<$Res, _$PrescriptionEntryImpl>
    implements _$$PrescriptionEntryImplCopyWith<$Res> {
  __$$PrescriptionEntryImplCopyWithImpl(_$PrescriptionEntryImpl _value,
      $Res Function(_$PrescriptionEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? prescriptionId = null,
    Object? date = null,
    Object? taken = null,
  }) {
    return _then(_$PrescriptionEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      prescriptionId: null == prescriptionId
          ? _value.prescriptionId
          : prescriptionId // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      taken: null == taken
          ? _value.taken
          : taken // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrescriptionEntryImpl
    with DiagnosticableTreeMixin
    implements _PrescriptionEntry {
  const _$PrescriptionEntryImpl(
      {required this.id,
      required this.prescriptionId,
      required this.date,
      required this.taken});

  factory _$PrescriptionEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrescriptionEntryImplFromJson(json);

  @override
  final int id;
  @override
  final int prescriptionId;
  @override
  final String date;
  @override
  final bool taken;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrescriptionEntry(id: $id, prescriptionId: $prescriptionId, date: $date, taken: $taken)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrescriptionEntry'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('prescriptionId', prescriptionId))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('taken', taken));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrescriptionEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.prescriptionId, prescriptionId) ||
                other.prescriptionId == prescriptionId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.taken, taken) || other.taken == taken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, prescriptionId, date, taken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PrescriptionEntryImplCopyWith<_$PrescriptionEntryImpl> get copyWith =>
      __$$PrescriptionEntryImplCopyWithImpl<_$PrescriptionEntryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrescriptionEntryImplToJson(
      this,
    );
  }
}

abstract class _PrescriptionEntry implements PrescriptionEntry {
  const factory _PrescriptionEntry(
      {required final int id,
      required final int prescriptionId,
      required final String date,
      required final bool taken}) = _$PrescriptionEntryImpl;

  factory _PrescriptionEntry.fromJson(Map<String, dynamic> json) =
      _$PrescriptionEntryImpl.fromJson;

  @override
  int get id;
  @override
  int get prescriptionId;
  @override
  String get date;
  @override
  bool get taken;
  @override
  @JsonKey(ignore: true)
  _$$PrescriptionEntryImplCopyWith<_$PrescriptionEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

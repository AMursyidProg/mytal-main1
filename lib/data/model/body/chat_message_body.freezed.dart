// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatMessageBody _$ChatMessageBodyFromJson(Map<String, dynamic> json) {
  return _ChatMessageBody.fromJson(json);
}

/// @nodoc
mixin _$ChatMessageBody {
  String get question => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatMessageBodyCopyWith<ChatMessageBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageBodyCopyWith<$Res> {
  factory $ChatMessageBodyCopyWith(
          ChatMessageBody value, $Res Function(ChatMessageBody) then) =
      _$ChatMessageBodyCopyWithImpl<$Res, ChatMessageBody>;
  @useResult
  $Res call({String question});
}

/// @nodoc
class _$ChatMessageBodyCopyWithImpl<$Res, $Val extends ChatMessageBody>
    implements $ChatMessageBodyCopyWith<$Res> {
  _$ChatMessageBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
  }) {
    return _then(_value.copyWith(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatMessageBodyImplCopyWith<$Res>
    implements $ChatMessageBodyCopyWith<$Res> {
  factory _$$ChatMessageBodyImplCopyWith(_$ChatMessageBodyImpl value,
          $Res Function(_$ChatMessageBodyImpl) then) =
      __$$ChatMessageBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String question});
}

/// @nodoc
class __$$ChatMessageBodyImplCopyWithImpl<$Res>
    extends _$ChatMessageBodyCopyWithImpl<$Res, _$ChatMessageBodyImpl>
    implements _$$ChatMessageBodyImplCopyWith<$Res> {
  __$$ChatMessageBodyImplCopyWithImpl(
      _$ChatMessageBodyImpl _value, $Res Function(_$ChatMessageBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
  }) {
    return _then(_$ChatMessageBodyImpl(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessageBodyImpl
    with DiagnosticableTreeMixin
    implements _ChatMessageBody {
  const _$ChatMessageBodyImpl({required this.question});

  factory _$ChatMessageBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessageBodyImplFromJson(json);

  @override
  final String question;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatMessageBody(question: $question)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatMessageBody'))
      ..add(DiagnosticsProperty('question', question));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageBodyImpl &&
            (identical(other.question, question) ||
                other.question == question));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, question);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageBodyImplCopyWith<_$ChatMessageBodyImpl> get copyWith =>
      __$$ChatMessageBodyImplCopyWithImpl<_$ChatMessageBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageBodyImplToJson(
      this,
    );
  }
}

abstract class _ChatMessageBody implements ChatMessageBody {
  const factory _ChatMessageBody({required final String question}) =
      _$ChatMessageBodyImpl;

  factory _ChatMessageBody.fromJson(Map<String, dynamic> json) =
      _$ChatMessageBodyImpl.fromJson;

  @override
  String get question;
  @override
  @JsonKey(ignore: true)
  _$$ChatMessageBodyImplCopyWith<_$ChatMessageBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

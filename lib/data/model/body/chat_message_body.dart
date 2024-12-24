import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'chat_message_body.freezed.dart';
part 'chat_message_body.g.dart';

@freezed
class ChatMessageBody with _$ChatMessageBody {
  const factory ChatMessageBody({required String question}) = _ChatMessageBody;

  factory ChatMessageBody.fromJson(Map<String, Object?> json) => _$ChatMessageBodyFromJson(json);
}

class ChatMessage {
  bool fromUser;
  String text;
  ChatMessage({required this.fromUser, required this.text});
}

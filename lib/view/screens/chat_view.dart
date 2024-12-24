import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get_it/get_it.dart';
import 'package:mytal/data/api/api_client.dart';
import 'package:mytal/data/model/body/chat_message_body.dart';
import 'package:mytal/util/app_colors.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/widgets/typing_indicator.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  bool _isSubmitting = false;

  final List<ChatMessage> _messages = [
    ChatMessage(
      text: "Hi, how can I help?",
      fromUser: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListView.builder(
                    itemCount: _messages.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (builderContext, index) {
                      ChatMessage message = _messages[index];
                      return Padding(
                        padding: EdgeInsets.only(right: message.fromUser ? 0 : 50, left: message.fromUser ? 50 : 0),
                        child: Card(
                          color: message.fromUser ? AppColors.color(context, 50) : null,
                          child: Padding(
                            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                            child: Text(message.text),
                          ),
                        ),
                      );
                    },
                  ),
                  _isSubmitting
                      ? TypingIndicator(
                          showIndicator: true,
                          flashingCircleBrightColor: AppColors.color(context, 300),
                          flashingCircleDarkColor: AppColors.color(context, 100),
                        )
                      : const SizedBox(),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
        Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _messageController,
                    minLines: 1,
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a question";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Ask a question...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(Dimensions.radiusLarge)),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,

                      // fillColor: Colors.grey,
                      contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge, vertical: Dimensions.paddingSizeDefault),
                    ),
                  ),
                ),
                const SizedBox(width: Dimensions.paddingSizeDefault),
                FloatingActionButton(
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) return;
                    if (_isSubmitting) return;
                    if (_messageController.text.isEmpty) return;

                    setState(() {
                      _isSubmitting = true;
                    });

                    try {
                      String text = _messageController.text;
                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 1),
                          curve: Curves.easeOut,
                        );
                      });

                      _messageController.clear();

                      FocusManager.instance.primaryFocus?.unfocus();

                      _messages.add(ChatMessage(
                        text: text,
                        fromUser: true,
                      ));

                      String chatMessage = await GetIt.I.get<ApiClient>().chat(ChatMessageBody(
                            question: text,
                          ));

                      _messages.add(ChatMessage(
                        text: chatMessage,
                        fromUser: false,
                      ));
                    } catch (e) {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text(e.toString()),
                      //   ),
                      // );
                    }

                    setState(() {
                      _isSubmitting = false;
                    });
                  },
                  backgroundColor: Theme.of(context).primaryColor,
                  elevation: 0,
                  child: Icon(
                    Icons.send,
                    color: _isSubmitting ? Colors.white.withOpacity(0.5) : Colors.white,
                    size: Dimensions.fontSizeExtraLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:chatbot/features/home/domain/entities/message_entity.dart';
import 'package:chatbot/features/home/presentation/views/widgets/Message_item.dart';
import 'package:flutter/material.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView({
    super.key,
    required this.messages,
  });

  final List<Message> messages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // itemCount: messages.length,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: messages[index].isUser
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              MessageItem(
                message: messages[index],
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          );
        });
  }
}

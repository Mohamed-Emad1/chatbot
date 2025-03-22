import 'package:chatbot/core/secrets/secrets.dart';
import 'package:chatbot/features/home/domain/entities/message_entity.dart';
import 'package:chatbot/features/home/presentation/views/widgets/custom_text_form.dart';
import 'package:chatbot/features/home/presentation/views/widgets/messages_list_view.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final TextEditingController _textController = TextEditingController();

  final model =
      GenerativeModel(model: Secrets.modelName, apiKey: Secrets.apiKey);

  final List<Message> messages = [];

  void sendmessgae() async {
    final message = _textController.text;
    _textController.clear();

    setState(() {
      messages
          .add(Message(isUser: true, message: message, date: DateTime.now()));
    });

    final content = [Content.text(message)];

    final response = await model.generateContent(content);

    setState(() {
      messages.add(Message(
          isUser: false, message: response.text!, date: DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: MessagesListView(messages: messages),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextForm(
                textController: _textController, sendMessgae: sendmessgae),
          ),
        ],
      ),
    );
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:chatbot/core/helper/build_success_snackbar.dart';
import 'package:chatbot/core/helper/strip_string.dart';
import 'package:chatbot/core/routing/app_router.dart';
import 'package:chatbot/core/secrets/secrets.dart';
import 'package:chatbot/core/utils/constant.dart';
import 'package:chatbot/features/home/data/model/tree_model/tree_model.dart';
import 'package:chatbot/features/home/domain/entities/message_entity.dart';
import 'package:chatbot/features/home/presentation/views/widgets/custom_map_button.dart';
import 'package:chatbot/features/home/presentation/views/widgets/custom_text_form.dart';
import 'package:chatbot/features/home/presentation/views/widgets/messages_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

  bool isReady = false;

  void sendmessage() async {
    final message = _textController.text;
    _textController.clear();

    if (message.trim().isEmpty) return;

    setState(() {
      messages
          .add(Message(isUser: true, message: message, date: DateTime.now()));
    });

    String prompt = message;
    if (isReady) {
      prompt = '$kPromptData\n$prompt';
    }

    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);

    if (isReady) {
      // log()
      // log(response.text.toString());
      final raw = cleanJsonArray(response.text ?? '');
      log("raw");
      final dynamic decoded = jsonDecode(raw);
      final mapJson = <String, dynamic>{'data': decoded};
      log(raw);
      final TreeModel tree = TreeModel.fromJson(mapJson);
      log(tree.toString());
      GoRouter.of(context).push(
        AppRouter.kResultMapView,
        extra: tree,
      );
    } else {
      setState(() {
        messages.add(Message(
          isUser: false,
          message: response.text ?? "No response",
          date: DateTime.now(),
        ));
      });
    }
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
          CustomMapButton(
            onPressed: () {
              setState(() {
                isReady = !isReady;
                if (isReady) {
                  buildSuccessSnackBar(context, "Ready to generate map",
                      duration: const Duration(milliseconds: 500));
                }
              });
            },
            isReady: isReady,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextForm(
                textController: _textController, sendMessage: sendmessage),
          ),
        ],
      ),
    );
  }
}

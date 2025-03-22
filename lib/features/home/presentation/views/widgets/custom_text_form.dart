import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm(
      {super.key, required this.textController, required this.sendMessgae});

  final TextEditingController textController;
  final void Function()? sendMessgae;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: textController,
            decoration: InputDecoration(
              fillColor: const Color(0xffD6DEE7),
              filled: true,
              label: const Text("Ask Gemini"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: sendMessgae,
          icon: const Icon(
            Icons.send,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CustomMapButton extends StatelessWidget {
  const CustomMapButton({
    super.key,
    this.onPressed,
    required this.isReady,
  });

  final void Function()? onPressed;
  final bool isReady;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: !isReady
            ? const Color(0xffD6DEE7)
            : const Color.fromARGB(255, 45, 127, 220),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        "Generate Map",
        style: TextStyle(
          color:
              !isReady ? const Color.fromARGB(255, 149, 42, 190) : Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}

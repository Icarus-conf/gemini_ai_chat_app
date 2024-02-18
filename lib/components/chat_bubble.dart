import 'package:flutter/material.dart';
import 'package:gemini_ai_chat/components/text_format.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final String user;
  final Color color;
  const ChatBubble(
      {super.key,
      required this.message,
      required this.color,
      required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PoppinsText(
            text: user,
            fontS: 16,
            color: Colors.white,
          ),
          const Divider(
            thickness: 0.5,
            endIndent: 200,
          ),
          PoppinsText(
            text: message,
            fontS: 16,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ReminderPart extends StatelessWidget {
  const ReminderPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Image.asset(
            'assets/images/profile.png',
            height: 50,
          ),
          const SizedBox(
            width: 10,
          ),
          const Expanded(
            child: Text(
                "Hello user, I'm here to chat with you, but I can't reply.  Hehehehehehehehehehe!'"),
          ),
        ],
      ),
    );
  }
}

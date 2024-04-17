import 'package:firstproject/homepage/homepage.dart';
import 'package:flutter/material.dart';

class GuestPart extends StatelessWidget {
  const GuestPart({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        },
        child: const SizedBox(
            width: double.infinity,
            child: Center(
                child: Text('Continue as a guest',
                    style: TextStyle(color: Colors.green)))));
  }
}

import 'package:firstproject/loginpage/guestpart/guestpart.dart';
import 'package:firstproject/loginpage/loginregisterpart/loginregister.dart';
import 'package:firstproject/loginpage/signupwith/facebook.dart';
import 'package:firstproject/loginpage/signupwith/google.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 150, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/profile.png',
              height: 100,
            ),
            const LoginRegister(),
            const SizedBox(
              height: 20,
            ),
            const Text('Or Sign up with'),
            const Google(),
            const Facebook(),
            const SizedBox(
              height: 20,
            ),
            const GuestPart()
          ],
        ),
      ),
    );
  }
}

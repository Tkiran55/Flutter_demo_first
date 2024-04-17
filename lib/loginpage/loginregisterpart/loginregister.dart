import 'package:firstproject/signuppage/signuppage.dart';
import 'package:flutter/material.dart';

class LoginRegister extends StatelessWidget {
  const LoginRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        const TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
              suffixIcon: Icon(Icons.email)),
        ),
        const SizedBox(
          height: 10,
        ),
        const TextField(
          obscureText: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
              suffixIcon: Icon(Icons.password)),
        ),
        const TextButton(
            onPressed: null,
            child: Text('Forgot password ?',
                style: TextStyle(color: Colors.blue))),
        const ElevatedButton(
            onPressed: null,
            child: SizedBox(
                width: double.infinity, child: Center(child: Text('Login')))),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Don\'t have an account?'),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()));
                },
                child: const Text('Register now',
                    style: TextStyle(color: Colors.blue))),
          ],
        ),
      ],
    );
  }
}

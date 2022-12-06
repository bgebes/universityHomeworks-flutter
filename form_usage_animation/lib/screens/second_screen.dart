import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key, required this.email, required this.password});

  final String email;
  final String password;

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(
      fontSize: 24,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Data"),
      ),
      body: Center(
        child: DefaultTextStyle.merge(
          style: textStyle,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Email: $email"),
              Text("Password: $password"),
            ],
          ),
        ),
      ),
    );
  }
}

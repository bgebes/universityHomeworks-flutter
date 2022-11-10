import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          banner(context),
          loginForm(context),
        ],
      ),
    );
  }
}

Widget banner(BuildContext context) {
  Color primaryColor = Theme.of(context).primaryColor;
  double deviceHeight = MediaQuery.of(context).size.height;

  return Container(
    color: primaryColor,
    height: deviceHeight / 2,
    child: Center(
      child: logo,
    ),
  );
}

Widget loginForm(BuildContext context) {
  Color primaryColor = Theme.of(context).primaryColor;

  const textStyle = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  Widget inputs = Container(
    padding: const EdgeInsets.fromLTRB(64, 36, 64, 0),
    child: Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.50)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(0, 0, 0, 0.50),
                width: 0.25,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Password',
            labelStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.50)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(0, 0, 0, 0.50),
                width: 0.25,
              ),
            ),
          ),
          obscureText: true,
        ),
      ],
    ),
  );

  Widget askTextForgotPassword = const Padding(
    padding: EdgeInsets.symmetric(vertical: 16),
    child: Text(
      'Forgot your password?',
      style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 0.25),
      ),
    ),
  );

  Widget submitButton = Material(
    color: Colors.transparent,
    elevation: 20,
    shadowColor: Theme.of(context).primaryColor,
    child: ElevatedButton(
      onPressed: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: const Text(
          'LOGIN',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );

  return Column(
    children: [
      DefaultTextStyle.merge(
        style: textStyle,
        child: Container(
          color: primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'LOG IN',
              ),
              Text(
                'SIGN UP',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
      inputs,
      askTextForgotPassword,
      submitButton,
    ],
  );
}

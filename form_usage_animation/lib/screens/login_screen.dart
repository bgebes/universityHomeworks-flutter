import 'package:flutter/material.dart';
import 'package:form_usage_animation/actions/actions.dart';
import 'package:form_usage_animation/screens/second_screen.dart';
import 'package:form_usage_animation/widgets/actions_row.dart';
import 'package:form_usage_animation/widgets/bottom_row.dart';
import 'package:form_usage_animation/widgets/form.dart';
import 'package:form_usage_animation/widgets/header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void navigate() {
      navigateOtherScreen(
        context: context,
        otherScreen: SecondScreen(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            const HeaderView(),
            Container(
              height: size.height / 2,
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FormView(
                    formKey: _formKey,
                    textFieldsControllers: [
                      _emailController,
                      _passwordController,
                    ],
                  ),
                  ActionsRowView(
                    formKey: _formKey,
                    navigate: navigate,
                  ),
                  const BottomRowView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

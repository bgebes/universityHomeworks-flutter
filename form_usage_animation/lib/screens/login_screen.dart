import 'package:flutter/material.dart';
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
  String email = "abc", password = "ac";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void onChangeValue(value, newValue) {
      setState(() {
        value = newValue;
      });
    }

    return Scaffold(
      body: Center(
        child: Column(
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
                      email: email,
                      password: password,
                      onChangeValues: [
                        (String? newValue) {
                          onChangeValue(email, newValue);
                        },
                        (String? newValue) {
                          onChangeValue(password, newValue);
                        }
                      ]),
                  ActionsRowView(
                    formKey: _formKey,
                    email: email,
                    password: password,
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

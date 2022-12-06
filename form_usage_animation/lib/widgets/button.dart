import 'package:flutter/material.dart';
import 'package:form_usage_animation/actions/actions.dart';
import 'package:form_usage_animation/screens/second_screen.dart';

class ButtonView extends StatefulWidget {
  const ButtonView({
    super.key,
    required this.formKey,
    required this.email,
    required this.password,
  });

  final GlobalKey<FormState> formKey;
  final String email, password;

  @override
  State<ButtonView> createState() => _ButtonView();
}

class _ButtonView extends State<ButtonView> {
  @override
  Widget build(BuildContext context) {
    void actionEvent() {
      if (widget.formKey.currentState!.validate()) {
        print("Email: " + widget.email);
        print("Password: " + widget.password);

        navigateOtherScreen(
          context: context,
          otherScreen: SecondScreen(
            email: widget.email,
            password: widget.password,
          ),
        );
      }
    }

    return SizedBox(
      height: 75,
      width: 75,
      child: FloatingActionButton(
        onPressed: actionEvent,
        backgroundColor: const Color(0xFF8E4F80),
        child: const Icon(Icons.east),
      ),
    );
  }
}

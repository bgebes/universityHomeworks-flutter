import 'package:flutter/material.dart';
import 'package:form_usage_animation/actions/actions.dart';
import 'package:form_usage_animation/screens/second_screen.dart';

class ButtonView extends StatefulWidget {
  const ButtonView({
    super.key,
    required this.formKey,
    required this.navigate,
  });

  final GlobalKey<FormState> formKey;
  final Function navigate;

  @override
  State<ButtonView> createState() => _ButtonView();
}

class _ButtonView extends State<ButtonView> {
  @override
  Widget build(BuildContext context) {
    void actionEvent() {
      if (widget.formKey.currentState!.validate()) {
        widget.navigate();
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

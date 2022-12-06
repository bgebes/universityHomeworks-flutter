import 'package:flutter/material.dart';
import 'package:form_usage_animation/widgets/button.dart';

class ActionsRowView extends StatefulWidget {
  const ActionsRowView({
    super.key,
    required this.formKey,
    required this.navigate,
  });

  final GlobalKey<FormState> formKey;
  final Function navigate;

  @override
  State<ActionsRowView> createState() => _ActionsRowView();
}

class _ActionsRowView extends State<ActionsRowView> {
  var text = const Text(
    "Sign in",
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        text,
        ButtonView(
          formKey: widget.formKey,
          navigate: widget.navigate,
        ),
      ],
    );
  }
}

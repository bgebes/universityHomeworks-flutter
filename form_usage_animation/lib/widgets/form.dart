import 'package:flutter/material.dart';
import 'package:form_usage_animation/helpers/enums.dart';
import 'package:form_usage_animation/widgets/textformfield.dart';

class FormView extends StatefulWidget {
  const FormView({
    super.key,
    required this.formKey,
    required this.textFieldsControllers,
  });

  final GlobalKey<FormState> formKey;
  final List<TextEditingController> textFieldsControllers;

  @override
  State<FormView> createState() => _FormView();
}

class _FormView extends State<FormView> {
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please type your email!';
    } else if (!value.contains('@')) {
      return 'Please type in correct format!';
    }

    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please type your password!';
    } else if (value.length < 4 || value.length > 8) {
      return 'Your password length should be between 4 and 8';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          TextFormFieldView(
            tft: TextFieldType.email,
            validator: emailValidator,
            controller: widget.textFieldsControllers[0],
          ),
          TextFormFieldView(
            tft: TextFieldType.password,
            validator: passwordValidator,
            controller: widget.textFieldsControllers[1],
          ),
        ],
      ),
    );
  }
}

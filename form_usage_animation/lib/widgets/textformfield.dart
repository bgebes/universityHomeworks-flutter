import 'package:flutter/material.dart';
import 'package:form_usage_animation/helpers/enums.dart';

class TextFormFieldView extends StatefulWidget {
  TextFormFieldView({
    super.key,
    required this.tft,
    required this.validator,
    required this.controller,
  });

  final TextFieldType tft;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  @override
  State<TextFormFieldView> createState() => _TextFormFieldView();
}

class _TextFormFieldView extends State<TextFormFieldView> {
  @override
  Widget build(BuildContext context) {
    bool isTextFieldPassword = widget.tft == TextFieldType.password;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: widget.controller,
        obscureText: isTextFieldPassword,
        decoration: InputDecoration(
          label: Text(isTextFieldPassword ? "Password" : "Email"),
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 16),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}

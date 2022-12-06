import 'dart:ui';

import 'package:flutter/material.dart';

class BottomRowView extends StatefulWidget {
  const BottomRowView({super.key});

  @override
  State<BottomRowView> createState() => _BottomRowView();
}

class _BottomRowView extends State<BottomRowView> {
  var textStyle = const TextStyle(
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
  );

  var text1 = const Text("Sign up");
  var text2 = const Text("Forgot Passwords");

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: textStyle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          text1,
          text2,
        ],
      ),
    );
  }
}

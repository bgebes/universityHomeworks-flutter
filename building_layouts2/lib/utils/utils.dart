import 'package:flutter/material.dart';
import 'dart:async';

void navigateAfterDelay({
  required BuildContext context,
  required Widget nextPage,
  int delay = 5,
}) {
  Timer(Duration(seconds: delay), () {
    Navigator.push(context, MaterialPageRoute(builder: (_) => nextPage));
  });
}

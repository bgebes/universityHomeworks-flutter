import 'package:flutter/material.dart';

Widget logo = Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    Image.asset(
      'lib/assets/images/logo.png',
      height: 80,
      fit: BoxFit.fitHeight,
    ),
    const Text(
      'TeamTrics',
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
);

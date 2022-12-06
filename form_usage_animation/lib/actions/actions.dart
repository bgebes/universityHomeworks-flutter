import 'package:flutter/material.dart';

void navigateOtherScreen(
    {required BuildContext context, required Widget otherScreen}) {
  Navigator.push(
    context,
    PageRouteBuilder(
        pageBuilder: (_, __, ___) => otherScreen,
        transitionsBuilder: (_, animation, __, widget) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: otherScreen,
          );
        }),
  );
}

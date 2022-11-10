import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Responsive and Adaptive Apps',
      home: Screen3(),
      debugShowCheckedModeBanner: false,
    );
  }
}

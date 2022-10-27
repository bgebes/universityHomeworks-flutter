import 'package:flutter/material.dart';
import 'package:building_layouts2/screens/login_screen.dart';
import 'package:building_layouts2/utils/utils.dart';
import '../widgets/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    navigateAfterDelay(context: context, nextPage: LoginScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: logo,
      ),
    );
  }
}

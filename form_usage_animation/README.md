## Ondokuz Mayıs Üniversitesi Mobil Programlama Ödev 7

### Kodlar

```dart
// main.dart

import 'package:flutter/material.dart';
import 'package:form_usage_animation/screens/login_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// screens/login_screen.dart

import 'package:flutter/material.dart';
import 'package:form_usage_animation/actions/actions.dart';
import 'package:form_usage_animation/screens/second_screen.dart';
import 'package:form_usage_animation/widgets/actions_row.dart';
import 'package:form_usage_animation/widgets/bottom_row.dart';
import 'package:form_usage_animation/widgets/form.dart';
import 'package:form_usage_animation/widgets/header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void navigate() {
      navigateOtherScreen(
        context: context,
        otherScreen: SecondScreen(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            const HeaderView(),
            Container(
              height: size.height / 2,
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FormView(
                    formKey: _formKey,
                    textFieldsControllers: [
                      _emailController,
                      _passwordController,
                    ],
                  ),
                  ActionsRowView(
                    formKey: _formKey,
                    navigate: navigate,
                  ),
                  const BottomRowView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// screens/seconds_screen.dart

import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key, required this.email, required this.password});

  final String email;
  final String password;

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(
      fontSize: 24,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Data"),
      ),
      body: Center(
        child: DefaultTextStyle.merge(
          style: textStyle,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Email: $email"),
              Text("Password: $password"),
            ],
          ),
        ),
      ),
    );
  }
}

// actions/actions.dart

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

// helpers/enums.dart

enum TextFieldType { email, password }

// widgets/actions_row.dart

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

// widgets/bottom_row.dart

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

// widgets/button.dart

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

// widgets/form.dart

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

// widgets/header.dart

import 'package:flutter/material.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/header.png"),
          fit: BoxFit.fill,
        ),
      ),
      height: size.height / 2,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.chevron_left_rounded,
              color: Colors.white,
              size: 32,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 16),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Welcome\nBack",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// widgets/textformfield.dart

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

```

### Ekran Görüntüleri

<img height="300" src="https://user-images.githubusercontent.com/72809874/206204691-ed97b144-1594-4202-b9ba-798481c7c032.png">
<img height="300" src="https://user-images.githubusercontent.com/72809874/206204701-171fa0fd-b6e8-4ad9-80f8-91808739ec1b.png">
<img height="300" src="https://user-images.githubusercontent.com/72809874/206204706-b04a8a76-93cf-4dc2-bce2-4c4ca0830cd0.png">

### Proje Github Link

https://github.com/bgebes/universityHomeworks-flutter/tree/master/form_usage_animation

### Öğrenci

- **Ad Soyad**: Berkay Gebeş
- **Bölüm**: Bilgisayar Mühendisliği
- **Numara**: 20060404

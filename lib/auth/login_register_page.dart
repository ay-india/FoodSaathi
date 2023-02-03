import 'package:flutter/material.dart';
import 'package:food_delivery_app/auth/login_page.dart';
import 'package:food_delivery_app/auth/register_page.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({super.key});

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  bool showLoginPage = true;
  void toggles() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: toggles,
      );
    } else {
      return RegisterPage(
        onTap: toggles,
      );
    }
  }
}

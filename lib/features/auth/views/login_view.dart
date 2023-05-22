import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/ui_constants.dart';
import '../../../core/theme/core_theme.dart';
import '../../../core/widgets/main_util_button.dart';
import '../widgets/auth_field.dart';
import 'register_view.dart';

class LoginView extends StatefulWidget {
  static route() => MaterialPageRoute(
    builder: (context) => const LoginView(),
  );

  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const Text(
                    "Log In",
                    style: TextStyle(color: Palette.text, fontSize: 30),
                  ),
                  const SizedBox(height: 60),
                  AuthField(
                    controller: emailController,
                    hintText: "Email",
                  ),
                  const SizedBox(height: 10),
                  AuthField(
                    controller: passwordController,
                    hintText: "Password",
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topRight,
                    child: MainUtilityButton(
                      label: "Login",
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: const TextStyle(color: Palette.text),
                      children: [
                        TextSpan(
                          text: "Register.",
                          style: const TextStyle(
                            color: Palette.primary,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                RegisterView.route(),
                              );
                            },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

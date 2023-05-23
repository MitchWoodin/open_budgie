import 'package:budgie_finance/core/constants/asset_constants.dart';
import 'package:budgie_finance/core/core.dart';
import 'package:budgie_finance/features/auth/controller/auth_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/ui_constants.dart';
import '../../../core/theme/core_theme.dart';
import '../../../core/widgets/loading_page.dart';
import '../../../core/widgets/main_util_button.dart';
import '../widgets/auth_field.dart';
import 'register_view.dart';

class LoginView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LoginView(),
      );

  const LoginView({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onLogin() {
    ref.read(authControllerProvider.notifier).login(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);

    return Scaffold(
      backgroundColor: Palette.primaryVariant,
      body: isLoading
          ? const Loader()
          : Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Card(
                  color: Palette.background,
                  elevation: 20,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      child: Column(
                        children: [
                          const Text(
                            "Log In",
                            style: TextStyle(color: Palette.text, fontSize: 30),
                          ),
                          const SizedBox(height: 30),
                          Image.asset(AssetConstants.SMALL_LOGO, height: 100,),
                          const SizedBox(height: 30),
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
                              onTap: onLogin,
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
            ),
    );
  }
}

import 'package:budgie_finance/core/widgets/loading_page.dart';
import 'package:budgie_finance/features/budget/views/budget_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/core_constants.dart';
import '../../../core/theme/core_theme.dart';
import '../../../core/widgets/main_util_button.dart';
import '../controller/auth_controller.dart';
import '../widgets/auth_field.dart';
import 'login_view.dart';

class RegisterView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const RegisterView(),
      );

  const RegisterView({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onRegister() {
    ref.read(authControllerProvider.notifier).register(
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
                            "Register",
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
                              label: "Register Account",
                              onTap: onRegister,
                            ),
                          ),
                          const SizedBox(height: 20),
                          RichText(
                            text: TextSpan(
                              text: "Already have an account? ",
                              style: const TextStyle(color: Palette.text),
                              children: [
                                TextSpan(
                                  text: "Log In",
                                  style: const TextStyle(
                                    color: Palette.primary,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        LoginView.route(),
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

import 'package:appwrite/models.dart';
import 'package:budgie_finance/features/auth/views/login_view.dart';
import 'package:budgie_finance/features/budget/views/budget_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../api/auth_api.dart';
import '../../../core/core.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
    authAPI: ref.watch(authAPIProvider),
  );
});

final currentUserAccountProvider = FutureProvider((ref) async {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.currentUser();
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;

  AuthController({required AuthAPI authAPI})
      : _authAPI = authAPI,
        super(false);

  Future<User?> currentUser() => _authAPI.currentUserAccount();

  void register({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final response = await _authAPI.register(
      email: email,
      password: password,
    );
    state = false;
    response.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        showSnackBar(context, "Account created successfully!");
        Navigator.push(context, LoginView.route());
      },
    );
  }

  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final response = await _authAPI.login(
      email: email,
      password: password,
    );
    state = false;
    response.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        Navigator.push(context, BudgetView.route());
      },
    );
  }
}

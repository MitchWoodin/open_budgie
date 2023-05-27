import 'package:appwrite/models.dart';
import 'package:budgie_finance/core/core.dart';
import 'package:budgie_finance/features/auth/controller/auth_controller.dart';
import 'package:budgie_finance/models/transaction_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../api/auth_api.dart';
import '../../../api/transaction_api.dart';

final transactionControllerProvider =
    StateNotifierProvider<TransactionController, bool>((ref) {
  return TransactionController(
    transactionAPI: ref.watch(transactionAPIProvider),
    authAPI: ref.watch(authAPIProvider),
  );
});

final currentUserAccountProvider = FutureProvider((ref) async {
  final authController = ref.watch(transactionControllerProvider.notifier);
  return authController.currentUser();
});

class TransactionController extends StateNotifier<bool> {
  final TransactionAPI _transactionAPI;
  final AuthAPI _authAPI;

  TransactionController(
      {required TransactionAPI transactionAPI, required AuthAPI authAPI})
      : _transactionAPI = transactionAPI,
        _authAPI = authAPI,
        super(false);

  Future<User?> currentUser() => _authAPI.currentUserAccount();

  void addTransaction({
    required String email,
    required String date,
    required String account,
    required String paidTo,
    required String category,
    double payment = 0.0,
    double deposit = 0.0,
    required BuildContext context,
  }) async {
    state = true;
    TransactionModel transaction = TransactionModel(
      email: email,
      date: date,
      account: account,
      paidTo: paidTo,
      category: category,
      payment: payment,
      deposit: deposit,
    );
    final response = await _transactionAPI.addTransaction(transaction);
    state = false;
    response.fold(
      (l) => showSnackBar(context, l.message),
      (r) => showSnackBar(context, "Transaction added successfully"),
    );
  }
}

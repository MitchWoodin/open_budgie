import 'package:budgie_finance/core/core.dart';
import 'package:budgie_finance/models/transaction_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../api/transaction_api.dart';

final transactionControllerProvider =
    StateNotifierProvider<TransactionController, bool>((ref) {
  return TransactionController(
    transactionAPI: ref.watch(transactionAPIProvider),
  );
});

class TransactionController extends StateNotifier<bool> {
  final TransactionAPI _transactionAPI;

  // final Ref _ref;

  TransactionController({required TransactionAPI transactionAPI})
      : _transactionAPI = transactionAPI,
        super(false);

  void addTransaction({
    required String userId,
    required String date,
    required String account,
    required String paidTo,
    required String category,
    required double payment,
    required double deposit,
    required BuildContext context,
  }) async {
    state = true;
    TransactionModel transaction = TransactionModel(
      email: userId,
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../api/transaction_api.dart';

final transactionControllerProvider =
    StateNotifierProvider<TransactionController, bool>((ref) {
  return TransactionController(
    ref: ref,
    transactionAPI: ref.watch(transactionAPIProvider),
  );
});

class TransactionController extends StateNotifier<bool> {
  final TransactionAPI _transactionAPI;
  final Ref _ref;

  TransactionController(
      {required Ref ref, required TransactionAPI transactionAPI})
      : _ref = ref,
        _transactionAPI = transactionAPI,
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
  }) {}
}

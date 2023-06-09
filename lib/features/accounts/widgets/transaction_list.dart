import 'package:budgie_finance/core/constants/appwrite_constants.dart';
import 'package:budgie_finance/core/pages/core_pages.dart';
import 'package:budgie_finance/features/accounts/controller/transaction_controller.dart';
import 'package:budgie_finance/models/transaction_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionList extends ConsumerWidget {
  const TransactionList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getAccountTransactionsProvider).when(
          data: (transactions) {
            return ref.watch(getLatestTransactionProvider).when(
                  data: (latestChange) {
                    if (latestChange.events.contains(
                        'databases.*.collections.${AppwriteConstants.transactionCollectionId}.documents.*.create')) {
                      transactions.insert(
                          0, TransactionModel.fromMap(latestChange.payload));
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: transactions.length,
                      itemBuilder: (BuildContext context, int index) {
                        final transaction = transactions[index];
                        return Text(transaction.date);
                      },
                    );
                  },
                  error: (error, stackTrace) =>
                      ErrorText(error: error.toString()),
                  loading: () {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: transactions.length,
                      itemBuilder: (BuildContext context, int index) {
                        final transaction = transactions[index];
                        return Text(transaction.date);
                      },
                    );
                  },
                );
          },
          error: (error, stackTrace) => ErrorText(error: error.toString()),
          loading: () => const Loader(),
        );
  }
}

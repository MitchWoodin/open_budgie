import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:budgie_finance/core/constants/appwrite_constants.dart';
import 'package:budgie_finance/models/transaction_models.dart';
import 'package:budgie_finance/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final transactionAPIProvider = Provider((ref) {
  return TransactionAPI(db: ref.watch(appwriteDatabaseProvider));
});

abstract class ITransactionAPI {
  FEither<Document> addTransaction(TransactionModel transaction);
}

class TransactionAPI implements ITransactionAPI {
  final Databases _db;

  TransactionAPI({required Databases db}) : _db = db;

  @override
  FEither<Document> addTransaction(TransactionModel transaction) async {
    try {
      final document = await _db.createDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.transactionCollectionId,
        documentId: ID.unique(),
        data: transaction.toMap(),
      );
      return right(document);
    } on AppwriteException catch (e, stackTrace) {
      return left(Failure(e.message ?? "Unknown error occurred", stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}

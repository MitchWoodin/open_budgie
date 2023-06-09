import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:budgie_finance/core/constants/appwrite_constants.dart';
import 'package:budgie_finance/models/transaction_models.dart';
import 'package:budgie_finance/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final transactionAPIProvider = Provider((ref) {
  return TransactionAPI(
    db: ref.watch(appwriteDatabaseProvider),
    realtime: ref.watch(appwriteRealtimeProvider),
  );
});

abstract class ITransactionAPI {
  FEither<Document> addTransaction(TransactionModel transaction);

  Future<List<Document>> getAccountTransactions();

  Stream<RealtimeMessage> getLatestTransaction();
}

class TransactionAPI implements ITransactionAPI {
  final Databases _db;
  final Realtime _realtime;

  TransactionAPI({
    required Databases db,
    required Realtime realtime,
  })  : _db = db,
        _realtime = realtime;

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

  @override
  Future<List<Document>> getAccountTransactions() async {
    final documents = await _db.listDocuments(
      databaseId: AppwriteConstants.databaseId,
      collectionId: AppwriteConstants.transactionCollectionId,
      queries: [
        Query.equal('email', "test@email.com"),
        Query.orderDesc('date'),
      ],
    );
    return documents.documents;
  }

  @override
  Stream<RealtimeMessage> getLatestTransaction() {
    return _realtime.subscribe([
      'databases.${AppwriteConstants.databaseId}.collections.${AppwriteConstants.transactionCollectionId}.documents',
    ]).stream;
  }
}

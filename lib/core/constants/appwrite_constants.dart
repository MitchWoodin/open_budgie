import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppwriteConstants {
  static String endPoint = dotenv.env['APPWRITE_ENDPOINT'] ?? "endPoint not found";
  static String projectId = dotenv.env['PROJECT_ID'] ?? "projectId not found";
  static String databaseId = dotenv.env['DB_ID'] ?? "databaseId not found";
  static String transactionCollectionId = dotenv.env['TRANSACTION_COLLECTION_ID'] ?? "transactionCollectionId not found";
}

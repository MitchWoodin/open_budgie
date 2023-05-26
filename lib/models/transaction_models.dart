import 'dart:ffi';
import 'package:flutter/foundation.dart';

@immutable
class TransactionModel {
  final String userId;
  final String date;
  final String account;
  final String paidTo;
  final String category;
  final Double payment;
  final Double deposit;

//<editor-fold desc="Data Methods">
  const TransactionModel({
    required this.userId,
    required this.date,
    required this.account,
    required this.paidTo,
    required this.category,
    required this.payment,
    required this.deposit,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionModel &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          date == other.date &&
          account == other.account &&
          paidTo == other.paidTo &&
          category == other.category &&
          payment == other.payment &&
          deposit == other.deposit);

  @override
  int get hashCode =>
      userId.hashCode ^
      date.hashCode ^
      account.hashCode ^
      paidTo.hashCode ^
      category.hashCode ^
      payment.hashCode ^
      deposit.hashCode;

  @override
  String toString() {
    return '''
      TransactionModel{ userId: $userId, date: $date, account: $account, 
      paidTo: $paidTo, payment: $payment, deposit: $deposit,}''';
  }

  TransactionModel copyWith({
    String? userId,
    String? date,
    String? account,
    String? paidTo,
    String? category,
    Double? payment,
    Double? deposit,
  }) {
    return TransactionModel(
      userId: userId ?? this.userId,
      date: date ?? this.date,
      account: account ?? this.account,
      paidTo: paidTo ?? this.paidTo,
      category: category ?? this.category,
      payment: payment ?? this.payment,
      deposit: deposit ?? this.deposit,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'account': account,
      'paidTo': paidTo,
      'category': category,
      'payment': payment,
      'deposit': deposit,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      userId: map['\$id'] as String,
      date: map['date'] as String,
      account: map['account'] as String,
      paidTo: map['paidTo'] as String,
      category: map['category'] as String,
      payment: map['payment'] as Double,
      deposit: map['deposit'] as Double,
    );
  }

//</editor-fold>
}

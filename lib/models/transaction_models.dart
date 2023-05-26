import 'package:flutter/foundation.dart';

@immutable
class TransactionModel {
  final String email;
  final String date;
  final String account;
  final String paidTo;
  final String category;
  final double payment;
  final double deposit;

//<editor-fold desc="Data Methods">
  const TransactionModel({
    required this.email,
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
          email == other.email &&
          date == other.date &&
          account == other.account &&
          paidTo == other.paidTo &&
          category == other.category &&
          payment == other.payment &&
          deposit == other.deposit);

  @override
  int get hashCode =>
      email.hashCode ^
      date.hashCode ^
      account.hashCode ^
      paidTo.hashCode ^
      category.hashCode ^
      payment.hashCode ^
      deposit.hashCode;

  @override
  String toString() {
    return '''
      TransactionModel{ userId: $email, date: $date, account: $account, 
      paidTo: $paidTo, payment: $payment, deposit: $deposit,}''';
  }

  TransactionModel copyWith({
    String? userId,
    String? date,
    String? account,
    String? paidTo,
    String? category,
    double? payment,
    double? deposit,
  }) {
    return TransactionModel(
      email: userId ?? this.email,
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
      'Email': email,
      'Date': date,
      'Account': account,
      'PaidTo': paidTo,
      'Category': category,
      'Payment': payment,
      'Deposit': deposit,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      email: map['Email'] as String,
      date: map['Date'] as String,
      account: map['Account'] as String,
      paidTo: map['PaidTo'] as String,
      category: map['Category'] as String,
      payment: map['Payment'] as double,
      deposit: map['Deposit'] as double,
    );
  }

//</editor-fold>
}

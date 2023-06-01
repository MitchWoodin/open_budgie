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
      TransactionModel{ email: $email, date: $date, account: $account, 
      paidTo: $paidTo, payment: $payment, deposit: $deposit,}''';
  }

  TransactionModel copyWith({
    String? email,
    String? date,
    String? account,
    String? paidTo,
    String? category,
    double? payment,
    double? deposit,
  }) {
    return TransactionModel(
      email: email ?? this.email,
      date: date ?? this.date,
      account: account ?? this.account,
      paidTo: paidTo ?? this.paidTo,
      category: category ?? this.category,
      payment: payment ?? this.payment,
      deposit: deposit ?? this.deposit,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'date': date});
    result.addAll({'account': account});
    result.addAll({'paidTo': paidTo});
    result.addAll({'category': category});
    result.addAll({'payment': payment});
    result.addAll({'deposit': deposit});

    return result;
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      email: map['Email'] ?? "",
      date: map['Date'] ?? "",
      account: map['Account'] ?? "",
      paidTo: map['PaidTo'] ?? "",
      category: map['Category'] ?? "",
      payment: map['Payment']?.toDouble() ?? 0.0,
      deposit: map['Deposit']?.toDouble() ?? 0.0,
    );
  }

//</editor-fold>
}

import 'dart:convert';
import 'package:taekwondo/core/models/meta.dart';

class TransactionsResponse {
  final Meta meta;
  final List<Transaction> data;

  TransactionsResponse({required this.meta, required this.data});

  factory TransactionsResponse.fromJson(String str) =>
      TransactionsResponse.fromMap(json.decode(str));

  factory TransactionsResponse.fromMap(Map<String, dynamic> map) {
    return TransactionsResponse(
      meta: Meta.fromMap(map["meta"]),
      data: map['data'] != null
          ? List<Transaction>.from(
              map['data'].map((x) => Transaction.fromMap(x)),
            )
          : [],
    );
  }
}

class TransactionResponse {
  final Meta meta;
  final Transaction data;

  TransactionResponse({required this.meta, required this.data});

  factory TransactionResponse.fromJson(String str) =>
      TransactionResponse.fromMap(json.decode(str));

  factory TransactionResponse.fromMap(Map<String, dynamic> map) {
    return TransactionResponse(
      meta: Meta.fromMap(map["meta"]),
      data: Transaction.fromMap(map["meta"]),
    );
  }
}

class Transaction {
  final String id;
  final String title;
  final String imageUrl;
  final String? description;
  final TransactionCategory? category;
  final DateTime? date;

  Transaction({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.description,
    this.category,
    this.date,
  });

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String str) =>
      Transaction.fromMap(json.decode(str));

  factory Transaction.fromMap(Map<String, dynamic> map) => Transaction(
    id: map['id'],
    title: map['title'],
    description: map['description'],
    imageUrl: map['image_url'],
    category: map['category'] != null
        ? TransactionCategory.fromMap(map['category'])
        : null,
    date: map['date'] != null ? DateTime.parse(map['date']) : null,
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "description": description,
    "image_url": imageUrl,
    "category": category?.toMap(),
    "date": date?.toIso8601String(),
  };
}

class TransactionCategory {
  final String id;
  final String name;
  final String? imageUrl;

  TransactionCategory({required this.id, required this.name, this.imageUrl});

  String toJson() => json.encode(toMap());

  factory TransactionCategory.fromJson(String str) =>
      TransactionCategory.fromMap(json.decode(str));

  factory TransactionCategory.fromMap(Map<String, dynamic> map) =>
      TransactionCategory(
        id: map['id'],
        name: map['name'],
        imageUrl: map['image_url'],
      );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "image_url": imageUrl,
  };
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:taekwondo/core/models/meta.dart';
import 'package:taekwondo/core/models/pagination.dart';
import 'package:taekwondo/core/themes/app_colors.dart';

enum RewardType { bronze, gold, platinum }

class RewardsResponse {
  final Meta meta;
  final List<Reward> data;
  final Pagination pagination;

  RewardsResponse({
    required this.meta,
    required this.data,
    required this.pagination,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
    "meta": meta.toMap(),
    "data": data,
    "pagination": pagination.toMap(),
  };

  factory RewardsResponse.fromJson(String str) =>
      RewardsResponse.fromMap(json.decode(str));

  factory RewardsResponse.fromMap(Map<String, dynamic> map) {
    return RewardsResponse(
      meta: Meta.fromMap(map['meta']),
      data: map['data']["Items"] != null
          ? List<Reward>.from(
              map['data']["Items"].map((x) => Reward.fromMap(x)),
            )
          : [],
      pagination: Pagination.fromMap(map['data']["Pagination"]),
    );
  }
}

class Reward {
  final int id;
  final String transactionName;
  final String transactionType;
  final String transactionTypeId;
  final String transactionDate;
  final DateTime transactionDateValue;
  final num point;

  Reward({
    required this.id,
    required this.transactionName,
    required this.transactionType,
    required this.transactionTypeId,
    required this.transactionDate,
    required this.transactionDateValue,
    required this.point,
  });

  double get generatedPoint {
    final range = (max - min) / 100;
    return (point - min) / range;
  }

  RewardType get type {
    if (point > 100 && point <= 2000) {
      return RewardType.gold;
    } else if (point > 2000) {
      return RewardType.platinum;
    }
    return RewardType.bronze;
  }

  int get index {
    switch (type) {
      case RewardType.bronze:
        return 0;
      case RewardType.gold:
        return 1;
      case RewardType.platinum:
        return 2;
    }
  }

  String get name {
    switch (type) {
      case RewardType.bronze:
        return "Bronze";
      case RewardType.gold:
        return "Gold";
      case RewardType.platinum:
        return "Platinum";
    }
  }

  double get min {
    switch (type) {
      case RewardType.bronze:
        return 0;
      case RewardType.gold:
        return 100;
      case RewardType.platinum:
        return 2000;
    }
  }

  double get max {
    switch (type) {
      case RewardType.bronze:
        return 100;
      case RewardType.gold:
        return 2000;
      case RewardType.platinum:
        return 5000;
    }
  }

  Color get color {
    switch (type) {
      case RewardType.bronze:
        return AppColors.peru;
      case RewardType.gold:
        return AppColors.jasmine;
      case RewardType.platinum:
        return AppColors.platinum;
    }
  }

  factory Reward.fromMap(Map<String, dynamic> map) {
    return Reward(
      id: map['id'],
      transactionName: map['transaction_name'],
      transactionType: map['transaction_type'],
      transactionTypeId: map['transaction_type_id'],
      transactionDate: map['transaction_date'],
      transactionDateValue: DateTime.parse(map['transaction_date_value']),
      point: map['point'],
    );
  }
}

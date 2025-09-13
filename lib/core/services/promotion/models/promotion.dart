import 'package:taekwondo/core/models/meta.dart';

class PromotionResponse {
  final Meta meta;
  final List<Promotion> data;

  PromotionResponse({required this.meta, required this.data});

  factory PromotionResponse.fromJson(Map<String, dynamic> map) {
    return PromotionResponse(
      meta: Meta.fromJson(map['meta']),
      data: map['data'] != null
          ? List<Promotion>.from(map['data'].map((x) => Promotion.fromJson(x)))
          : [],
    );
  }
}

class Promotion {
  final int id;
  final String promotionCode;
  final String title;
  final String description;
  final String imageUrl;
  final DateTime startDate;
  final DateTime endDate;
  final List<PromotionMenu> menus;
  final List<PromotionOutlet> branches;

  Promotion({
    required this.id,
    required this.promotionCode,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.startDate,
    required this.endDate,
    required this.menus,
    required this.branches,
  });

  factory Promotion.fromJson(Map<String, dynamic> json) {
    return Promotion(
      id: json['id'],
      promotionCode: json['promotion_code'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['image_url'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      menus: json['branches'] != null
          ? List<PromotionMenu>.from(
              json['branches'].map((x) => PromotionMenu.fromJson(x)),
            )
          : [],
      branches: json['branches'] != null
          ? List<PromotionOutlet>.from(
              json['branches'].map((x) => PromotionOutlet.fromJson(x)),
            )
          : [],
    );
  }
}

class PromotionOutlet {
  final String code;
  final String name;
  final String address;
  final String imageUrl;

  PromotionOutlet({
    required this.code,
    required this.name,
    required this.address,
    required this.imageUrl,
  });

  factory PromotionOutlet.fromJson(Map<String, dynamic> json) {
    return PromotionOutlet(
      code: json['code'],
      name: json['name'],
      address: json['address'],
      imageUrl: json['image_url'],
    );
  }
}

class PromotionMenu {
  final int id;
  final String name;
  final String imageUrl;
  final num sellPrice;
  final num originalPrice;
  final num discount;

  PromotionMenu({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.sellPrice,
    required this.originalPrice,
    required this.discount,
  });

  factory PromotionMenu.fromJson(Map<String, dynamic> json) {
    return PromotionMenu(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image_url'],
      sellPrice: json['sell_price'],
      originalPrice: json['original_price'],
      discount: json['discount'],
    );
  }
}

import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:taekwondo/core/models/meta.dart';

class FnBResponse {
  Meta meta;
  FnBOutlet data;

  FnBResponse({required this.meta, required this.data});

  factory FnBResponse.fromJson(String str) =>
      FnBResponse.fromMap(json.decode(str));

  factory FnBResponse.fromMap(Map<String, dynamic> json) {
    return FnBResponse(
      meta: Meta.fromMap(json["meta"]),
      data: FnBOutlet.fromMap(json["data"]),
    );
  }
}

class FnBsResponse {
  Meta meta;
  List<FnBOutlet> data;

  FnBsResponse({required this.meta, required this.data});

  factory FnBsResponse.fromJson(String str) =>
      FnBsResponse.fromMap(json.decode(str));

  factory FnBsResponse.fromMap(Map<String, dynamic> json) {
    return FnBsResponse(
      meta: Meta.fromMap(json["meta"]),
      data: List<FnBOutlet>.from(json["data"].map((x) => FnBOutlet.fromMap(x))),
    );
  }
}

class FnBOutlet {
  final String? description;
  final bool? flagSoldOut;
  final String? imageOptimUrl;
  final String? imageUrl;
  final String? menuCategoryCode;
  final String? menuCategoryDesc;
  final List<FnBCategory>? menuCategoryDetails;
  final int? menuCategoryId;
  final String? orderId;

  FnBOutlet({
    required this.description,
    required this.flagSoldOut,
    required this.imageOptimUrl,
    required this.imageUrl,
    required this.menuCategoryCode,
    required this.menuCategoryDesc,
    required this.menuCategoryDetails,
    required this.menuCategoryId,
    required this.orderId,
  });

  factory FnBOutlet.fromJson(String str) => FnBOutlet.fromMap(json.decode(str));

  factory FnBOutlet.fromMap(Map<String, dynamic> json) {
    return FnBOutlet(
      description: json["description"],
      flagSoldOut: json["flag_sold_out"],
      imageOptimUrl: json["image_optim_url"] ?? "",
      imageUrl: json["image_url"] ?? "",
      menuCategoryCode: json["menu_category_code"],
      menuCategoryDesc: json["menu_category_desc"],
      menuCategoryDetails: List<FnBCategory>.from(
        json["menu_category_details"].map((x) => FnBCategory.fromMap(x)),
      ),
      menuCategoryId: json["menu_category_id"],
      orderId: json["order_id"],
    );
  }
}

class FnBCategory {
  final int? menuCategoryDetailId;
  final String? menuCategoryDetailCode;
  final String? menuCategoryDetailDesc;
  final String? imageUrl;
  final String? imageOptimUrl;
  final bool? flagSoldOut;
  final int? orderId;
  final List<FnBMenu>? menus;

  FnBCategory({
    required this.menuCategoryDetailId,
    required this.menuCategoryDetailCode,
    required this.menuCategoryDetailDesc,
    required this.imageUrl,
    required this.imageOptimUrl,
    required this.flagSoldOut,
    required this.orderId,
    required this.menus,
  });

  factory FnBCategory.fromJson(String str) =>
      FnBCategory.fromMap(json.decode(str));

  factory FnBCategory.fromMap(Map<String, dynamic> json) {
    return FnBCategory(
      menuCategoryDetailId: int.parse(
        json["menu_category_detail_id"].toString(),
      ),
      menuCategoryDetailCode: json["menu_category_detail_code"],
      menuCategoryDetailDesc: json["menu_category_detail_desc"],
      imageUrl: json["image_url"],
      imageOptimUrl: json["image_optim_url"],
      flagSoldOut: json["flag_sold_out"],
      orderId: int.parse(json["order_id"].toString()),
      menus: List<FnBMenu>.from(json["menus"].map((x) => FnBMenu.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
    "menu_category_detail_id": menuCategoryDetailId,
    "menu_category_detail_code": menuCategoryDetailCode,
    "menu_category_detail_desc": menuCategoryDetailDesc,
    "image_url": imageUrl,
    "image_optim_url": imageOptimUrl,
    "flag_sold_out": flagSoldOut,
    "order_id": orderId,
    // "menus": List<dynamic>.from(menus.map((x) => x.toMap())),
  };
}

class FnBMenuExtraDetail {
  final bool? flagSoldOut;
  final int? maxExtraQty;
  final int? menuExtraId;
  final String? menuExtraName;
  final String? menuExtraShortName;
  final int? menuGroupId;
  final int? minExtraQty;
  final String? notes;
  final num? price;
  final num? sellPrice;

  FnBMenuExtraDetail({
    required this.flagSoldOut,
    required this.maxExtraQty,
    required this.menuExtraId,
    required this.menuExtraName,
    required this.menuExtraShortName,
    required this.menuGroupId,
    required this.minExtraQty,
    required this.notes,
    required this.price,
    required this.sellPrice,
  });

  factory FnBMenuExtraDetail.fromJson(String str) =>
      FnBMenuExtraDetail.fromMap(json.decode(str));

  factory FnBMenuExtraDetail.fromMap(Map<String, dynamic> json) {
    return FnBMenuExtraDetail(
      flagSoldOut: json["flag_sold_out"],
      maxExtraQty: json["max_extra_qty"],
      menuExtraId: json["menu_extra_id"],
      menuExtraName: json["menu_extra_name"],
      menuExtraShortName: json["menu_extra_short_name"],
      menuGroupId: json["menu_group_id"],
      minExtraQty: json["min_extra_qty"],
      notes: json["notes"],
      price: double.parse(json["price"].toString()),
      sellPrice: json["sell_price"],
    );
  }
}

enum FnBMenuExtraType { multiple, quantity }

class FnBMenuExtra {
  final int? maxQty;
  final String? menuGroup;
  final int? menuGroupId;
  final int? minQty;
  final String? notes;
  final List<FnBMenuExtraDetail>? extras;

  FnBMenuExtra({
    required this.maxQty,
    required this.menuGroup,
    required this.menuGroupId,
    required this.minQty,
    required this.notes,
    required this.extras,
  });

  FnBMenuExtraType get selectionType {
    return FnBMenuExtraType.quantity;
  }

  factory FnBMenuExtra.fromJson(String str) =>
      FnBMenuExtra.fromMap(json.decode(str));

  factory FnBMenuExtra.fromMap(Map<String, dynamic> json) {
    return FnBMenuExtra(
      maxQty: json["max_qty"] ?? 0,
      menuGroup: json["menu_group"],
      menuGroupId: json["menu_group_id"],
      minQty: json["min_qty"] ?? 0,
      notes: json["notes"],
      extras: List<FnBMenuExtraDetail>.from(
        json["extras"].map((x) => FnBMenuExtraDetail.fromMap(x)),
      ),
    );
  }
}

class FnBRelatedMenu {
  final int? menuId;
  final int? orderId;

  FnBRelatedMenu({required this.menuId, required this.orderId});

  factory FnBRelatedMenu.fromJson(String str) =>
      FnBRelatedMenu.fromMap(json.decode(str));

  factory FnBRelatedMenu.fromMap(Map<String, dynamic> json) {
    return FnBRelatedMenu(menuId: json["menu_id"], orderId: json["order_id"]);
  }
}

class FnBMenuIcon {
  final String? iconName;
  final String? iconUrl;

  FnBMenuIcon({required this.iconName, required this.iconUrl});

  factory FnBMenuIcon.fromJson(String str) =>
      FnBMenuIcon.fromMap(json.decode(str));

  factory FnBMenuIcon.fromMap(Map<String, dynamic> json) {
    return FnBMenuIcon(iconName: json["icon_name"], iconUrl: json["icon_url"]);
  }
}

enum FnBMenuPackageType { multiple, quantity }

class FnBMenuPackage {
  final int? maxQty;
  final String? menuGroup;
  final int? menuGroupId;
  final int? minQty;
  final String? notes;
  final List<FnBMenuPackageDetail>? packages;

  FnBMenuPackage({
    required this.maxQty,
    required this.menuGroup,
    required this.menuGroupId,
    required this.minQty,
    required this.notes,
    required this.packages,
  });

  FnBMenuPackageType get selectionType {
    return ((maxQty ?? 0) > 1)
        ? FnBMenuPackageType.quantity
        : FnBMenuPackageType.multiple;
  }

  factory FnBMenuPackage.fromJson(String str) =>
      FnBMenuPackage.fromMap(json.decode(str));

  factory FnBMenuPackage.fromMap(Map<String, dynamic> json) {
    return FnBMenuPackage(
      maxQty: json["max_qty"],
      menuGroup: json["menu_group"],
      menuGroupId: json["menu_group_id"],
      minQty: json["min_qty"],
      notes: json["notes"],
      packages: json["packages"] != null
          ? List<FnBMenuPackageDetail>.from(
              json["packages"].map((x) => FnBMenuPackageDetail.fromMap(x)),
            )
          : [],
    );
  }
}

class FnBMenuPackageDetail {
  final int? flagDefault;
  final bool? flagSoldOut;
  final String? menuCode;
  final int? menuGroupId;
  final int? menuId;
  final String? menuName;
  final String? menuShortName;
  final num? price;
  final int? qty;
  final num? sellPrice;

  FnBMenuPackageDetail({
    required this.flagDefault,
    required this.flagSoldOut,
    required this.menuCode,
    required this.menuGroupId,
    required this.menuId,
    required this.menuName,
    required this.menuShortName,
    required this.price,
    required this.qty,
    required this.sellPrice,
  });

  factory FnBMenuPackageDetail.fromJson(String str) =>
      FnBMenuPackageDetail.fromMap(json.decode(str));

  factory FnBMenuPackageDetail.fromMap(Map<String, dynamic> json) {
    return FnBMenuPackageDetail(
      flagDefault: json["flag_default"],
      flagSoldOut: json["flag_sold_out"],
      menuCode: json["menu_code"],
      menuGroupId: json["menu_group_id"],
      menuId: json["menu_id"],
      menuName: json["menu_name"],
      menuShortName: json["menu_short_name"],
      price: num.parse(json["price"]?.toString() ?? "0"),
      qty: json["qty"] ?? 0,
      sellPrice: num.parse(json["sell_price"]?.toString() ?? "0"),
    );
  }
}

class FnBMenu {
  final String? catDetailImageUrl;
  final String? description;
  final bool? flagOtherTax;
  final int? flagRecommendation;
  final bool? flagSoldOut;
  final bool? flagTax;
  final String? imageOptimUrl;
  final String? imageThumbnailUrl;
  final String? imageUrl;
  final String? menuCode;
  final List<FnBMenuExtra> menuExtras;
  final int? menuId;
  final List<FnBMenuIcon>? menuIcons;
  final String? menuName;
  final List<FnBMenuPackage>? menuPackages;
  final String? menuShortName;
  final int? orderId;
  final num? originalPrice;
  final num? originalSellPrice;
  final num? price;
  final int? qty;
  final List<FnBRelatedMenu>? relatedMenus;
  final num? sellPrice;
  final int? showMenuImage;
  final String? specialPriceId;
  final String? zeroValueText;

  FnBMenu({
    required this.catDetailImageUrl,
    required this.description,
    required this.flagOtherTax,
    required this.flagRecommendation,
    required this.flagSoldOut,
    required this.flagTax,
    required this.imageOptimUrl,
    required this.imageThumbnailUrl,
    required this.imageUrl,
    required this.menuCode,
    required this.menuExtras,
    required this.menuId,
    required this.menuIcons,
    required this.menuName,
    required this.menuPackages,
    required this.menuShortName,
    required this.orderId,
    required this.originalPrice,
    required this.originalSellPrice,
    required this.price,
    required this.qty,
    required this.relatedMenus,
    required this.sellPrice,
    required this.showMenuImage,
    required this.specialPriceId,
    required this.zeroValueText,
  });

  factory FnBMenu.fromJson(String str) => FnBMenu.fromMap(json.decode(str));

  factory FnBMenu.fromMap(Map<String, dynamic> json) {
    return FnBMenu(
      catDetailImageUrl: json["cat_detail_image_url"] ?? "",
      description: json["description"] ?? "",
      flagOtherTax: json["flag_other_tax"],
      flagRecommendation: json["flag_recommendation"],
      flagSoldOut: json["flag_sold_out"],
      flagTax: json["flag_tax"],
      imageOptimUrl: json["image_optim_url"] ?? "",
      imageThumbnailUrl: json["image_thumbnail_url"],
      imageUrl: json["image_url"] ?? "",
      menuCode: json["menu_code"],
      menuExtras: json["menu_extras"] != null
          ? List<FnBMenuExtra>.from(
              json["menu_extras"].map((x) => FnBMenuExtra.fromMap(x)),
            )
          : [],
      menuId: json["menu_id"],
      menuIcons: json["menu_icons"] != null
          ? List<FnBMenuIcon>.from(
              json["menu_icons"].map((x) => FnBMenuIcon.fromMap(x)),
            )
          : [],
      menuName: json["menu_name"],
      menuPackages: json["menu_packages"] != null
          ? List<FnBMenuPackage>.from(
              json["menu_packages"].map((x) => FnBMenuPackage.fromMap(x)),
            )
          : [],
      menuShortName: json["menu_short_name"],
      orderId: json["order_id"],
      originalPrice: double.parse(json["original_price"].toString()),
      originalSellPrice: double.parse(json["original_sell_price"].toString()),
      price: double.parse(json["price"].toString()),
      qty: json["qty"],
      relatedMenus: json["related_menus"] != null
          ? List<FnBRelatedMenu>.from(
              json["related_menus"].map((x) => FnBRelatedMenu.fromMap(x)),
            )
          : [],
      sellPrice: double.parse(json["sell_price"].toString()),
      showMenuImage: json["show_menu_image"],
      specialPriceId: json["special_price_id"] ?? "",
      zeroValueText: json["zero_value_text"],
    );
  }
}

class FoodBeverage {
  final String? image;
  final String? name;
  final String? description;
  final num? price;
  final num? discount;
  final bool? isAvailable;

  FoodBeverage({
    required this.image,
    required this.name,
    required this.price,
    this.description = '',
    this.discount = 0,
    this.isAvailable = true,
  });

  String get formattedPrice {
    final formatted = NumberFormat("#,##0", "en_US");
    return formatted.format(price);
  }

  String get formattedDiscount {
    final formatted = NumberFormat("#,##0", "en_US");
    final disc = price! - (price! * discount!);
    return formatted.format(disc);
  }

  factory FoodBeverage.fromJson(String str) =>
      FoodBeverage.fromMap(json.decode(str));

  factory FoodBeverage.fromMap(Map<String, dynamic> json) {
    return FoodBeverage(
      image: json["image"],
      name: json["name"],
      description: json["description"],
      price: json["price"],
      discount: json["discount"],
      isAvailable: json["is_available"],
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
    "image": image,
    "name": name,
    "description": description,
    "price": price,
    "discount": discount,
    "is_available": isAvailable,
  };
}

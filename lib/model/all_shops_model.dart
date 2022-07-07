// To parse this JSON data, do
//
//     final allStores = allStoresFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class AllStores {
  AllStores({
    required this.data,
    required this.meta,
  });

  final List<AllStoresDatum> data;
  final Meta meta;

  factory AllStores.fromRawJson(String str) => AllStores.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllStores.fromJson(Map<String, dynamic> json) => AllStores(
    data: List<AllStoresDatum>.from(json["data"].map((x) => AllStoresDatum.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "meta": meta.toJson(),
  };
}

class AllStoresDatum {
  AllStoresDatum({
    required this.identifier,
    required this.storeName,
    required this.storeImgUrl,
    required this.storeCashback,
    required this.couponsCount,
    required this.productsCount,
    required this.categories,
  });

  final int identifier;
  final String storeName;
  final String storeImgUrl;
  final String storeCashback;
  final int couponsCount;
  final int productsCount;
  final Categories? categories;

  factory AllStoresDatum.fromRawJson(String str) => AllStoresDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllStoresDatum.fromJson(Map<String, dynamic> json) => AllStoresDatum(
    identifier: json["identifier"],
    storeName: json["storeName"],
    storeImgUrl: json["storeImgURL"],
    storeCashback: json["storeCashback"],
    couponsCount: json["coupons_count"],
    productsCount: json["products_count"],
    categories: json["categories"]==null?Categories(data: []):Categories.fromJson(json["categories"]),
  );

  Map<String, dynamic> toJson() => {
    "identifier": identifier,
    "storeName": storeName,
    "storeImgURL": storeImgUrl,
    "storeCashback": storeCashback,
    "coupons_count": couponsCount,
    "products_count": productsCount,
    "categories": categories!.toJson(),
  };
}

class Categories {
  Categories({
    required this.data,
  });

  final List<CategoriesDatum> data;

  factory Categories.fromRawJson(String str) => Categories.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    data: List<CategoriesDatum>.from(json["data"].map((x) => CategoriesDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CategoriesDatum {
  CategoriesDatum({
    required this.identifier,
    required this.parentId,
    required this.categoryTitle,
    required this.img,
    required this.ico,
    required this.uri,
    required this.sortNo,
  });

  final int identifier;
  final String parentId;
  final String categoryTitle;
  final String img;
  final String ico;
  final String uri;
  final String sortNo;

  factory CategoriesDatum.fromRawJson(String str) => CategoriesDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoriesDatum.fromJson(Map<String, dynamic> json) => CategoriesDatum(
    identifier: json["identifier"],
    parentId: json["parentID"],
    categoryTitle: json["categoryTitle"],
    img: json["IMG"],
    ico: json["ICO"],
    uri: json["URI"],
    sortNo: json["sortNo"],
  );

  Map<String, dynamic> toJson() => {
    "identifier": identifier,
    "parentID": parentId,
    "categoryTitle": categoryTitle,
    "IMG": img,
    "ICO": ico,
    "URI": uri,
    "sortNo": sortNo,
  };
}

class Meta {
  Meta({
    required this.pagination,
  });

  final Pagination pagination;

  factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "pagination": pagination.toJson(),
  };
}

class Pagination {
  Pagination({
    required this.total,
    required this.count,
    required this.perPage,
    required this.currentPage,
    required this.totalPages,
    required this.links,
  });

  final int total;
  final int count;
  final int perPage;
  final int currentPage;
  final int totalPages;
  final Links links;

  factory Pagination.fromRawJson(String str) => Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    total: json["total"],
    count: json["count"],
    perPage: json["per_page"],
    currentPage: json["current_page"],
    totalPages: json["total_pages"],
    links: Links.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "count": count,
    "per_page": perPage,
    "current_page": currentPage,
    "total_pages": totalPages,
    "links": links.toJson(),
  };
}

class Links {
  Links({
    required this.next,
  });

  final String next;

  factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "next": next,
  };
}

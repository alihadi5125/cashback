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

  List<AllStoresDatum> data;
  Meta meta;

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

  int identifier;
  String storeName;
  String storeImgUrl;
  String storeCashback;
  int couponsCount;
  int productsCount;
  Categories categories;

  factory AllStoresDatum.fromRawJson(String str) => AllStoresDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllStoresDatum.fromJson(Map<String, dynamic> json) => AllStoresDatum(
    identifier: json["identifier"],
    storeName: json["storeName"],
    storeImgUrl: json["storeImgURL"],
    storeCashback: json["storeCashback"],
    couponsCount: json["coupons_count"],
    productsCount: json["products_count"]??0,
    categories: Categories.fromJson(json["categories"]),
  );

  Map<String, dynamic> toJson() => {
    "identifier": identifier,
    "storeName": storeName,
    "storeImgURL": storeImgUrl,
    "storeCashback": storeCashback,
    "coupons_count": couponsCount,
    "products_count": productsCount,
    "categories": categories.toJson(),
  };
}

class Categories {
  Categories({
    required this.data,
  });

  List<CategoriesDatum> data;

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

  int identifier;
  String parentId;
  String categoryTitle;
  String img;
  String ico;
  String uri;
  String sortNo;

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

  Pagination pagination;

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

  int total;
  int count;
  int perPage;
  int currentPage;
  int totalPages;
  Links links;

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

  String next;

  factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "next": next,
  };
}

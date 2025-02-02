import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  @JsonKey(name: "data")
  final List<ProductModelData>? data;
  @JsonKey(name: "pagination")
  final ProductPaginationModel? pagination;

  ProductModel({
    this.data,
    this.pagination,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class ProductModelData {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "short_description")
  final String? shortDescription;
  @JsonKey(name: "icon")
  final String? icon;
  @JsonKey(name: "image")
  final List<String>? image;
  @JsonKey(name: "quintity")
  final int? quintity;
  @JsonKey(name: "price")
  final double? price;
  @JsonKey(name: "discount")
  final int? discount;
  @JsonKey(name: "rating")
  final double? rating;
  @JsonKey(name: "rating_count")
  final int? ratingCount;
  @JsonKey(name: "colors")
  final ColorsModel? colors;
  @JsonKey(name: "size")
  final SizeModel? size;
  @JsonKey(name: "category")
  final String? category;

  ProductModelData({
    this.id,
    this.name,
    this.description,
    this.shortDescription,
    this.icon,
    this.image,
    this.quintity,
    this.price,
    this.discount,
    this.rating,
    this.ratingCount,
    this.colors,
    this.size,
    this.category,
  });

  factory ProductModelData.fromJson(Map<String, dynamic> json) =>
      _$ProductModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelDataToJson(this);
}

@JsonSerializable()
class ColorsModel {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "color_hex_flutter")
  final String? colorHexFlutter;

  ColorsModel({
    this.name,
    this.colorHexFlutter,
  });

  factory ColorsModel.fromJson(Map<String, dynamic> json) =>
      _$ColorsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ColorsModelToJson(this);
}

@JsonSerializable()
class SizeModel {
  @JsonKey(name: "width")
  final int? width;
  @JsonKey(name: "depth")
  final int? depth;
  @JsonKey(name: "heigth")
  final int? heigth;
  @JsonKey(name: "seat_width")
  final int? seatWidth;
  @JsonKey(name: "seat_depth")
  final int? seatDepth;
  @JsonKey(name: "seat_heigth")
  final int? seatHeigth;

  SizeModel({
    this.width,
    this.depth,
    this.heigth,
    this.seatWidth,
    this.seatDepth,
    this.seatHeigth,
  });

  factory SizeModel.fromJson(Map<String, dynamic> json) =>
      _$SizeModelFromJson(json);

  Map<String, dynamic> toJson() => _$SizeModelToJson(this);
}

@JsonSerializable()
class ProductPaginationModel {
  @JsonKey(name: "total_records")
  final int? totalRecords;
  @JsonKey(name: "current_page")
  final int? currentPage;
  @JsonKey(name: "total_pages")
  final int? totalPages;
  @JsonKey(name: "next_page")
  final dynamic nextPage;
  @JsonKey(name: "prev_page")
  final dynamic prevPage;

  ProductPaginationModel({
    this.totalRecords,
    this.currentPage,
    this.totalPages,
    this.nextPage,
    this.prevPage,
  });

  factory ProductPaginationModel.fromJson(Map<String, dynamic> json) =>
      _$ProductPaginationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductPaginationModelToJson(this);
}

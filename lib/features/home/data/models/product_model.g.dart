// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductModelData.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : ProductPaginationModel.fromJson(
              json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'pagination': instance.pagination,
    };

ProductModelData _$ProductModelDataFromJson(Map<String, dynamic> json) =>
    ProductModelData(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      shortDescription: json['short_description'] as String?,
      icon: json['icon'] as String?,
      image:
          (json['image'] as List<dynamic>?)?.map((e) => e as String).toList(),
      quintity: (json['quintity'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toInt(),
      rating: (json['rating'] as num?)?.toDouble(),
      ratingCount: (json['rating_count'] as num?)?.toInt(),
      colors: json['colors'] == null
          ? null
          : ColorsModel.fromJson(json['colors'] as Map<String, dynamic>),
      size: json['size'] == null
          ? null
          : SizeModel.fromJson(json['size'] as Map<String, dynamic>),
      category: json['category'] as String?,
    );

Map<String, dynamic> _$ProductModelDataToJson(ProductModelData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'short_description': instance.shortDescription,
      'icon': instance.icon,
      'image': instance.image,
      'quintity': instance.quintity,
      'price': instance.price,
      'discount': instance.discount,
      'rating': instance.rating,
      'rating_count': instance.ratingCount,
      'colors': instance.colors,
      'size': instance.size,
      'category': instance.category,
    };

ColorsModel _$ColorsModelFromJson(Map<String, dynamic> json) => ColorsModel(
      name: json['name'] as String?,
      colorHexFlutter: json['color_hex_flutter'] as String?,
    );

Map<String, dynamic> _$ColorsModelToJson(ColorsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'color_hex_flutter': instance.colorHexFlutter,
    };

SizeModel _$SizeModelFromJson(Map<String, dynamic> json) => SizeModel(
      width: (json['width'] as num?)?.toInt(),
      depth: (json['depth'] as num?)?.toInt(),
      heigth: (json['heigth'] as num?)?.toInt(),
      seatWidth: (json['seat_width'] as num?)?.toInt(),
      seatDepth: (json['seat_depth'] as num?)?.toInt(),
      seatHeigth: (json['seat_heigth'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SizeModelToJson(SizeModel instance) => <String, dynamic>{
      'width': instance.width,
      'depth': instance.depth,
      'heigth': instance.heigth,
      'seat_width': instance.seatWidth,
      'seat_depth': instance.seatDepth,
      'seat_heigth': instance.seatHeigth,
    };

ProductPaginationModel _$ProductPaginationModelFromJson(
        Map<String, dynamic> json) =>
    ProductPaginationModel(
      totalRecords: (json['total_records'] as num?)?.toInt(),
      currentPage: (json['current_page'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      nextPage: json['next_page'],
      prevPage: json['prev_page'],
    );

Map<String, dynamic> _$ProductPaginationModelToJson(
        ProductPaginationModel instance) =>
    <String, dynamic>{
      'total_records': instance.totalRecords,
      'current_page': instance.currentPage,
      'total_pages': instance.totalPages,
      'next_page': instance.nextPage,
      'prev_page': instance.prevPage,
    };

import 'package:home_heven_app/features/home/data/models/product_model.dart';
import 'package:home_heven_app/features/home/domain/enteties/product_entity.dart';

class ProductMapper {
  static ProductEntity mapProductEntity(ProductModel? model) {
    return ProductEntity(
        data: model?.data?.map((e) => mapProductDataEntity(e)).toList(),
        pagination: mapProductPaginationEntity(model?.pagination));
  }

  // product data uchun
  static ProductDataEntity mapProductDataEntity(ProductModelData? model) {
    return ProductDataEntity(
      colors: mapColor(model?.colors),
      category: model?.category,
      description: model?.description,
      discount: model?.discount,
      icon: model?.icon,
      id: model?.id,
      image: model?.image,
      name: model?.name,
      price: model?.price,
      quintity: model?.quintity,
      rating: model?.rating,
      ratingCount: model?.ratingCount,
      shortDescription: model?.shortDescription,
      size: mapSize(model?.size),
    );
  }

// colors uchun
  static Colors mapColor(ColorsModel? model) {
    return Colors(
      colorHexFlutter: model?.colorHexFlutter,
      name: model?.name,
    );
  }

  //
  static Size mapSize(SizeModel? model) {
    return Size(
        depth: model?.depth,
        heigth: model?.heigth,
        seatDepth: model?.seatDepth,
        seatHeigth: model?.seatHeigth,
        seatWidth: model?.seatWidth,
        width: model?.width);
  }

  //pagination un
  static ProductPaginationEntity mapProductPaginationEntity(
      ProductPaginationModel? model) {
    return ProductPaginationEntity(
        currentPage: model?.currentPage,
        nextPage: model?.nextPage,
        prevPage: model?.prevPage,
        totalPages: model?.totalPages,
        totalRecords: model?.totalRecords);
  }
}

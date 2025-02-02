import 'package:home_heven_app/features/home/data/models/banner_model.dart';
import 'package:home_heven_app/features/home/domain/enteties/banner_entity.dart';

class BannerMapper {
  static BannerEntity mapBannerEntity(BannerModel? model) {
    return BannerEntity(
        data: model?.data?.map((e) => mapBannerData(e)).toList(),
        pagination: mapPagination(model?.pagination));
  }

// banner data uchun
  static BannerData mapBannerData(BannerModelData model) {
    return BannerData(
        category: model.category,
        date: model.date,
        id: model.id,
        image: model.image,
        shortDescription: model.shortDescription,
        title: model.title);
  }

  /// pagination uchunn

  static PaginationEntity mapPagination(Pagination? model) {
    return  PaginationEntity(
        currentPage: model?.currentPage,
        nextPage: model?.nextPage,
        prevPage: model?.prevPage,
        totalPages: model?.totalPages,
        totalRecords: model?.totalRecords);
  }
}

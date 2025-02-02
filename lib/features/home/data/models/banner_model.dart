import 'package:json_annotation/json_annotation.dart';

part 'banner_model.g.dart';

@JsonSerializable()
class BannerModel {
    @JsonKey(name: "data")
    final List<BannerModelData>? data;
    @JsonKey(name: "pagination")
    final Pagination? pagination;

    BannerModel({
        this.data,
        this.pagination,
    });

    factory BannerModel.fromJson(Map<String, dynamic> json) => _$BannerModelFromJson(json);

    Map<String, dynamic> toJson() => _$BannerModelToJson(this);
}

@JsonSerializable()
class BannerModelData {
    @JsonKey(name: "_id")
    final String? id;
    @JsonKey(name: "title")
    final String? title;
    @JsonKey(name: "category")
    final String? category;
    @JsonKey(name: "short_description")
    final String? shortDescription;
    @JsonKey(name: "image")
    final String? image;
    @JsonKey(name: "date")
    final String? date;

    BannerModelData({
        this.id,
        this.title,
        this.category,
        this.shortDescription,
        this.image,
        this.date,
    });

    factory BannerModelData.fromJson(Map<String, dynamic> json) => _$BannerModelDataFromJson(json);

    Map<String, dynamic> toJson() => _$BannerModelDataToJson(this);
}

@JsonSerializable()
class Pagination {
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

    Pagination({
        this.totalRecords,
        this.currentPage,
        this.totalPages,
        this.nextPage,
        this.prevPage,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);

    Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

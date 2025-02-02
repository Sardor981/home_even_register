class BannerEntity  {
    final List<BannerData>? data;
    final PaginationEntity? pagination;

    BannerEntity ({
        this.data,
        this.pagination,
    });

}

class BannerData {
    final String? id;
    final String? title;
    final String? category;
    final String? shortDescription;
    final String? image;
    final String? date;

    BannerData({
        this.id,
        this.title,
        this.category,
        this.shortDescription,
        this.image,
        this.date,
    });

}

class PaginationEntity {
    final int? totalRecords;
    final int? currentPage;
    final int? totalPages;
    final dynamic nextPage;
    final dynamic prevPage;

    PaginationEntity({
        this.totalRecords,
        this.currentPage,
        this.totalPages,
        this.nextPage,
        this.prevPage,
    });

}

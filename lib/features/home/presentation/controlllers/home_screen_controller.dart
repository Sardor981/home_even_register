import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:home_heven_app/core/common/app/services/injection_container.dart';
import 'package:home_heven_app/features/home/domain/enteties/banner_entity.dart';
import 'package:home_heven_app/features/home/domain/enteties/product_entity.dart';
import 'package:home_heven_app/features/home/domain/usecases/get_banners_usecase.dart';
import 'package:home_heven_app/features/home/domain/usecases/get_products_usecase.dart';

class HomeProvider extends ChangeNotifier {
  final bannerUseCase = getIt<GetBannersUsecase>();
  final productUseCase = getIt<GetProductsUsecase>();

  bool isLoading = false;
  BannerEntity? banners = BannerEntity();
  ProductEntity? products = ProductEntity();
  String? message;

  Future<void> getBanners() async {
    log('Get banners called');
    isLoading = true;
    notifyListeners();
    final result = await bannerUseCase.call();
    result.fold(
      (l) => message=l,
      (r) => banners=r,
    );
    log("${banners!.data.toString()} ");
    isLoading = false;
    notifyListeners();
  }

// products uchun
  Future<void> getProducts() async {
    log("get products call");
    isLoading = true;
    notifyListeners();
    final result = await productUseCase.callForProducts();
    result.fold(
      (l) => message=l,
      (r) => products=r,
    );
    log("${products!.data.toString()}");
    isLoading = false;
    notifyListeners();
  }
}

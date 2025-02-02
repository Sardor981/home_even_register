import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:home_heven_app/core/common/app/services/injection_container.dart';
import 'package:home_heven_app/core/exceptions/custom_exeptions.dart';
import 'package:home_heven_app/core/prefs_keys.dart';
import 'package:home_heven_app/core/utils/constants/network_constants.dart';
import 'package:home_heven_app/features/home/data/models/banner_model.dart';
import 'package:home_heven_app/features/home/data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HomeRemoteDataSource {
  Future<BannerModel?> getBanners();
  Future<ProductModel?> getProducts();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final dio = getIt<Dio>();

  @override
  Future<BannerModel?> getBanners() async {
    final String? token =
       
        getIt<SharedPreferences>().getString(PrefsKeys.tokenKey);
    try {
      final response = await dio.get(NetworkConstants.bannerUrl,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        final payload = response.data;
        log("$payload");
        return BannerModel.fromJson(payload);
      }
    } catch (e) {
      throw ServerExeption(
          errorMessage: "Error happened while fetching Banners ",
          statusCode: 500);
    }
  }

  @override
  Future<ProductModel?> getProducts() async {
    final String? token =
        getIt<SharedPreferences>().getString(PrefsKeys.tokenKey);
    try {
      final response = await dio.get(NetworkConstants.productUrl,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        final productsload = response.data;

        log(productsload.toString());
        return ProductModel.fromJson(productsload);
      }
    } catch (e) {
      throw ServerExeption(
          errorMessage: "Error happened while fetching Products",
          statusCode: 500);
    }
  }
}

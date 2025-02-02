import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:home_heven_app/core/exceptions/custom_exeptions.dart';
import 'package:home_heven_app/features/home/data/datasource/home_remote_data_source.dart';
import 'package:home_heven_app/features/home/data/mappers/banner_mapper.dart';
import 'package:home_heven_app/features/home/data/mappers/product_mapper.dart';
import 'package:home_heven_app/features/home/domain/enteties/banner_entity.dart';
import 'package:home_heven_app/features/home/domain/enteties/product_entity.dart';
import 'package:home_heven_app/features/home/domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepoImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<dynamic, BannerEntity>> getBanners() async {
    try {
      final result = await homeRemoteDataSource.getBanners();
      log("${result?.toJson()} data repo");
      return Right(BannerMapper.mapBannerEntity(result));
    } on ServerExeption catch (e) {
      return Left(e.errorMessage);
    }
  }

// product uchun

  @override
  Future<Either<dynamic, ProductEntity>> getProducts() async {
    try {
      final result = await homeRemoteDataSource.getProducts();
      return Right(ProductMapper.mapProductEntity(result));
    } on ServerExeption catch (e) {
      return Left(e.errorMessage);
    }
  }
}

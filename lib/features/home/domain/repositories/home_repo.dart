import 'package:dartz/dartz.dart';
import 'package:home_heven_app/features/home/domain/enteties/banner_entity.dart';
import 'package:home_heven_app/features/home/domain/enteties/product_entity.dart';

abstract class HomeRepo {
  Future<Either<dynamic, BannerEntity>> getBanners();
  Future<Either<dynamic, ProductEntity>> getProducts();
  
}

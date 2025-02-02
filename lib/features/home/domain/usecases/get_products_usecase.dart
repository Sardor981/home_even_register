import 'package:dartz/dartz.dart';
import 'package:home_heven_app/features/home/domain/enteties/product_entity.dart';
import 'package:home_heven_app/features/home/domain/repositories/home_repo.dart';

class GetProductsUsecase {
  final HomeRepo homeRepo;
  GetProductsUsecase({required this.homeRepo});
  Future<Either<dynamic, ProductEntity>> callForProducts() async {
    return await homeRepo.getProducts();
  }
}


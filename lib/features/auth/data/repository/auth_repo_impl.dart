import 'package:dartz/dartz.dart';
import 'package:home_heven_app/core/exceptions/custom_exeptions.dart';
import 'package:home_heven_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:home_heven_app/features/auth/domain/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl({required this.authRemoteDataSource});
  @override
  Future<Either<dynamic, bool>> login({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final bool = await authRemoteDataSource.login(
        phoneNumber: phoneNumber,
        password: password,
      );
      return Right(bool!);
    } on ServerExeption catch (e) {
      return left(e.errorMessage);
    }
  }

// registeer
  @override
  Future<Either<dynamic, bool>> register({
    required String phoneNumber,
    required String password,
    required String email,
  }) async {
    try {
      final bool = await authRemoteDataSource.register(
          phoneNumber: phoneNumber, password: password, email: email);
      return Right(bool!);
    } on ServerExeption catch (e) {
      return left(e.errorMessage);
    }
  }
}

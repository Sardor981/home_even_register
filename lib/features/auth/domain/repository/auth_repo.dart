import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<dynamic,bool>> login({
    required String phoneNumber,
    required String password,
  });

  // register
  Future<Either<dynamic,bool>> register({
    required String phoneNumber,
    required String password,
    required String email,
  });
}

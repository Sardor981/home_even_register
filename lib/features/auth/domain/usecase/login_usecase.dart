import 'package:dartz/dartz.dart';
import 'package:home_heven_app/features/auth/domain/repository/auth_repo.dart';

class LoginUsecase {
  final AuthRepo authRepo;

  LoginUsecase({required this.authRepo});
  Future<Either<dynamic, bool>> call({
    required String phoneNumber,
    required String password,
  }) {
    return authRepo.login(phoneNumber: phoneNumber, password: password);
  }
}


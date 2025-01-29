
import 'package:home_heven_app/features/auth/domain/repository/auth_repo.dart';

class RegisterUsecase {
  final AuthRepo authRepo;

  RegisterUsecase({required this.authRepo});
  Future<bool> callforRegister({
    
     required String phoneNumber,
    required String password,
    required String email,
  }) {
    return authRepo.register(phoneNumber: phoneNumber, password: password,email: email);
  }
}

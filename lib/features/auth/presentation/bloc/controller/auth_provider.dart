import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:home_heven_app/features/auth/domain/usecase/login_usecase.dart';
import 'package:home_heven_app/features/auth/domain/usecase/register_usecase.dart';

class AuthProvider extends ChangeNotifier {
  final LoginUsecase loginUsecase;
  final RegisterUsecase registerUsecase;

  AuthProvider({required this.loginUsecase, required this.registerUsecase});
  bool isloading = false;
  String message = "";
  Future<void> loginWithPhone({
    required String phoneNumber,
    required String password,
  }) async {
    isloading = true;
    notifyListeners();

    final result =
        await loginUsecase.call(phoneNumber: phoneNumber, password: password);
    isloading = false;
    notifyListeners();
    return result.fold((l) => message=l, (r) => message = "Successfully login",);
  }

// register
  Future<bool> registerWithPhone({
    required String phoneNumber,
    required String password,
    required String email,
  }) async {
    isloading = true;
    notifyListeners();
    final result = await registerUsecase.callforRegister(
        phoneNumber: phoneNumber, password: password, email: email);
    isloading = false;
    notifyListeners();
    return result;
  }
}

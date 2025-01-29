import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:home_heven_app/core/exceptions/custom_exeptions.dart';
import 'package:home_heven_app/core/prefs_keys.dart';
import 'package:home_heven_app/core/utils/constants/network_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

sealed class AuthRemoteDataSource {
  Future<bool?> login({
    required String phoneNumber,
    required String password,
  });
  Future<bool> register({
    required String phoneNumber,
    required String password,
    required String email,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<bool?> login(
      {required String phoneNumber, required String password}) async {
    final url = '${NetworkConstants.authUrl}/signin';

    final data = {
      "phone_number": phoneNumber,
      "email": "",
      "auth_method": "phone-number",
      "password": password,
    };

    log("Request URL: $url");
    log("Request Data: ${jsonEncode(data)}");

    try {
      final response = await dio.post(url, data: jsonEncode(data));

      log("Response Status Code: ${response.statusCode}");
      log("Response Data: ${response.data}");

      if (response.statusCode == 201) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(
            PrefsKeys.tokenKey, response.data["data"]["access_token"]);
        return true;
      }
      return false;
    } on DioException catch (e) {
      log("Error happened while logging in: $e");
      if (e.response?.statusCode == 400) {
        log("user not found");
        throw ServerExeption(errorMessage: 'user not found', statusCode: 400);
      }
    } catch (e) {
      log("error happpened while logging in:$e");
      throw ServerExeption(errorMessage: "Please try again.", statusCode: 400);
    }
  }

  @override
  Future<bool> register({
    required String phoneNumber,
    required String password,
    required String email,
  }) async {
    final url = '${NetworkConstants.authUrl}/signup';

    final data = {
      "phone_number": phoneNumber,
      "email": email,
      "auth_method": "phone-number",
      "password": password
    };
    log("Request URL: $url");
    log("Request Data: ${jsonEncode(data)}");

    try {
      final response = await dio.post(url, data: jsonEncode(data));
      log("response code: ${response.statusCode}");
      log("Response Data: ${response.data}");

      if (response.statusCode == 201) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(
            PrefsKeys.tokenKey, response.data["data"]["access_token"]);
        return true;
      }
      return false;
    } catch (e) {
      log("Error happened whille register :$e");
      throw Exception(e);
    }
  }
}

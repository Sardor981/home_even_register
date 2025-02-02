import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:home_heven_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:home_heven_app/features/auth/data/repository/auth_repo_impl.dart';
import 'package:home_heven_app/features/auth/domain/repository/auth_repo.dart';
import 'package:home_heven_app/features/auth/domain/usecase/login_usecase.dart';
import 'package:home_heven_app/features/auth/domain/usecase/register_usecase.dart';
import 'package:home_heven_app/features/auth/presentation/bloc/controller/auth_provider.dart';
import 'package:home_heven_app/features/home/data/datasource/home_remote_data_source.dart';
import 'package:home_heven_app/features/home/data/repositories/home_repo_impl.dart';
import 'package:home_heven_app/features/home/domain/repositories/home_repo.dart';
import 'package:home_heven_app/features/home/domain/usecases/get_banners_usecase.dart';
import 'package:home_heven_app/features/home/domain/usecases/get_products_usecase.dart';
import 'package:home_heven_app/features/home/presentation/controlllers/home_screen_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initInjection() async {
  getIt
    ..registerLazySingleton(
      () => Dio(),
    );
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(
    () => prefs,
  );
  await authInit();
  await homeInit();
}

Future<void> authInit() async {
  getIt
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(dio: getIt()),
    )
    ..registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(authRemoteDataSource: getIt()),
    )
    ..registerLazySingleton<LoginUsecase>(
      () => LoginUsecase(authRepo: getIt()),
    )
    ..registerLazySingleton<RegisterUsecase>(
      () => RegisterUsecase(authRepo: getIt()),
    )
    ..registerLazySingleton<AuthProvider>(
      () => AuthProvider(loginUsecase: getIt(), registerUsecase: getIt()),
    );
}

Future<void> homeInit() async {
  getIt
    ..registerLazySingleton(() => GetBannersUsecase(homeRepo: getIt()))
    ..registerLazySingleton(() => GetProductsUsecase(
          homeRepo: getIt(),
        ))
    ..registerLazySingleton<HomeRepo>(
        () => HomeRepoImpl(homeRemoteDataSource: getIt()))
    ..registerLazySingleton<HomeRemoteDataSource>(
        () => HomeRemoteDataSourceImpl())
    ..registerLazySingleton<HomeProvider>(
      () => HomeProvider(),
    );
}

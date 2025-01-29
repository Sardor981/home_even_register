import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:home_heven_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:home_heven_app/features/auth/data/repository/auth_repo_impl.dart';
import 'package:home_heven_app/features/auth/domain/repository/auth_repo.dart';
import 'package:home_heven_app/features/auth/domain/usecase/login_usecase.dart';
import 'package:home_heven_app/features/auth/domain/usecase/register_usecase.dart';
import 'package:home_heven_app/features/auth/presentation/bloc/controller/auth_provider.dart';

final getIt = GetIt.instance;

Future<void> initInjection() async {
  await authInit();
}

Future<void> authInit() async {
  getIt
    ..registerLazySingleton<Dio>(() => Dio())
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

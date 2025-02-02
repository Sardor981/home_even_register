import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_heven_app/core/common/app/services/injection_container.dart';
import 'package:home_heven_app/core/prefs_keys.dart';
import 'package:home_heven_app/features/auth/presentation/bloc/controller/auth_provider.dart';
import 'package:home_heven_app/features/auth/presentation/screens/login_screen.dart';
import 'package:home_heven_app/features/home/presentation/controlllers/home_screen_controller.dart';
import 'package:home_heven_app/features/home/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => getIt<AuthProvider>(),
          ),
          ChangeNotifierProvider(
            create: (context) => getIt<HomeProvider>(),
          )
        ],
        child: ScreenUtilInit(
          designSize: MediaQuery.of(context).size.width >= 600
              ? Size(1920, 1080)
              : Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home:
            
                getIt<SharedPreferences>().getString(PrefsKeys.tokenKey) != null
                    ? HomeScreen()
                    : LoginScreen(),
          ),
        ));
  }
}

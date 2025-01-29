import 'package:flutter/material.dart';
import 'package:home_heven_app/core/common/app/services/injection_container.dart';
import 'package:home_heven_app/features/auth/presentation/bloc/controller/auth_provider.dart';
import 'package:home_heven_app/features/auth/presentation/screens/login_screen.dart';
import 'package:home_heven_app/features/auth/presentation/screens/register_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  await initInjection();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt<AuthProvider>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
      ),
    );
  }
}

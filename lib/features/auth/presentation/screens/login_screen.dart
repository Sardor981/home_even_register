import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_heven_app/core/prefs_keys.dart';
import 'package:home_heven_app/features/auth/presentation/bloc/controller/auth_provider.dart';
import 'package:home_heven_app/features/auth/presentation/screens/home_screen.dart';
import 'package:home_heven_app/features/auth/presentation/screens/register_screen.dart';
import 'package:home_heven_app/features/auth/presentation/widgets/textcontroller_widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          if (authProvider.isloading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textControllerWidget(
                  controller: phoneController,
                  hintText: "phone",
                  icon: Icon(Icons.phone),
                ),
                SizedBox(
                  height: 20,
                ),
                textControllerWidget(
                  controller: passwordController,
                  hintText: "password",
                  icon: Icon(Icons.key),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await authProvider.loginWithPhone(
                      phoneNumber: phoneController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(authProvider.message),
                        backgroundColor: Colors.red,
                      ),
                    );
                    if (authProvider.message.contains("Successfully")) {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                    }
                  },
                  child: Text("login"),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => RegisterScreen(),
                      ),
                    );
                  },
                  child: Text(
                    " Forget your password?",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

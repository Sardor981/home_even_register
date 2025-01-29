import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_heven_app/features/auth/presentation/bloc/controller/auth_provider.dart';
import 'package:home_heven_app/features/auth/presentation/screens/home_screen.dart';
import 'package:home_heven_app/features/auth/presentation/screens/login_screen.dart';
import 'package:home_heven_app/features/auth/presentation/widgets/textcontroller_widget.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
    passwordController.dispose();
    emailController.dispose();
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
                    icon: Icon(Icons.phone)),
                SizedBox(
                  height: 20,
                ),
                textControllerWidget(
                    controller: passwordController,
                    hintText: "password",
                    icon: Icon(Icons.key)),
                SizedBox(
                  height: 20,
                ),
                textControllerWidget(
                  controller: emailController,
                  hintText: "email",
                  icon: Icon(Icons.email),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final result = await authProvider.registerWithPhone(
                          phoneNumber: phoneController.text.trim(),
                          password: passwordController.text.trim(),
                          email: emailController.text.trim());
                      if (result) {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => HomeScreen(),
                            ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Nimadir xato ketti'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: Text("Register")),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text("I have already an acccaunt"))
              ],
            ),
          );
        },
      ),
    );
  }
}

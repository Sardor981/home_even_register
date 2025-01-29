import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_heven_app/features/auth/presentation/bloc/controller/auth_provider.dart';
import 'package:home_heven_app/features/auth/presentation/screens/home_screen.dart';
import 'package:home_heven_app/features/auth/presentation/screens/register_screen.dart';
import 'package:home_heven_app/features/auth/presentation/widgets/container_widget.dart';
import 'package:home_heven_app/features/auth/presentation/widgets/password_controller.dart';
import 'package:home_heven_app/features/auth/presentation/widgets/social_widgets.dart';
import 'package:home_heven_app/features/auth/presentation/widgets/text_widget.dart';
import 'package:home_heven_app/features/auth/presentation/widgets/textcontroller_widget.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_images.dart';

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
    return SafeArea(
      child: Scaffold(
        body: Consumer<AuthProvider>(
          builder: (context, authProvider, child) {
            if (authProvider.isloading) {
              return Center(
                child: CupertinoActivityIndicator(),
              );
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "Welcome Back!",
                      size: 30.sp,
                    ),
                    TextWidget(
                      text:
                          "Enter your email to start shopping and get awesome deals today!",
                      size: 15.sp,
                      letterspace: 1,
                      textAlign: TextAlign.start,
                      color: const Color.fromARGB(255, 97, 95, 95),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    textControllerWidget(
                      controller: phoneController,
                      hintText: "phone",
                      icon: Icon(Icons.phone),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    PasswordTextField(
                      controller: passwordController,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextWidget(
                      text: "Forgot your password?",
                      color: Color(0xff156651),
                      letterspace: 1,
                      size: 16.sp,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    GestureDetector(
                        onTap: () async {
                          await authProvider.loginWithPhone(
                            phoneNumber: phoneController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                          floatingSnackBar(
                              message: authProvider.message,
                              context: context,
                              textStyle: TextStyle(
                                  letterSpacing: 1, color: Colors.lightBlue),
                              duration: Duration(seconds: 5),
                              backgroundColor:
                                  const Color.fromARGB(255, 150, 214, 227));

                          if (authProvider.message.contains("Successfully")) {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => HomeScreen()));
                          }
                        },
                        child: ContainerWidget(text: "Log In")),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Divider()),
                          TextWidget(
                            text: "OR",
                            color: const Color.fromARGB(255, 51, 51, 51),
                            size: 15.sp,
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SocialLoginButton(
                        imagePath: AppImages.googleImg3,
                        text: "Log In with Google"),
                    SizedBox(
                      height: 10.h,
                    ),
                    SocialLoginButton(
                        imagePath: AppImages.facebookImg3,
                        text: "Log In with Facebook"),
                    SizedBox(
                      height: 30.h,
                    ),
                    Center(
                        child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()),
                      ),
                      child: Text.rich(
                        TextSpan(
                          text: 'Dont have an account? ',
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 1,
                          ),
                          children: <InlineSpan>[
                            TextSpan(
                              text: 'Register',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff156651),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

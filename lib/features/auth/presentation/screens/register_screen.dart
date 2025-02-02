import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_heven_app/core/utils/app_images.dart';
import 'package:home_heven_app/features/auth/presentation/bloc/controller/auth_provider.dart';
import 'package:home_heven_app/features/auth/presentation/screens/home_screen.dart';
import 'package:home_heven_app/features/auth/presentation/widgets/container_widget.dart';
import 'package:home_heven_app/features/auth/presentation/widgets/password_controller.dart';
import 'package:home_heven_app/features/auth/presentation/widgets/social_widgets.dart';
import 'package:home_heven_app/features/auth/presentation/widgets/text_widget.dart';
import 'package:home_heven_app/features/auth/presentation/widgets/textcontroller_widget.dart';
import 'package:home_heven_app/features/home/presentation/screens/home_screen.dart';
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
              child: CupertinoActivityIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "Create Account",
                      size: 30.sp,
                    ),
                    TextWidget(
                      text:
                          "Fill in your details below to get started on a seamless shopping experience.",
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
                      hintText: "Phone",
                      icon: Icon(Icons.phone),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    textControllerWidget(
                      controller: emailController,
                      hintText: "Email",
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
                      text:
                          "By clicking Create Account, you acknowledge you have read and agreed to our Terms of Use and Privacy Policy",
                      color: Color(0xff757575),
                      letterspace: 1,
                      size: 14.sp,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                        onTap: () async {
                          await authProvider.registerWithPhone(
                              phoneNumber: phoneController.text.trim(),
                              password: passwordController.text.trim(),
                              email: emailController.text.trim());
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
                        child: ContainerWidget(text: "Create Account")),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(child: Divider()),
                        TextWidget(
                          text: "OR",
                          size: 15.sp,
                        ),
                        Expanded(child: Divider())
                      ],
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
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

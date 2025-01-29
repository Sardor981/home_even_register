import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_heven_app/features/auth/presentation/widgets/text_widget.dart';

class ContainerWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color contColor;
  const ContainerWidget({
    super.key,
     this.contColor=const Color(0xff156651),
    required this.text,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r), color: contColor),
      child: Center(
        child: TextWidget(
          text: text,
          size: 14.sp,
          color: textColor,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_heven_app/features/home/domain/enteties/banner_entity.dart';

Widget caroselWidget({
  required BannerData bannerData,
}) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage("https://e-commerce.birnima.uz${bannerData.image}"),
      ),
      color: Colors.cyan,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment(0.00, 0.00),
          end: Alignment(0.4, 0.1),
          colors: [Color(0xEF156650), Color(0xAA156650), Color(0x00156650)],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 170.w,
                    child: Text(
                      bannerData.title.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w700,
                        height: 1.20,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    width: 170.w,
                    child: Text(
                      bannerData.shortDescription.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w400,
                        height: 1.40.h,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  FittedBox(
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Shop Now',
                          style: TextStyle(
                            color: Color(0xFF156650),
                            fontSize: 12.sp,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w700,
                            height: 1.20.h,
                          ),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

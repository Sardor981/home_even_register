import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_heven_app/core/common/app/services/injection_container.dart';
import 'package:home_heven_app/features/auth/presentation/widgets/text_widget.dart';
import 'package:home_heven_app/features/home/domain/enteties/product_entity.dart'
    as product_entity;
import 'package:home_heven_app/features/home/presentation/controlllers/home_screen_controller.dart';
import 'package:home_heven_app/features/home/presentation/widgets/bottom_widget.dart';
import 'package:home_heven_app/features/home/presentation/widgets/carousel_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final homeProvider = getIt<HomeProvider>();
    homeProvider.getBanners();
    homeProvider.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none))
          ],
          leadingWidth: MediaQuery.of(context).size.width * 0.85,
          leading: AnimSearchBar(
            width: MediaQuery.of(context).size.width * 0.85,
            textController: searchController,
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Icons.camera_alt_outlined),
            onSuffixTap: () {},
            onSubmitted: (String) {},
          ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.location_on_outlined)),
                TextWidget(
                  text: "Deliver to 3517 W. Gray St. ",
                  size: 14.sp,
                  letterspace: 0.8,
                  textAlign: TextAlign.start,
                ),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_drop_down_sharp))
              ],
            ),
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                if (homeProvider.isLoading) {
                  return const Center(child: CupertinoActivityIndicator());
                }
                if (homeProvider.banners?.data?.isEmpty ?? true) {
                  return const Center(child: Text("Banners yoq"));
                }
                return CarouselSlider(
                  items: homeProvider.banners!.data!
                      .map(
                          (bannerData) => caroselWidget(bannerData: bannerData))
                      .toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 16 / 8,
                    enlargeCenterPage: true,
                    autoPlayAnimationDuration: const Duration(seconds: 4),
                    enableInfiniteScroll: true,
                    height: 200.h,
                  ),
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: "Special Offers ",
                    size: 24.sp,
                  ),
                  TextWidget(
                    text: "See More",
                    size: 14.sp,
                    color: Color(0xff156651),
                  )
                ],
              ),
            ),
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                if (homeProvider.isLoading) {
                  return const Center(child: CupertinoActivityIndicator());
                }
                if (homeProvider.products?.data?.isEmpty ?? true) {
                  return const Center(child: Text("Mahsulotlar yo‘q"));
                }
                return Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: homeProvider.products?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final product = homeProvider.products?.data?[index];
                      if (product == null) {
                        return const SizedBox();
                      }

                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 3,
                          child: Container(
                            width: 240.w,
                            padding: EdgeInsets.all(8.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: product.image != null
                                      ? Image.network(
                                          "https://e-commerce.birnima.uz${product.image?[index]}",
                                          height: 100.h,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Icon(
                                                Icons.image_not_supported);
                                          },
                                        )
                                      : const Icon(Icons.image_not_supported),
                                ),
                                SizedBox(height: 5.h),
                                TextWidget(
                                  text: product.name ?? "no name",
                                  textAlign: TextAlign.start,
                                  size: 14.sp,
                                ),
                                SizedBox(height: 4.h),
                                TextWidget(
                                  text:
                                      "\$${product.price?.toString() ?? '0.00'}",
                                  size: 18.sp,
                                  textAlign: TextAlign.start,
                                ),
                                Row(children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  TextWidget(text: product.rating.toString()),
                                  TextWidget(
                                      text:
                                          "(${product.ratingCount.toString()})")
                                ]),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
        bottomNavigationBar: bottom_bar_widget(),
      ),
    );
  }
}

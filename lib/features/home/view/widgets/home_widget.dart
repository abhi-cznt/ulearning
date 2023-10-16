import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/features/home/controller/home_controller.dart';
import '../../../../common/widgets/text_widgets.dart';
import '../../../../global.dart';

AppBar homeAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.symmetric(horizontal: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appImage(height: 12.h, width: 18.w, imagePath: ImageRes.menu),
          GestureDetector(
            child: const AppBoxDecorationImage(),
          ),
        ],
      ),
    ),
  );
}

class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: text24Normal(
        color: AppColors.primaryThreeElementText,
        fontWeight: FontWeight.bold,
        text: "Hello,",
      ),
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: text24Normal(
        fontWeight: FontWeight.bold,
        text: Global.storageService.getUserProfile().name ?? 'Flutter Devs',
      ),
    );
  }
}

class HomeBanner extends StatelessWidget {
  final PageController controller;
  final WidgetRef ref;
  const HomeBanner({super.key, required this.controller, required this.ref});

  @override
  Widget build(BuildContext context) {
    // print("Home banner build");
    return Column(
      children: [
        // banner
        SizedBox(
          width: 325.w,
          height: 160.h,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              ref.read(homeScreenDotsBannerProvider.notifier).setIndex(index);
            },
            children: [
              _bannerContainer(imagePath: ImageRes.banner1),
              _bannerContainer(imagePath: ImageRes.banner2),
              _bannerContainer(imagePath: ImageRes.banner3),
            ],
          ),
        ),
        SizedBox(height: 5.h),
        //  dots
        DotsIndicator(
          dotsCount: 3,
          position: ref.watch(homeScreenDotsBannerProvider),
          mainAxisAlignment: MainAxisAlignment.center,
          decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(24.0, 8.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.w))),
        ),
      ],
    );
  }
}

Widget _bannerContainer({required String imagePath}) {
  return Container(
    width: 325.w,
    height: 160.h,
    margin: EdgeInsets.symmetric(horizontal: 5.w),
    decoration: BoxDecoration(
        image: DecorationImage(
      image: AssetImage(imagePath),
      fit: BoxFit.fill,
    )),
  );
}

class HomeMenuBar extends StatelessWidget {
  const HomeMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // see all course
        Container(
          margin: EdgeInsets.only(top: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text16Normal(
                text: "Choice your course",
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
              ),
              GestureDetector(
                child: const Text10Normal(
                  text: "See all",
                ),
              )
            ],
          ),
        ),
        // course item button
        Container(
          margin: EdgeInsets.only(top: 20.h),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                decoration: appBoxShadow(radius: 7.w),
                child: const Text11Normal(
                  text: "All",
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30.w),
                child: const Text11Normal(
                  text: "Popular",
                  color: AppColors.primaryThreeElementText,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30.w),
                child: const Text11Normal(
                  text: "Newest",
                  color: AppColors.primaryThreeElementText,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CourseItemGrid extends StatelessWidget {
  const CourseItemGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        physics: const ScrollPhysics(),
        itemCount: 6,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (_, index) {
          return appImage();
        },
      ),
    );
  }
}

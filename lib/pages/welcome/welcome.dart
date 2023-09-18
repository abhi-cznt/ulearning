import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/welcome/widgets.dart';

import 'notifier/welcome_notifier.dart';

// final indexProvider = StateProvider<int>((ref) => 0);

class Welcome extends ConsumerWidget {
  Welcome({super.key});
  final PageController _controller = PageController();
  // int dotIndex = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexDotProvider);
    return Container(
      padding: EdgeInsets.only(top: 30.h),
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                  onPageChanged: (value) {
                    // dotIndex = value;
                    ref.read(indexDotProvider.notifier).changeIndex(value);
                  },
                  controller: _controller,
                  children: [
                    //page one
                    appOnBoardingPage(
                      context,
                      _controller,
                      imagePath: 'assets/images/reading.png',
                      title: 'First See Learning',
                      subTitle:
                          'Forget about the paper, now all learning in one place',
                      index: 1,

                    ),
                    // page second
                    appOnBoardingPage(
                      context,
                      _controller,
                      imagePath: 'assets/images/man.png',
                      title: 'Connect With Everyone',
                      subTitle:
                          "Always keep in touch with your tutor and friends. Let's get connected",
                      index: 2,
                    ),

                    // page third
                    appOnBoardingPage(
                      context,
                      _controller,
                      imagePath: 'assets/images/boy.png',
                      title: 'Always Fascinated Learning',
                      subTitle:
                          'Anywhere, anytime. The time is at your discretion. So study wherever you can',
                      index: 3,
                    ),
                  ]),
              Positioned(
                bottom: 50.h,
                child: DotsIndicator(
                  position: index,
                  dotsCount: 3,
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(24.0, 8.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.w)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

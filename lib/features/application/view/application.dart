import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/features/application/view/widgets/widgets.dart';

import '../provider/notifier/application_nav_notifier.dart';

class Application extends ConsumerWidget {
  const Application({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(applicationNavIndexProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            child: appScreens(index: index),
          ),
          bottomNavigationBar: Container(
            width: 375.w,
            height: 58.h,
            decoration: appBoxShadowWithRadius(
              color: AppColors.primaryElement,
              topLeft: 20.h,
              topRight: 20.h,
            ),
            child: BottomNavigationBar(
              onTap: (value){
                ref.read(applicationNavIndexProvider.notifier).changeIndex(value);
              },
              currentIndex:index,
              elevation: 0.0,
              items: bottomTabs,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
            ),
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/routes/app_routes_names.dart';
import 'package:ulearning_app/features/home/view/home.dart';
import 'package:ulearning_app/global.dart';

import '../../features/application/view/application.dart';
import '../../features/sign_in/view/sign_in.dart';
import '../../features/sign_up/view/sign_up.dart';
import '../../features/welcome/view/welcome.dart';

class AppPages {
  static List<RouteEntity> routes() {
    return [
      RouteEntity(path: AppRoutesNames.WELCOME, page: Welcome()),
      RouteEntity(path: AppRoutesNames.SIGN_IN, page: const SignIn()),
      RouteEntity(path: AppRoutesNames.REGISTER, page: const SignUp()),
      RouteEntity(path: AppRoutesNames.APPLICATION, page: const Application()),
      RouteEntity(path: AppRoutesNames.APPLICATION, page: const Home()),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (kDebugMode) {
      print("the route clicked is ${settings.name}");
    }

    // if we are using it first time or not
    bool deviceFirstTime = Global.storageService.getDeviceFirstOpen();

    // user logged in or not
    bool isLoggedIn = Global.storageService.isLoggedIn();
    if (settings.name != null) {
      var result = routes().where((element) => element.path == settings.name);
      if (result.isNotEmpty) {
        if (result.first.path == AppRoutesNames.WELCOME && deviceFirstTime) {
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const Application(), settings: settings);
          }

          return MaterialPageRoute(
            builder: (_) => const SignIn(),
            settings: settings,
          );
        } else {
          if (kDebugMode) {
            // print("app run first time");
          }
          return MaterialPageRoute(builder: (_) => result.first.page);
        }
      }
    }
    return MaterialPageRoute(
      builder: (_) => Welcome(),
      settings: settings,
    );
  }
}

class RouteEntity {
  String path;
  Widget page;
  RouteEntity({required this.path, required this.page});
}

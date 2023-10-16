import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning_app/common/models/entites.dart';
import 'package:ulearning_app/common/utils/constant.dart';

class StorageService {
  late SharedPreferences _pref;
  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }

  String getString(String key)  {
    return _pref.getString(key) ?? "";
  }

  Future<bool> setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  bool getDeviceFirstOpen() {
    return _pref.getBool(AppConstant.STORAGE_DEVICE_OPEN_FIRST_KEY) ?? false;
  }

  bool isLoggedIn() {
    return _pref.getString(AppConstant.STORAGE_USER_PROFILE_KEY) != null
        ? true
        : false;
  }

  UserProfile getUserProfile(){
    var profile = _pref.getString(AppConstant.STORAGE_USER_PROFILE_KEY) ?? '';
    var profileJson = jsonDecode(profile);
    UserProfile userProfile = UserProfile.fromJson(profileJson);
    return userProfile;
  }
}

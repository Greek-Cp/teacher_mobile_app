import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:teacher_mobile_app/models/account/ModelAccount.dart';

class SharedPrefUtil {
  static const String keyProfileUser = 'keyProfileUser';

  static Future<void> saveProfileUser(ModelProfileUser profile) async {
    final prefs = await SharedPreferences.getInstance();
    final profileJson = json.encode(profile.toJson());
    await prefs.setString(keyProfileUser, profileJson);
  }

  static Future<ModelProfileUser?> getProfileUser() async {
    final prefs = await SharedPreferences.getInstance();
    final profileJson = prefs.getString(keyProfileUser);
    if (profileJson != null) {
      final profileMap = json.decode(profileJson) as Map<String, dynamic>;
      return ModelProfileUser.fromJson(profileMap);
    }
    return null;
  }
}

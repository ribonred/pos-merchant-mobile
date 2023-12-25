import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DatabaseService extends GetxService {
  static DatabaseService get to => Get.find();

  Box get settings => Hive.box('settings');
  Box get session => Hive.box('session');

  Future<DatabaseService> init() async {
    await Hive.initFlutter();
    await Hive.openBox('settings');
    await Hive.openBox('session');

    return this;
  }

  String? getAccessToken() => session.get('access');
  String? getRefreshToken() => session.get('refresh');

  String? get accountInVerification => session.get('verificationEmail');
  bool get isInVerificationProcess => accountInVerification != null;

  Future<void> setSession(String access, String refresh) async {
    await session.put('access', access);
    await session.put('refresh', refresh);
  }

  Future<void> setAccountInVerification(String email) async {
    await session.put('verificationEmail', email);
  }

  Future<void> clearSession() async {
    await session.clear();
  }
}

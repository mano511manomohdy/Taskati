import 'package:hive/hive.dart';

class Localdatahelper {
  static Box? userbox;

  static init() {
    userbox = Hive.box("userBox");
  }

  static void cacheUserData(String key, dynamic value) async {
    await userbox?.put(key, value);
  }

  static getUserData(String key) {
    return userbox?.get(key);
  }
}

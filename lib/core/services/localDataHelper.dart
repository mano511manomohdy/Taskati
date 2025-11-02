import 'package:hive/hive.dart';
import 'package:taskati/core/model/Task_Model.dart';

class Localdatahelper {
  static Box? userbox;
  static Box<TaskModel>? Taskbox;
  static String NameKey = "name";
  static String ImageKey = "image";
  static String isUploadedKey = "isUploaded";
  static String isDarkTheme = "isDarkTheme";

  static init() {
    userbox = Hive.box("userBox");
    Taskbox = Hive.box<TaskModel>("TaskBox");
  }

  static void cacheUserData(String key, dynamic value) async {
    await userbox?.put(key, value);
  }

  static getUserData(String key) {
    return userbox?.get(key);
  }

  static void cacheTask(String key, TaskModel value) async {
    await Taskbox?.put(key, value);
  }

  static getTask(String key) {
    return Taskbox?.get(key);
  }
}

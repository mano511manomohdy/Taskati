import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/model/Task_Model.dart';
import 'package:taskati/core/services/localDataHelper.dart';
import 'package:taskati/core/utils/AppTheme.dart';
import 'package:taskati/features/intro/page/intro.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox("userBox");
  await Hive.openBox<TaskModel>("TaskBox");
  Localdatahelper.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Localdatahelper.userbox!.listenable(),
      builder: (context, value, child) {
        bool isDarkTheme =
            Localdatahelper.getUserData(Localdatahelper.isDarkTheme) ?? false;
        return MaterialApp(
          themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          theme: Apptheme.lightTheme,
          darkTheme: Apptheme.darkTheme,
          home: SplashScreen(),
        );
      },
    );
  }
}

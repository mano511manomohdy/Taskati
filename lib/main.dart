import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/features/intro/page/intro.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  Hive.openBox("userBox");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.redColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.redColor),
          ),
        ),
      ),
      home: SplashScreen(),
    );
  }
}

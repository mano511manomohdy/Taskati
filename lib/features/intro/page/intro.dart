import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/extenstions/Navigator.dart';
import 'package:taskati/core/services/localDataHelper.dart';
import 'package:taskati/features/HomeScree.dart/page/HomeScreen.dart';
import 'package:taskati/features/upload/page/UploadScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  initState() {
    super.initState();
    bool isuploaded =
        Localdatahelper.getUserData(Localdatahelper.isUploadedKey) ?? false;
    Future.delayed(const Duration(seconds: 3), () {
      if (isuploaded) {
        context.PushReplacement(const Homescreen());
      } else {
        context.PushReplacement(const Uploadscreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/images/Task Done.json', fit: BoxFit.fill),
      ),
    );
  }
}

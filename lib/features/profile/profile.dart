import 'package:flutter/material.dart';
import 'package:taskati/core/services/localDataHelper.dart';
import 'package:taskati/core/utils/textStyle.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile", style: GetTitleTextStyle(context)),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                bool isDarkTheme =
                    Localdatahelper.getUserData(Localdatahelper.isDarkTheme) ??
                    false;
                Localdatahelper.cacheUserData(
                  Localdatahelper.isDarkTheme,
                  !isDarkTheme,
                );
              });
            },
            icon: Icon(Icons.dark_mode, size: 32),
          ),
        ],
      ),
    );
  }
}

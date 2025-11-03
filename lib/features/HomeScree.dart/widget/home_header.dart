import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/extenstions/Navigator.dart';
import 'package:taskati/core/services/localDataHelper.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/core/utils/textStyle.dart';
import 'package:taskati/features/profile/profile.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // Added ValueListenableBuilder to listen for user data changes (name, image) and rebuild the header reactively
    return ValueListenableBuilder(
      valueListenable: Localdatahelper.userbox!.listenable(),
      builder: (context, value, child) {
        return Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    "Hello ,${Localdatahelper.getUserData(Localdatahelper.NameKey)}",
                    style: GetTitleTextStyle(
                      context,
                      color: AppColors.primaryColor,
                      fontsize: 20,
                    ),
                  ),
                  Text("Have a Nice Day", style: GetBodyTextStyle(context)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                context.PushTo(Profile());
              },
              child: CircleAvatar(
                radius: 30,
                backgroundImage: FileImage(
                  File(Localdatahelper.getUserData(Localdatahelper.ImageKey)),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

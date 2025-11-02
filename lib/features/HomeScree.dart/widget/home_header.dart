import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taskati/core/services/localDataHelper.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/core/utils/textStyle.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
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
                  color: AppColors.primaryColor,
                  fontsize: 20,
                ),
              ),
              Text("Have a Nice Day", style: GetBodyTextStyle()),
            ],
          ),
        ),
        CircleAvatar(
          radius: 30,
          backgroundImage: FileImage(
            File(Localdatahelper.getUserData(Localdatahelper.ImageKey)),
          ),
        ),
      ],
    );
  }
}

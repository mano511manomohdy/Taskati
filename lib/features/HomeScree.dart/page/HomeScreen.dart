import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/core/services/localDataHelper.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/core/utils/textStyle.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          "Hello ,${Localdatahelper.getUserData("name")}",
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
                      File(Localdatahelper.getUserData("imagepath")),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

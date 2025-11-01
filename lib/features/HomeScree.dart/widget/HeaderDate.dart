import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/services/localDataHelper.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/core/utils/textStyle.dart';
import 'package:taskati/core/widgets/custom_button.dart';

class HeaderDate extends StatelessWidget {
  const HeaderDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                DateFormat.yMMMEd().format(DateTime.now()),
                style: GetTitleTextStyle(
                  fontWeight: FontWeight.w600,
                  fontsize: 20,
                ),
              ),
              Text(
                "Today",
                style: GetSmallTextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkColor,
                ),
              ),
            ],
          ),
        ),
        CustomButton(size: Size(145, 40), text: "+ AddTask", onpressed: () {}),
      ],
    );
  }
}

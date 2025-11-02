import 'package:flutter/material.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/core/utils/textStyle.dart';

ShowDialogToast({required BuildContext context, required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.redColor,
      duration: Duration(seconds: 2),
      content: Text(
        text,
        style: GetBodyTextStyle(context, color: AppColors.whiteColor),
      ),
    ),
  );
}

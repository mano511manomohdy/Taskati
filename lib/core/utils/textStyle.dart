import 'package:flutter/material.dart';
import 'package:taskati/core/utils/AppColors.dart';

TextStyle GetTitleTextStyle({
  double? fontsize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontFamily: "Poppins",
    fontWeight: fontWeight ?? FontWeight.bold,
    fontSize: fontsize ?? 18,
    color: color ?? AppColors.darkColor,
  );
}

TextStyle GetBodyTextStyle({
  double? fontsize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontFamily: "Poppins",
    fontWeight: fontWeight ?? FontWeight.w600,
    fontSize: fontsize ?? 16,
    color: color ?? AppColors.darkColor,
  );
}

TextStyle GetSmallTextStyle({
  double? fontsize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontFamily: "Poppins",
    fontWeight: fontWeight ?? FontWeight.normal,
    fontSize: fontsize ?? 14,
    color: color ?? AppColors.greyColor,
  );
}

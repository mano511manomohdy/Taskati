import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/textStyle.dart';

class DescriptionTextFormfield extends StatelessWidget {
  const DescriptionTextFormfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: GetBodyTextStyle(fontWeight: FontWeight.w500),
        ),
        Gap(5),
        TextFormField(
          maxLines: 3,
          decoration: InputDecoration(
            hintText: "Enter Description",
            hintStyle: GetSmallTextStyle(),
          ),
        ),
      ],
    );
  }
}

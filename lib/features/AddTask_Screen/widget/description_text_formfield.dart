import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/textStyle.dart';

class DescriptionTextFormfield extends StatelessWidget {
  const DescriptionTextFormfield({super.key, required this.discController});
  final TextEditingController discController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: GetBodyTextStyle(context, fontWeight: FontWeight.w500),
        ),
        Gap(5),
        TextFormField(
          controller: discController,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: "Enter Description",
            hintStyle: GetSmallTextStyle(context),
          ),
        ),
      ],
    );
  }
}

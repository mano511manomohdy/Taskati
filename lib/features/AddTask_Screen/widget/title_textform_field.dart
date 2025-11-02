import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/textStyle.dart';

class titleTextformField extends StatelessWidget {
  const titleTextformField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text("Title", style: GetBodyTextStyle(fontWeight: FontWeight.w500)),
        Gap(5),
        TextFormField(
          decoration: InputDecoration(
            hintText: "Enter title",
            hintStyle: GetSmallTextStyle(),
          ),
        ),
      ],
    );
  }
}

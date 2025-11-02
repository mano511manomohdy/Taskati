import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/textStyle.dart';

class titleTextformField extends StatelessWidget {
  const titleTextformField({super.key, required this.titleController});
  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          "Title",
          style: GetBodyTextStyle(context, fontWeight: FontWeight.w500),
        ),
        Gap(5),
        TextFormField(
          controller: titleController,
          decoration: InputDecoration(
            hintText: "Enter title",
            hintStyle: GetSmallTextStyle(context),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "*Required";
            }
            return null;
          },
        ),
      ],
    );
  }
}

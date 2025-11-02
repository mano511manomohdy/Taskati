import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/core/utils/textStyle.dart';

class DateTextFormField extends StatelessWidget {
  const DateTextFormField({super.key, required this.DateController});

  final TextEditingController DateController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Data", style: GetBodyTextStyle(fontWeight: FontWeight.w500)),
        Gap(5),
        TextFormField(
          controller: DateController,
          readOnly: true,
          onTap: () async {
            var PickedDate = await showDatePicker(
              initialDate: DateTime.now(),
              context: context,
              firstDate: DateTime.now(),
              lastDate: DateTime(2030),
            );
            if (PickedDate != null) {
              DateController.text = DateFormat("dd/MM/yyyy").format(PickedDate);
            }
          },
          decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.calendar_month,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

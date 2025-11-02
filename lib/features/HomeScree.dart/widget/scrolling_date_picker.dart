import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:taskati/core/utils/AppColors.dart';

class ScrollingDatePicker extends StatelessWidget {
  const ScrollingDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now(),
      initialSelectedDate: DateTime.now(),
      selectionColor: AppColors.primaryColor,
      selectedTextColor: Colors.white,
      width: 75,
      height: 100,
      // onDateChange: (date) {
      //   New date selected
      //   setState(() {
      //     _selectedValue = date;
      //   });
      // },
    );
  }
}

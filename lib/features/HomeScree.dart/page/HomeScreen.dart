import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/core/utils/textStyle.dart';
import 'package:taskati/features/HomeScree.dart/widget/HeaderDate.dart';
import 'package:taskati/features/HomeScree.dart/widget/home__tasks__list.dart';
import 'package:taskati/features/HomeScree.dart/widget/home_header.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String selectedValue = DateFormat("dd/MM/yyyy").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              HomeHeader(),
              Gap(10),
              HeaderDate(),
              Gap(16),
              DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                dateTextStyle: GetBodyTextStyle(context),
                monthTextStyle: GetBodyTextStyle(context),
                dayTextStyle: GetBodyTextStyle(context),
                selectionColor: AppColors.primaryColor,
                selectedTextColor: Colors.white,
                width: 75,
                height: 100,
                onDateChange: (date) {
                  setState(() {
                    selectedValue = DateFormat("dd/MM/yyyy").format(date);
                  });
                },
              ),
              Gap(10),
              Home_Tasks_List(selectedDate: selectedValue),
            ],
          ),
        ),
      ),
    );
  }
}

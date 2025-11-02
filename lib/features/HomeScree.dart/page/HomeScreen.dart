import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/features/HomeScree.dart/widget/HeaderDate.dart';
import 'package:taskati/features/HomeScree.dart/widget/home__tasks__list.dart';
import 'package:taskati/features/HomeScree.dart/widget/home_header.dart';
import 'package:taskati/features/HomeScree.dart/widget/scrolling_date_picker.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
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
              ScrollingDatePicker(),
              Gap(10),
              Home_Tasks_List(),
            ],
          ),
        ),
      ),
    );
  }
}

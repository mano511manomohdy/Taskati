import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/core/utils/textStyle.dart';

class Home_Tasks_List extends StatelessWidget {
  const Home_Tasks_List({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 105,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          "Task Name",
                          style: GetTitleTextStyle(color: AppColors.whiteColor),
                        ),
                        Gap(5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.access_time_rounded,
                              color: AppColors.whiteColor,
                            ),
                            Gap(5),
                            Text(
                              "10:00 AM - 11:00 AM",
                              style: GetSmallTextStyle(
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ],
                        ),
                        Gap(5),
                        Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          "Task Description",
                          style: GetSmallTextStyle(color: AppColors.whiteColor),
                        ),
                      ],
                    ),
                  ),
                ),
                VerticalDivider(
                  color: AppColors.whiteColor,
                  indent: 10,
                  endIndent: 10,
                ),
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    "ToDo",
                    style: GetTitleTextStyle(color: AppColors.whiteColor),
                  ),
                ),
                Gap(10),
              ],
            ),
          );
        },
      ),
    );
  }
}

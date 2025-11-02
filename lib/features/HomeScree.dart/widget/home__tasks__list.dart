import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/model/Task_Model.dart';
import 'package:taskati/core/services/localDataHelper.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/core/utils/textStyle.dart';

class Home_Tasks_List extends StatelessWidget {
  final String selectedDate;
  Home_Tasks_List({super.key, String? selectedDate})
    : selectedDate =
          selectedDate ?? DateFormat("dd/MM/yyyy").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder(
        valueListenable: Localdatahelper.Taskbox!.listenable(),
        builder: (BuildContext context, box, Widget? child) {
          List<TaskModel> tasks = box.values
              .where((e) => e.Date == selectedDate)
              .toList();

          if (tasks.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset("assets/images/Task Loader.json"),
                  Gap(10),
                  Text(
                    "No Tasks for this Day",
                    style: GetBodyTextStyle(context),
                  ),
                ],
              ),
            );
          } else {
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                var data = tasks[index];

                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.check, color: AppColors.whiteColor),
                        Gap(5),
                        Text(
                          "Complete",
                          style: GetBodyTextStyle(
                            context,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  secondaryBackground: Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: AppColors.redColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.delete, color: AppColors.whiteColor),
                        Gap(5),
                        Text(
                          "Delete",
                          style: GetBodyTextStyle(
                            context,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.endToStart) {
                      box.delete(data.Id);
                    } else {
                      box.put(data.Id, data.copyWith(isCompleted: true));
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: double.infinity,
                    height: 105,
                    decoration: BoxDecoration(
                      color: data.isCompleted == true
                          ? Colors.green
                          : data.color == 0
                          ? AppColors.primaryColor
                          : data.color == 1
                          ? AppColors.redColor
                          : AppColors.orangeColor,
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
                                  data.title,
                                  style: GetTitleTextStyle(
                                    context,
                                    color: AppColors.whiteColor,
                                  ),
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
                                      "${data.StartDate} - ${data.EndDate}",
                                      style: GetSmallTextStyle(
                                        context,
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Gap(5),
                                Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  "${data.Description}",
                                  style: GetSmallTextStyle(
                                    context,
                                    color: AppColors.whiteColor,
                                  ),
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
                            data.isCompleted == true ? "Completed" : "ToDo",
                            style: GetTitleTextStyle(
                              context,
                              color: AppColors.whiteColor,
                              fontsize: 14,
                            ),
                          ),
                        ),
                        Gap(10),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

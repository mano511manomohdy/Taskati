import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/core/utils/textStyle.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/features/AddTask_Screen/widget/date_row.dart';
import 'package:taskati/features/AddTask_Screen/widget/date_text_form_field.dart';
import 'package:taskati/features/AddTask_Screen/widget/description_text_formfield.dart';
import 'package:taskati/features/AddTask_Screen/widget/title_textform_field.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController DateController = TextEditingController();
  TextEditingController StartTimeController = TextEditingController();
  TextEditingController EndtimeController = TextEditingController();
  int SelectedColor = 0;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    DateController.text = DateFormat("dd/mm/yyyy").format(DateTime.now());
    StartTimeController.text = DateFormat("hh:mm a").format(DateTime.now());
    EndtimeController.text = DateFormat("hh:mm a").format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Task", style: GetBodyTextStyle()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              titleTextformField(),
              Gap(10),
              DescriptionTextFormfield(),
              Gap(10),
              DateTextFormField(DateController: DateController),

              Gap(10),
              DateTimeRow(
                StartTimeController: StartTimeController,
                EndtimeController: EndtimeController,
              ),
              Gap(10),
              Row(
                children: [
                  Row(
                    children: List.generate(3, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 2.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              SelectedColor = index;
                            });
                          },
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: index == 0
                                ? AppColors.primaryColor
                                : index == 1
                                ? AppColors.redColor
                                : AppColors.orangeColor,
                            child: SelectedColor == index
                                ? Icon(Icons.check, color: AppColors.whiteColor)
                                : null,
                          ),
                        ),
                      );
                    }),
                  ),
                  Spacer(),
                  CustomButton(text: "create Task", onpressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

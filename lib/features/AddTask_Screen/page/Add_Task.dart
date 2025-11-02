import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/extenstions/Navigator.dart';
import 'package:taskati/core/model/Task_Model.dart';
import 'package:taskati/core/services/localDataHelper.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/core/utils/textStyle.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/features/AddTask_Screen/widget/date_row.dart';
import 'package:taskati/features/AddTask_Screen/widget/date_text_form_field.dart';
import 'package:taskati/features/AddTask_Screen/widget/description_text_formfield.dart';
import 'package:taskati/features/AddTask_Screen/widget/title_textform_field.dart';
import 'package:taskati/features/HomeScree.dart/page/HomeScreen.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var formKey = GlobalKey<FormState>();
  TextEditingController TitleController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();
  TextEditingController DateController = TextEditingController();
  TextEditingController StartTimeController = TextEditingController();
  TextEditingController EndtimeController = TextEditingController();
  int SelectedColor = 0;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    DateController.text = DateFormat("dd/MM/yyyy").format(DateTime.now());
    StartTimeController.text = DateFormat("hh:mm a").format(DateTime.now());
    EndtimeController.text = DateFormat("hh:mm a").format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Task", style: GetBodyTextStyle(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                titleTextformField(titleController: TitleController),
                Gap(10),
                DescriptionTextFormfield(discController: DescriptionController),
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
                                  ? Icon(
                                      Icons.check,
                                      color: AppColors.whiteColor,
                                    )
                                  : null,
                            ),
                          ),
                        );
                      }),
                    ),
                    Spacer(),
                    CustomButton(
                      text: "create Task",
                      onpressed: () {
                        String TaskKey =
                            DateTime.now().microsecondsSinceEpoch.toString() +
                            TitleController.text;
                        if (formKey.currentState!.validate()) {
                          Localdatahelper.cacheTask(
                            TaskKey,
                            TaskModel(
                              Id: TaskKey,
                              title: TitleController.text,
                              Description: DescriptionController.text,
                              Date: DateController.text,
                              StartDate: StartTimeController.text,
                              EndDate: EndtimeController.text,
                              color: SelectedColor,
                              isCompleted: false,
                            ),
                          );
                          context.PushReplacement(Homescreen());
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

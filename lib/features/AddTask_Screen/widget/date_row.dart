import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/textStyle.dart';

class DateTimeRow extends StatelessWidget {
  const DateTimeRow({
    super.key,
    required this.StartTimeController,
    required this.EndtimeController,
  });

  final TextEditingController StartTimeController;
  final TextEditingController EndtimeController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                "Start Time",
                style: GetBodyTextStyle(fontWeight: FontWeight.w500),
              ),
              Gap(5),
              TextFormField(
                controller: StartTimeController,
                onTap: () async {
                  var pickeDate = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickeDate != null) {
                    StartTimeController.text = pickeDate.format(context);
                  }
                },
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.access_time),
                ),
              ),
            ],
          ),
        ),
        Gap(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                "End Time",
                style: GetBodyTextStyle(fontWeight: FontWeight.w500),
              ),
              Gap(5),
              TextFormField(
                controller: EndtimeController,
                onTap: () async {
                  var pickedDate = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedDate != null) {
                    EndtimeController.text = pickedDate.format(context);
                  }
                },
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.access_time),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

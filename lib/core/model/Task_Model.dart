import 'package:hive/hive.dart';
part 'Task_Model.g.dart';

@HiveType(typeId: 1)
class TaskModel {
  @HiveField(0)
  final String Id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String Description;
  @HiveField(3)
  final String Date;
  @HiveField(4)
  final String StartDate;
  @HiveField(5)
  final String EndDate;
  @HiveField(6)
  final int color;
  @HiveField(7)
  final bool isCompleted;

  TaskModel({
    required this.Id,
    required this.title,
    required this.Description,
    required this.Date,
    required this.StartDate,
    required this.EndDate,
    required this.color,
    required this.isCompleted,
  });

  TaskModel copyWith({
    String? Id,
    String? title,
    String? Description,
    String? Date,
    String? StartDate,
    String? EndDate,
    int? color,
    bool? isCompleted,
  }) {
    return TaskModel(
      Id: Id ?? this.Id,
      title: title ?? this.title,
      Description: Description ?? this.Description,
      Date: Date ?? this.Date,
      StartDate: StartDate ?? this.StartDate,
      EndDate: EndDate ?? this.EndDate,
      color: color ?? this.color,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Task_Model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  final int typeId = 1;

  @override
  TaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskModel(
      Id: fields[0] as String,
      title: fields[1] as String,
      Description: fields[2] as String,
      Date: fields[3] as String,
      StartDate: fields[4] as String,
      EndDate: fields[5] as String,
      color: fields[6] as int,
      isCompleted: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.Id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.Description)
      ..writeByte(3)
      ..write(obj.Date)
      ..writeByte(4)
      ..write(obj.StartDate)
      ..writeByte(5)
      ..write(obj.EndDate)
      ..writeByte(6)
      ..write(obj.color)
      ..writeByte(7)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

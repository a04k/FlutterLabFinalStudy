import 'package:hive/hive.dart';

part 'todo.g.dart'; 

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  String content;

  @HiveField(1)
  bool isComplete;

  Todo({required this.content, this.isComplete = false});
}

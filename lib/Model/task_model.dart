import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'task_model.g.dart';


final uuid = Uuid();

@HiveType(typeId: 0)
class Tasks {
  @HiveField(0)
  String title;

  @HiveField(1)
  String id;


  Tasks({required this.title, String? id}) : id = id ?? uuid.v4();
}

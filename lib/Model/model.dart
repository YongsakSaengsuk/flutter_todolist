import 'package:uuid/uuid.dart';

final uuid = Uuid();

class Model {
  final String id;
  final String title;
  final bool isDone;

  Model({required this.title, required this.isDone}) : id = uuid.v4();
}

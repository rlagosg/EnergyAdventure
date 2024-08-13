
import 'package:isar/isar.dart';

part 'question.g.dart';


@collection
class Question {

  Id? isarId;

  int answer;
  String category;
  String content;
  String explication;
  String id;
  int level;
  List<String> options;
  String type;

  Question({
      required this.answer,
      required this.category,
      required this.content,
      required this.explication,
      required this.id,
      required this.level,
      required this.options,
      required this.type,
  });
}

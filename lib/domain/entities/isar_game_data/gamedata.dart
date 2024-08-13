
import 'package:isar/isar.dart';

part 'gamedata.g.dart';

@collection
class GameData {

  Id? isarId;

  final int maxScore;
  final int currentScore;
  final bool canContinue;
  final bool isIntroShown;

  GameData({
    required this.maxScore,
    required this.currentScore,
    required this.canContinue,
    required this.isIntroShown
  });

}
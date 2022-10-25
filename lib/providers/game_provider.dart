import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tabu_game_projects/model/team_model.dart';

class GameProvider with ChangeNotifier {
  TeamModel teamA = TeamModel(
    teamName: "A TAKIMI",
    teamSkore: 0,
  );
  TeamModel teamB = TeamModel(
    teamName: "B TAKIMI",
    teamSkore: 0,
  );

  bool statusTeam = true;

  int pass = 3;
  late int random;

  List<int> randomWords = [];

  int randomGenerator() {
    int random = Random().nextInt(50);

    while (randomWords.contains(random)) {
      random = Random().nextInt(50);
      return random;
    }
    randomWords.add(random);
    notifyListeners();

    return random;
  }

  void incrementScore() {
    if (statusTeam) {
      teamA.teamSkore = teamA.teamSkore! + 1;
    } else {
      teamB.teamSkore = teamB.teamSkore! + 1;
    }

    notifyListeners();
  }

  void decrementScore() {
    if (statusTeam) {
      teamA.teamSkore = teamA.teamSkore! - 1;
    } else {
      teamB.teamSkore = teamB.teamSkore! - 1;
    }
    notifyListeners();
  }

  void decrementPass() {
    pass--;
    notifyListeners();
  }
}

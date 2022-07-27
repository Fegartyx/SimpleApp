import 'dart:math';

import 'package:flutter/material.dart';

class Gameplay with ChangeNotifier {
  String computerImg = 'assets/question.png';
  String result = 'assets/question.png';
  var option = ['ROCK', 'PAPER', 'SCISSORS'];
  var rules = {
    "ROCK-SCISSORS": true,
    "ROCK-PAPER": false,
    "SCISSORS-PAPER": true,
    "SCISSORS-ROCK": false,
    "PAPER-ROCK": true,
    "PAPER-SCISSORS": false
  };
  var optionImage = {
    "ROCK": 'assets/rock.png',
    "PAPER": 'assets/paper.png',
    "SCISSORS": 'assets/scissors.png',
  };

  String randomOption() => option[Random().nextInt(3)];
  String pickImage(String option) {
    computerImg = optionImage[option];
    notifyListeners();
  }

  bool isDraw(String from, String to) => from == to;

  bool isWin(String from, String to) => rules['$from-$to'];
}

import 'package:flutter/material.dart';

import 'Game.dart';

class GameProvider with ChangeNotifier {
  Game _game;
  Game get game => _game;
  set game(Game game) {
    _game = game;
    notifyListeners();
  }

  Game option = Game();
  GameProvider() {
    game = option;
  }
}

import 'package:first_app/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<Gameplay>(
        create: (context) => Gameplay(),
        child: CodeApp(),
      ),
    );
  }
}

class CodeApp extends StatelessWidget {
  String computerOption;
  String rock = 'assets/rock.png';
  String paper = 'assets/paper.png';
  String scissors = 'assets/scissors.png';

  @override
  Widget build(BuildContext context) {
    final Gameplay gameProvider = Provider.of<Gameplay>(context);
    startGame(String option) {
      computerOption = gameProvider.randomOption();
      gameProvider.pickImage(computerOption);

      if (gameProvider.isDraw(option, computerOption)) {
        gameProvider.result = 'assets/draw.png';
      } else if (gameProvider.isWin(option, computerOption)) {
        gameProvider.result = 'assets/win.png';
      } else {
        gameProvider.result = 'assets/lose.png';
      }
    }

    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: Color(0xff2C96F1),
        title: Text('BATU-GUNTING-KERTAS'),
      );
    }

    Widget body() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('COMPUTER : '),
            SizedBox(
              height: 10,
            ),
            Consumer<Gameplay>(
              builder: (context, gameProvider, child) => Image.asset(
                gameProvider.computerImg,
                width: 100,
              ),
            ),
            Text('YOU'),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    startGame("ROCK");
                  },
                  child: Image.asset(
                    rock,
                    width: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    startGame("SCISSORS");
                  },
                  child: Image.asset(
                    scissors,
                    width: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    startGame("PAPER");
                  },
                  child: Image.asset(
                    paper,
                    width: 100,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text('WIDGET'),
            Consumer<Gameplay>(
              builder: (context, gameProvider, child) => Image.asset(
                gameProvider.result,
                width: 150,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      body: body(),
    );
  }
}

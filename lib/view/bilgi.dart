import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabu_game_projects/model/team_model.dart';
import 'package:tabu_game_projects/providers/game_provider.dart';
import 'package:tabu_game_projects/view/giris.dart';
import 'package:tabu_game_projects/view/oyun.dart';

// ignore: must_be_immutable
class InfoPage extends StatelessWidget {
  TeamModel teamA, teamB;

  InfoPage({super.key, required this.teamA, required this.teamB});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var state = Provider.of<GameProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: size.width * 0.8,
          height: size.height * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.grey.shade900, blurRadius: 20),
            ],
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      teamA.teamName!,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      teamB.teamName!,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text(
                        "${teamA.teamSkore}",
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      if (teamA.teamSkore! >= 25) const Icon(Icons.check)
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "${teamB.teamSkore}",
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      if (teamB.teamSkore! >= 25) const Icon(Icons.check)
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 64,
              ),
              Image.asset(
                "assets/images/tabu.jpg",
                width: 200,
                height: 200,
              ),
              const SizedBox(
                height: 64,
              ),
              ElevatedButton(
                onPressed: () {
                  if (teamA.teamSkore! >= 25 || teamB.teamSkore! >= 25) {
                    state.teamA.teamSkore = 0;
                    state.teamB.teamSkore = 0;
                    state.statusTeam = true;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OyunPage(),
                      ),
                    );
                  }
                },
                child: Text(
                  teamA.teamSkore! >= 25 || teamB.teamSkore! >= 25
                      ? "Ana Menü"
                      : "Devam",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

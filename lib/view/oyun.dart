import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabu_game_projects/db/kelimeler.dart';
import 'package:tabu_game_projects/providers/game_provider.dart';
import 'package:tabu_game_projects/view/bilgi.dart';
import 'package:timer_count_down/timer_count_down.dart';

class OyunPage extends StatefulWidget {
  OyunPage({super.key});

  @override
  State<OyunPage> createState() => _OyunPageState();
}

class _OyunPageState extends State<OyunPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<GameProvider>(
        builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                        "${value.statusTeam ? value.teamA.teamName : value.teamB.teamName}"),
                    Text(
                        "SKOR: ${value.statusTeam ? value.teamA.teamSkore : value.teamB.teamSkore}"),
                    Countdown(
                      seconds: 60,
                      build: (BuildContext context, double time) =>
                          Text(time.toString()),
                      interval: const Duration(milliseconds: 100),
                      onFinished: () {
                        value.statusTeam = !value.statusTeam;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InfoPage(
                                teamA: value.teamA, teamB: value.teamB),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  width: size.width * 0.8,
                  height: size.height * 0.65,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade900, blurRadius: 20),
                    ],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Card(
                        color: Colors.blue.shade200,
                        child: ListTile(
                          title: Center(
                            child: Text(Words
                                .words[value.randomGenerator()]!.keys.first),
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: Words.words[value.randomGenerator()]!.values
                            .first.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            style: ListTileStyle.drawer,
                            title: Center(
                              child: Text(Words.words[1]!.values.first[index]),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      value.decrementScore();
                    },
                    child: const Text("TABU"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("PAS"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      value.incrementScore();
                    },
                    child: const Text("DOĞRU"),
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

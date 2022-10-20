import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabu_game_projects/db/kelimeler.dart';
import 'package:tabu_game_projects/providers/game_provider.dart';
import 'package:tabu_game_projects/view/bilgi.dart';
import 'package:timer_count_down/timer_count_down.dart';

class OyunPage extends StatefulWidget {
  const OyunPage({super.key});

  @override
  State<OyunPage> createState() => _OyunPageState();
}

class _OyunPageState extends State<OyunPage> {
  @override
  void initState() {
    super.initState();
    var state = Provider.of<GameProvider>(context, listen: false);
    state.pass = 3;
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
          //int random = value.randomGenerator();
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
                      seconds: 10,
                      build: (BuildContext context, double time) =>
                          Text(time.toString()),
                      interval: const Duration(milliseconds: 100),
                      onFinished: () {
                        value.statusTeam = !value.statusTeam;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InfoPage(
                              teamA: value.teamA,
                              teamB: value.teamB,
                            ),
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
                            child: Text(Words.words[0]!.keys.first),
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: Words.words[0]!.values.first.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            style: ListTileStyle.drawer,
                            title: Center(
                              child: Text(Words.words[0]!.values.first[index]),
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
                    onPressed: () {
                      if (value.pass == 0) {
                        return;
                      }
                      value.decrementPass();
                    },
                    child: Text("PAS ${value.pass.toString()}"),
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

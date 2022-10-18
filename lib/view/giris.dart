import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabu_game_projects/core/companents/textFormField/custom_text_field.dart';
import 'package:tabu_game_projects/model/team_model.dart';
import 'package:tabu_game_projects/providers/home_provider.dart';
import 'package:tabu_game_projects/view/bilgi.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer<HomeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return Center(
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
              child: SafeArea(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 64.0),
                      child: Text(
                        "TABU",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    CustomTextField(
                        controller: value.controllerA, hintText: "A TAKIMI"),
                    CustomTextField(
                        controller: value.controllerB, hintText: "B TAKIMI"),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InfoPage(
                                teamA: TeamModel(
                                    teamName: value.controllerA.text.isEmpty
                                        ? "A TAKIMI"
                                        : value.controllerA.text,
                                    teamSkore: 0),
                                teamB: TeamModel(
                                    teamName: value.controllerB.text.isEmpty
                                        ? "B TAKIMI"
                                        : value.controllerB.text,
                                    teamSkore: 0),
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          "OYNA",
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

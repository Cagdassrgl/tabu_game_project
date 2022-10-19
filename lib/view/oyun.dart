import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabu_game_projects/providers/game_provider.dart';

class OyunPage extends StatelessWidget {
  const OyunPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<GameProvider>(
        builder: (context, value, child) {
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
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabu_game_projects/core/constants/app_const.dart';
import 'package:tabu_game_projects/providers/home_provider.dart';
import 'package:tabu_game_projects/providers/info_provider.dart';
import 'package:tabu_game_projects/view/giris.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => InfoProvider(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppText.materialText,
        home: HomePage(),
      ),
    );
  }
}

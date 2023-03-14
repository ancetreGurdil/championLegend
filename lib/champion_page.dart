import 'package:championlegends/model/champion.dart';
import 'package:flutter/material.dart';

class ChampionPage extends StatelessWidget {
  const ChampionPage({super.key,required this.champion});

  final Champion champion;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(champion.id),
      ),
    );
  }
}
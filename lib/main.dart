import 'package:flutter/material.dart';
import 'package:kros6/models/Krosmaster.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(title: 'Kros6'));
  }
}

class HomePage extends StatelessWidget {
  final krosmasters = [
    Krosmaster(
        id: "a",
        name: "Guy Yermetel",
        level: 1,
        appearance: "a",
        initiative: 1,
        unique: Unique.gold,
        isBoss: true),
    Krosmaster(
        id: "a",
        name: "Guy Yermetel",
        level: 1,
        appearance: "a",
        initiative: 1,
        unique: Unique.gold,
        isBoss: true)
  ];

  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: krosmasters.length,
        itemBuilder: (context, i) {
          final krosmaster = krosmasters[i];

          return ListTile(
            title: Text(krosmaster.name),
          );
        },
      ),
    );
  }
}

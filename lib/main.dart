import 'package:flutter/material.dart';
import 'package:kros6/models/krosmaster.dart';
import 'package:kros6/models/team.dart';

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
  final teams = [
    Team(krosmasters: [
      Krosmaster(
          id: "gasper-feyto",
          name: "Gasper Feyto",
          level: 3,
          appearance: "a",
          initiative: 3,
          unique: Unique.gold,
          isBoss: false),
      Krosmaster(
          id: "otomai",
          name: "Otomai",
          level: 6,
          appearance: "a",
          initiative: 0,
          unique: Unique.gold,
          isBoss: false),
      Krosmaster(
          id: "barden-tadura",
          name: "Steamy Wonder ",
          level: 1,
          appearance: "a",
          initiative: 0,
          unique: Unique.gold,
          isBoss: false),
      Krosmaster(
          id: "barden-tadura",
          name: "Barden Tadura",
          level: 1,
          appearance: "a",
          initiative: 3,
          unique: Unique.white,
          isBoss: false),
      Krosmaster(
          id: "day-kiri",
          name: "Day Kiri",
          level: 1,
          appearance: "a",
          initiative: 0,
          unique: Unique.gold,
          isBoss: false),
    ]),
    Team(krosmasters: [
      Krosmaster(
          id: "thio",
          name: "Thio",
          level: 4,
          appearance: "a",
          initiative: 10,
          unique: Unique.gold,
          isBoss: false),
      Krosmaster(
          id: "henual",
          name: "Henual",
          level: 2,
          appearance: "a",
          initiative: 6,
          unique: Unique.white,
          isBoss: false),
      Krosmaster(
          id: "deminobola",
          name: "Deminobola",
          level: 3,
          appearance: "a",
          initiative: 7,
          unique: Unique.white,
          isBoss: false),
      Krosmaster(
          id: "diver-birel",
          name: "Diver Briel",
          level: 3,
          appearance: "a",
          initiative: 6,
          unique: Unique.white,
          isBoss: false)
    ]),
  ];

  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const TextField(
                        decoration:
                            InputDecoration(labelText: "Quantidade de times"),
                      ),
                      TextButton(
                        child: const Text('Criar'),
                        onPressed: () {
                          debugPrint("AA");
                        },
                      )
                    ],
                  ),
                )),
            ...teams.map((team) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.bolt,
                              color: Colors.yellow,
                              size: 24.0,
                              shadows: [
                                Shadow(color: Colors.black, blurRadius: 10)
                              ],
                            ),
                            Text(team.getInitiative().toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      ...team.krosmasters.map((krosmaster) {
                        return ListView(
                          shrinkWrap: true,
                          children: [
                            ListTile(
                              /* leading: Icon(Icons.map), */
                              title: Text(krosmaster.name),
                              subtitle: Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 24.0,
                                  ),
                                  Text(krosmaster.level.toString()),
                                  const Icon(
                                    Icons.bolt,
                                    color: Colors.yellow,
                                    size: 24.0,
                                  ),
                                  Text(krosmaster.initiative.toString()),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                    ])),
              );
            })
          ]),
        ));
  }
}

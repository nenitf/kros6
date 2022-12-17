import 'package:flutter/material.dart';
import 'package:kros6/models/krosmaster.dart';
import 'package:kros6/models/team.dart';

import 'api/teams/client.dart';

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

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var teams = [];

  void setTeams(List<Team> teams) {
    setState(() {
      this.teams = teams;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
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
                            InputDecoration(labelText: "Quantidade de times: 2"),
                            enabled: false,
                      ),
                      TextButton(
                        child: const Text('Criar'),
                        onPressed: () {
                          final teams = Client().create(2);
                          setTeams(teams);
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
                            Text(team.initiative.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      ...team.krosmasters.map((krosmaster) {
                        return ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            ListTile(
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

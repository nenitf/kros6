import 'package:kros6/models/krosmaster.dart';

class Team {
  final List<Krosmaster> krosmasters;
  /* final String initiative; */

  Team({required this.krosmasters});

  num getInitiative() {
    return 10;
  }
}

class CreateTeam {
  Team execute() {
    return Team(krosmasters: [
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
    ]);
  }
}

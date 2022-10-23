import 'package:kros6/backend/teams/team.dart';
import 'package:kros6/backend/krosmasters/krosmaster.dart';

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

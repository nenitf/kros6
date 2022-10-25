import 'package:flutter_test/flutter_test.dart';
import 'package:kros6/backend/teams/create.dart';
import 'package:kros6/backend/teams/team.dart';
import 'package:kros6/backend/krosmasters/krosmaster.dart';

void main() {
  group("invalid team", () {
    test("has 12 gg", () {
      expect(
          () => CreateTeam().execute([
                Krosmaster(
                    id: "thio",
                    name: "Thio",
                    level: 4,
                    appearance: "a",
                    initiative: 10,
                    unique: Unique.gold,
                    isBoss: false),
              ]),
          throwsException);

      expect(
          () => CreateTeam().execute([
                Krosmaster(
                    id: "thio1",
                    name: "Thio1",
                    level: 4,
                    appearance: "a",
                    initiative: 10,
                    unique: Unique.gold,
                    isBoss: false),
                Krosmaster(
                    id: "thio2",
                    name: "Thio2",
                    level: 4,
                    appearance: "a",
                    initiative: 10,
                    unique: Unique.gold,
                    isBoss: false),
                Krosmaster(
                    id: "thio3",
                    name: "Thio3",
                    level: 4,
                    appearance: "a",
                    initiative: 10,
                    unique: Unique.gold,
                    isBoss: false),
                Krosmaster(
                    id: "thio4",
                    name: "Thio4",
                    level: 4,
                    appearance: "a",
                    initiative: 10,
                    unique: Unique.gold,
                    isBoss: false),
              ]),
          throwsA(isA<GGException>()));
    });

    test("has one boss only", () {
      expect(
          () => CreateTeam().execute([
                Krosmaster(
                    id: "thio1",
                    name: "Thio1",
                    level: 4,
                    appearance: "a",
                    initiative: 10,
                    unique: Unique.gold,
                    isBoss: true),
                Krosmaster(
                    id: "thio2",
                    name: "Thio2",
                    level: 4,
                    appearance: "a",
                    initiative: 10,
                    unique: Unique.gold,
                    isBoss: true),
                Krosmaster(
                    id: "thio3",
                    name: "Thio3",
                    level: 4,
                    appearance: "a",
                    initiative: 10,
                    unique: Unique.gold,
                    isBoss: true),
              ]),
          throwsA(isA<ExceededBossLimitException>()));
    });

    test("has at most one unique gold krosmasters", () {
      var repeatedKros = Krosmaster(
          id: "thio1",
          name: "Thio1",
          level: 4,
          appearance: "a",
          initiative: 10,
          unique: Unique.gold,
          isBoss: false);

      expect(
          () => CreateTeam().execute([
                repeatedKros,
                repeatedKros,
                Krosmaster(
                    id: "thio2",
                    name: "Thio2",
                    level: 4,
                    appearance: "a",
                    initiative: 10,
                    unique: Unique.gold,
                    isBoss: false),
              ]),
          throwsA(isA<ExceededUniqueGoldLimitException>()));
    });

    test("has at most two unique white krosmasters", () {
      var repeatedKros = Krosmaster(
          id: "thio1",
          name: "Thio1",
          level: 4,
          appearance: "a",
          initiative: 10,
          unique: Unique.white,
          isBoss: false);

      expect(
          () => CreateTeam().execute([
                repeatedKros,
                repeatedKros,
                repeatedKros,
              ]),
          throwsA(isA<ExceededUniqueWhiteLimitException>()));
    });

    test("has at most three unique black krosmasters", () {
      var repeatedKros = Krosmaster(
          id: "thio1",
          name: "Thio1",
          level: 3,
          appearance: "a",
          initiative: 10,
          unique: Unique.black,
          isBoss: false);

      expect(
          () => CreateTeam().execute([
                repeatedKros,
                repeatedKros,
                repeatedKros,
                repeatedKros,
              ]),
          throwsA(isA<ExceededUniqueBlackLimitException>()));
    });
  });

  group("valid team", () {
    test("#1", () {
      var team = CreateTeam().execute([
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
      ]);

      expect(team, isA<Team>());
    });

    test("#2", () {
      var team = CreateTeam().execute([
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

      expect(team, isA<Team>());
    });
  });
}

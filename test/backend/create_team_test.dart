import 'package:flutter_test/flutter_test.dart';
import 'package:kros6/backend/teams/create.dart';
import 'package:kros6/backend/teams/team.dart';

import 'fixtures/krosmasters.dart';

void main() {
  group("invalid team", () {
    test("has 12 gg", () {
      expect(
          () => CreateTeam().execute([
                krosmaster("thio"),
              ]),
          throwsException);

      expect(
          () => CreateTeam().execute([
                krosmaster("thio"),
                krosmaster("otomai"),
                krosmaster("gasper feyto"),
              ]),
          throwsA(isA<GGException>()));
    });

    test("has at minimum three krosmasters", () {
      expect(
          () => CreateTeam().execute([
                krosmaster("otomai"),
                krosmaster("gein"),
              ]),
          throwsA(isA<MissedKrosmasterException>()));
    });

    test("has at most seven krosmasters", () {
      expect(
          () => CreateTeam().execute([
                krosmaster("riktus de brakmar"),
                krosmaster("riktus de brakmar"),
                krosmaster("riktus de brakmar"),
                krosmaster("henual"),
                krosmaster("jeyro rello"),
                krosmaster("day kiri"),
                krosmaster("steamy wonder"),
                krosmaster("barden tadura"),
              ]),
          throwsA(isA<ExceededKrosmasterException>()));
    });

    test("has one boss only", () {
      expect(
          () => CreateTeam().execute([
                krosmaster("papatudo real"),
                krosmaster("tofu real"),
                krosmaster("diver birel"),
                krosmaster("gasper feyto"),
              ]),
          throwsA(isA<ExceededBossLimitException>()));
    });

    test("has at most one unique gold krosmasters", () {
      expect(
          () => CreateTeam().execute([
                krosmaster("gasper feyto"),
                krosmaster("gasper feyto"),
                krosmaster("deminobola"),
                krosmaster("diver birel"),
              ]),
          throwsA(isA<ExceededUniqueGoldLimitException>()));
    });

    test("has at most two unique white krosmasters", () {
      expect(
          () => CreateTeam().execute([
                krosmaster("deminobola"),
                krosmaster("deminobola"),
                krosmaster("deminobola"),
                krosmaster("diver birel"),
              ]),
          throwsA(isA<ExceededUniqueWhiteLimitException>()));
    });

    test("has at most three unique black krosmasters", () {
      expect(
          () => CreateTeam().execute([
                krosmaster("riktus de brakmar"),
                krosmaster("riktus de brakmar"),
                krosmaster("riktus de brakmar"),
                krosmaster("riktus de brakmar"),
                krosmaster("thio"),
              ]),
          throwsA(isA<ExceededUniqueBlackLimitException>()));
    });
  });

  group("valid team", () {
    final dataProvider = [
      [
        krosmaster("gasper feyto"),
        krosmaster("otomai"),
        krosmaster("barden tadura"),
        krosmaster("steamy wonder"),
        krosmaster("day kiri"),
      ],
      [
        krosmaster("thio"),
        krosmaster("henual"),
        krosmaster("deminobola"),
        krosmaster("diver birel"),
      ]
    ];

    dataProvider.asMap().forEach((i, krosmasters) {
      test("#$i", () {
        var team = CreateTeam().execute(krosmasters);

        expect(team, isA<Team>());
      });
    });
  });
}

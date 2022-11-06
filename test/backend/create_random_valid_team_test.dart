import 'package:flutter_test/flutter_test.dart';
import 'package:kros6/backend/teams/create.dart';
import 'package:kros6/backend/teams/create_random.dart';
import 'package:kros6/backend/teams/team.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([KrosmasterRepository])
import 'create_random_valid_team_test.mocks.dart';
import 'fixtures/krosmasters.dart';

void main() {
  group("a sufficient krosmaster collection", () {
    final dataProvider = [
      [
        krosmaster("gasper feyto"),
        krosmaster("otomai"),
        krosmaster("barden tadura"),
        krosmaster("steamy wonder"),
        krosmaster("day kiri"),
        krosmaster("barden tadura"),
      ],
      [
        krosmaster("thio"),
        krosmaster("thio"),
        krosmaster("henual"),
        krosmaster("deminobola"),
        krosmaster("diver birel"),
      ],
      [
        krosmaster("otomai"),
        krosmaster("gein"),
        krosmaster("thio"),
        krosmaster("henual"),
      ],
      [
        krosmaster("riktus de brakmar"),
        krosmaster("riktus de brakmar"),
        krosmaster("riktus de brakmar"),
        krosmaster("henual"),
        krosmaster("jeyro rello"),
        krosmaster("day kiri"),
        krosmaster("steamy wonder"),
        krosmaster("barden tadura"),
        krosmaster("jordy ritane"),
      ],
      [
        krosmaster("wally faier"),
        krosmaster("wally faier"),
        krosmaster("kivin"),
        krosmaster("kivin"),
        krosmaster("jeyro rello"),
        krosmaster("day kiri"),
        krosmaster("steamy wonder"),
        krosmaster("barden tadura"),
        krosmaster("jordy ritane"),
        krosmaster("gein"),
      ],
      [
        krosmaster("riktus de brakmar"),
        krosmaster("riktus de brakmar"),
        krosmaster("riktus de brakmar"),
        krosmaster("riktus de brakmar"),
        krosmaster("riktus de brakmar"),
        krosmaster("riktus de brakmar"),
        krosmaster("henual"),
        krosmaster("jeyro rello"),
        krosmaster("day kiri"),
        krosmaster("steamy wonder"),
        krosmaster("barden tadura"),
        krosmaster("jordy ritane"),
      ],
      [
        krosmaster("diver birel"),
        krosmaster("diver birel"),
        krosmaster("diver birel"),
        krosmaster("deminobola"),
        krosmaster("deminobola"),
      ],
      [
        krosmaster("papatudo real"),
        krosmaster("tofu real"),
        krosmaster("diver birel"),
        krosmaster("diver birel"),
        krosmaster("deminobola"),
        krosmaster("deminobola"),
      ],
      [
        krosmaster("riktus de brakmar"),
        krosmaster("riktus de brakmar"),
        krosmaster("riktus de brakmar"),
        krosmaster("henual"),
        krosmaster("jeyro rello"),
        krosmaster("day kiri"),
        krosmaster("steamy wonder"),
        krosmaster("barden tadura"),
        krosmaster("diver birel"),
      ],
    ];

    dataProvider.asMap().forEach((i, shuffledKrosmasters) {
      test("generates one team (#$i)", () {
        final repo = MockKrosmasterRepository();
        when(repo.allAvailable()).thenReturn(shuffledKrosmasters);
        var sut = CreateRandomTeams(CreateTeam(), repo);
        var team = sut.execute(1);
        expect(team, isA<List<Team>>());
        expect(team.length, 1);
      });
    });

    final dataProvider2 = [
      [
        krosmaster("gasper feyto"),
        krosmaster("otomai"),
        krosmaster("barden tadura"),
        krosmaster("steamy wonder"),
        krosmaster("day kiri"),
        krosmaster("thio"),
        krosmaster("henual"),
        krosmaster("deminobola"),
        krosmaster("diver birel"),
      ],
    ];

    dataProvider2.asMap().forEach((i, shuffledKrosmasters) {
      test("generates two teams (#$i)", () {
        final repo = MockKrosmasterRepository();
        when(repo.allAvailable()).thenReturn(shuffledKrosmasters);
        var sut = CreateRandomTeams(CreateTeam(), repo);
        var team = sut.execute(2);
        expect(team, isA<List<Team>>());
        expect(team.length, 2);
      });
    });
  });
}

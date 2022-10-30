import 'package:flutter_test/flutter_test.dart';
import 'package:kros6/backend/teams/create_random.dart';
import 'package:kros6/backend/teams/team.dart';
import 'package:kros6/backend/krosmasters/krosmaster.dart';

class FakeRespository implements KrosmasterRespository {
  final List<Krosmaster> allKros;

  FakeRespository(this.allKros);

  @override
  List<Krosmaster> all() {
    return allKros;
  }
}

void main() {
  test("valid team", () {
    var repo = FakeRespository([
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
    var service = CreateTeam();
    var sut = CreateRandomTeam(service, repo);
    var team = sut.execute();
    expect(team, isA<Team>());
  });
}

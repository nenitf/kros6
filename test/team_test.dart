import 'package:flutter_test/flutter_test.dart';
import 'package:kros6/models/team.dart';

void main() {
  test("has 12 gg", () {
    var team = CreateTeam().execute();

    var ggs = team.krosmasters.fold<num>(0, (ggs, krosmaster) {
        return ggs + krosmaster.level;
    });

    expect(ggs, 12);
  });

}

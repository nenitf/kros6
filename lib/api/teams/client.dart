import 'package:kros6/api/teams/nenirepo.dart';
import 'package:kros6/backend/teams/create.dart';
import 'package:kros6/backend/teams/create_random.dart';
import 'package:kros6/models/krosmaster.dart';
import 'package:kros6/models/team.dart';
import 'package:kros6/backend/krosmasters/krosmaster.dart' as bkrosmaster;

class Client {
  List<Team> create(int totalTeams) {
    final service = CreateRandomTeams(CreateTeam(), NeniRepository());
    final backendTeams = service.execute(totalTeams);
    final teams = backendTeams.map<Team>((team) {
      final krosmasters = team.krosmasters.map<Krosmaster>((krosmaster) {
        final Unique unique;
        switch (krosmaster.unique) {
          case bkrosmaster.Unique.gold:
            {
              unique = Unique.gold;
            }
            break;
          case bkrosmaster.Unique.white:
            {
              unique = Unique.white;
            }
            break;
          case bkrosmaster.Unique.black:
            {
              unique = Unique.black;
            }
            break;

          default:
            {
              unique = Unique.white;
            }
        }
        return Krosmaster(
          id: krosmaster.id,
          name: krosmaster.name,
          level: krosmaster.level,
          appearance: krosmaster.appearance,
          initiative: krosmaster.initiative,
          unique: unique,
          isBoss: krosmaster.isBoss,
        );
      }).toList();
      return Team(krosmasters: krosmasters);
    }).toList();
    return teams;
  }
}

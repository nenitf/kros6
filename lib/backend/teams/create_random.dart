import 'package:kros6/backend/teams/create.dart';
import 'package:kros6/backend/teams/team.dart';
import 'package:kros6/backend/krosmasters/krosmaster.dart';

abstract class KrosmasterRepository {
  List<Krosmaster> allAvailable();
}

class CreateRandomTeams {
  final CreateTeam createService;
  final KrosmasterRepository krosmasterRepository;

  CreateRandomTeams(this.createService, this.krosmasterRepository);

  List<Team> execute(int totalTeams) {
    final team = _try(totalTeams, 50);
    return team;
  }

  List<Team> _createTeams(
      int totalTeams, List<Krosmaster> availableKrosmastersShuffled) {
    final teams = [
      _createTeam(availableKrosmastersShuffled),
    ];

    if (totalTeams > 1) {
      final krosmastersUnavailable =
          teams[0].krosmasters.fold<List<String>>([], (ids, krosmaster) {
        ids.add(krosmaster.id);
        return ids;
      });
      availableKrosmastersShuffled.removeWhere(
          (krosmaster) => krosmastersUnavailable.contains(krosmaster.id));
      _createTeams(totalTeams - 1, availableKrosmastersShuffled)
          .forEach((team) {
        teams.add(team);
      });
    }

    return teams;
  }

  Team _createTeam(List<Krosmaster> availableKrosmastersShuffled) {
    var selectedKrosmasters = availableKrosmastersShuffled
        .fold<List<Krosmaster>>([], (team, krosmaster) {
      final teamAlreadyHasA6Level = team.length == 1 && team[0].level == 6;
      if (teamAlreadyHasA6Level && krosmaster.level == 6) {
        return team;
      }

      final bosses = team.where((k) => k.isBoss).length;
      if (bosses > 0 && krosmaster.isBoss) {
        return team;
      }

      var totalGgs =
          team.fold<num>(0, (ggs, krosmaster) => ggs + krosmaster.level);

      final levelDenied = krosmaster.level + totalGgs > 12;
      if (levelDenied) {
        return team;
      }

      final teamNeedsCompleteLastKrosmaster = team.length == 6;
      if (teamNeedsCompleteLastKrosmaster &&
          krosmaster.level != (12 - totalGgs)) {
        return team;
      }

      switch (krosmaster.unique) {
        case Unique.gold:
          {
            final alreadyHasThisKrosmasterOnce =
                team.any((k) => k.id == krosmaster.id);
            if (alreadyHasThisKrosmasterOnce) {
              return team;
            }
            break;
          }
        case Unique.white:
          {
            final totalWhites = team
                .where((k) => k.unique == Unique.white)
                .where((k) => k.id == krosmaster.id)
                .length;
            if (totalWhites + 1 > 2) {
              return team;
            }
            break;
          }
        case Unique.black:
          {
            final totalBlacks = team
                .where((k) => k.unique == Unique.black)
                .where((k) => k.id == krosmaster.id)
                .length;
            if (totalBlacks + 1 > 3) {
              return team;
            }
            break;
          }
      }

      team.add(krosmaster);
      return team;
    });

    final team = createService.execute(selectedKrosmasters);
    return team;
  }

  List<Team> _try(int totalTeams, int tries) {
    final allKrosmastersShuffled = krosmasterRepository.allAvailable();
    allKrosmastersShuffled.shuffle();

    try {
      return _createTeams(totalTeams, allKrosmastersShuffled);
    } catch (e) {
      if (tries < 1) {
        throw NotAbleToCreateTeamException;
      }

      allKrosmastersShuffled.shuffle();
      return _try(totalTeams, tries - 1);
    }
  }
}

class NotAbleToCreateTeamException implements Exception {
  @override
  String toString() => 'Not able to create a team';
}

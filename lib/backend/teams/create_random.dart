import 'package:kros6/backend/teams/create.dart';
import 'package:kros6/backend/teams/team.dart';
import 'package:kros6/backend/krosmasters/krosmaster.dart';

abstract class KrosmasterRepository {
  List<Krosmaster> allAvailable();
}

abstract class ShuffleService {
  List<T> execute<T>(List<T> items);
}

class CreateRandomTeam {
  final CreateTeam createService;
  final KrosmasterRepository krosmasterRepository;
  final ShuffleService shuffleService;

  CreateRandomTeam(
      this.createService, this.krosmasterRepository, this.shuffleService);

  Team execute() {
    final allKrosmastersShuffled =
        shuffleService.execute<Krosmaster>(krosmasterRepository.allAvailable());

    var selectedKrosmasters =
        allKrosmastersShuffled.fold<List<Krosmaster>>([], (team, krosmaster) {
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
}

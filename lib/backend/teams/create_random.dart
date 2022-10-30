import 'package:kros6/backend/teams/team.dart';
import 'package:kros6/backend/krosmasters/krosmaster.dart';

abstract class KrosmasterRespository {
  List<Krosmaster> all();

  /* List<Krosmaster> all() { */
  /*   return [ */
  /*     Krosmaster( */
  /*         id: "thio", */
  /*         name: "Thio", */
  /*         level: 4, */
  /*         appearance: "a", */
  /*         initiative: 10, */
  /*         unique: Unique.gold, */
  /*         isBoss: false), */
  /*     Krosmaster( */
  /*         id: "henual", */
  /*         name: "Henual", */
  /*         level: 2, */
  /*         appearance: "a", */
  /*         initiative: 6, */
  /*         unique: Unique.white, */
  /*         isBoss: false), */
  /*     Krosmaster( */
  /*         id: "deminobola", */
  /*         name: "Deminobola", */
  /*         level: 3, */
  /*         appearance: "a", */
  /*         initiative: 7, */
  /*         unique: Unique.white, */
  /*         isBoss: false), */
  /*     Krosmaster( */
  /*         id: "diver-birel", */
  /*         name: "Diver Briel", */
  /*         level: 3, */
  /*         appearance: "a", */
  /*         initiative: 6, */
  /*         unique: Unique.white, */
  /*         isBoss: false) */
  /*       ]; */
  /* } */
}

class CreateRandomTeam {
  final CreateTeam createService;
  final KrosmasterRespository krosmasterRepository;

  CreateRandomTeam(this.createService, this.krosmasterRepository);

  Team execute() {
    final allKrosmasters = krosmasterRepository.all();
    /* const allKrosmastersShuffled = this.shuffleService<List<Krosmaster>>.execute(allKrosmasters); */

    final team = createService.execute(allKrosmasters);
    return team;
    /* return Team(krosmasters: allKrosmasters); */

    // validar gg
    // validar is boss
    // validar gold
    // validar white
    // validar black
  }
}

class CreateTeam {
  Team execute(List<Krosmaster> krosmasters) {
    var ggs = krosmasters.fold<num>(0, (ggs, krosmaster) {
        return ggs + krosmaster.level;
        });

    if (ggs != 12) {
      throw GGException();
    }

    var bosses = krosmasters.fold<num>(0, (bosses, krosmaster) {
        if (krosmaster.isBoss) {
        bosses++;
        }

        return bosses;
        });

    if (bosses > 1) {
      throw ExceededBossLimitException();
    }

    if (ggs != 12) {
      throw GGException();
    }

    krosmasters
      .where((krosmaster) => krosmaster.unique == Unique.gold)
      .fold<Map>({}, (map, krosmaster) {
          if (map.containsKey(krosmaster.id)) {
          throw ExceededUniqueGoldLimitException();
          }
          map[krosmaster.id] = krosmaster.id;
          return map;
          });

    krosmasters
      .where((krosmaster) => krosmaster.unique == Unique.white)
      .fold<Map>({}, (map, krosmaster) {
          if (!map.containsKey(krosmaster.id)) {
          map[krosmaster.id] = 1;
          }

          var count = map[krosmaster.id] += 1;

          if (count > 2) {
          throw ExceededUniqueWhiteLimitException();
          }

          return map;
          });

    krosmasters
      .where((krosmaster) => krosmaster.unique == Unique.black)
      .fold<Map>({}, (map, krosmaster) {
          if (!map.containsKey(krosmaster.id)) {
          map[krosmaster.id] = 1;
          return map;
          }

          var count = map[krosmaster.id] += 1;

          if (count > 3) {
          throw ExceededUniqueBlackLimitException();
          }

          return map;
          });

    return Team(krosmasters: krosmasters);
  }
}

class GGException implements Exception {
  @override
    String toString() => 'Team must have 12 ggs';
}

class ExceededBossLimitException implements Exception {
  @override
    String toString() => 'Team must have at most 1 boss';
}

class ExceededUniqueGoldLimitException implements Exception {
  @override
    String toString() => 'Team must not have repeated gold krosmasters';
}

class ExceededUniqueWhiteLimitException implements Exception {
  @override
    String toString() => 'Team must have at most 2 repeated white krosmasters';
}

class ExceededUniqueBlackLimitException implements Exception {
  @override
    String toString() => 'Team must have at most 3 repeated black krosmasters';
}

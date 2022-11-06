import 'package:kros6/backend/teams/team.dart';
import 'package:kros6/backend/krosmasters/krosmaster.dart';

class CreateTeam {
  Team execute(List<Krosmaster> krosmasters) {
    var ggs = krosmasters.fold<num>(0, (ggs, krosmaster) {
      return ggs + krosmaster.level;
    });

    if (ggs != 12) {
      throw GGException();
    }

    if (krosmasters.length < 3) {
      throw MissedKrosmasterException();
    }

    if (krosmasters.length > 7) {
      throw ExceededKrosmasterException();
    }

    final bosses = krosmasters.where((krosmaster) => krosmaster.isBoss).length;

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
      } else {
        map[krosmaster.id]++;
      }

      final count = map[krosmaster.id];

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

class MissedKrosmasterException implements Exception {
  @override
  String toString() => 'Team must have at minimum 3 krosmasters';
}

class ExceededKrosmasterException implements Exception {
  @override
  String toString() => 'Team must have at most 7 krosmasters';
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

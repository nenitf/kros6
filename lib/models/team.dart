import 'package:kros6/models/krosmaster.dart';

class Team {
  final List<Krosmaster> krosmasters;
  num initiative;

  Team({required this.krosmasters}): initiative = krosmasters.fold<num>(0, (acc, krosmaster) => acc + krosmaster.initiative);
}

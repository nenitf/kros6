import 'package:kros6/models/krosmaster.dart';

class Team {
  final List<Krosmaster> krosmasters;
  /* final String initiative; */

  Team({required this.krosmasters});

  num getInitiative() {
    return 10;
  }
}
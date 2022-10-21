enum Unique { gold, white, black }

class Krosmaster {
  final String id;
  final String name;
  final num level;
  final String appearance;
  final num initiative;
  final Unique unique;
  final bool isBoss;

  Krosmaster(
      {required this.id,
      required this.name,
      required this.level,
      required this.appearance,
      required this.initiative,
      required this.unique,
      required this.isBoss});
}

import 'package:kros6/backend/krosmasters/krosmaster.dart';

Krosmaster krosmaster(String key) {
  final kros = all[key];
  if (kros == null) {
    throw FixtureException("Krosmaster não encontrado");
  }
  return kros;
}

class FixtureException implements Exception {
  final String message;

  FixtureException(this.message);

  @override
  String toString() => "Fixture: $message";
}

final all = {
  "otomai": Krosmaster(
      id: "otomai",
      name: "Otomai",
      level: 6,
      appearance: "a",
      initiative: 0,
      unique: Unique.gold,
      isBoss: false),
  "gein": Krosmaster(
      id: "gein",
      name: "Gein",
      level: 6,
      appearance: "a",
      initiative: 12,
      unique: Unique.gold,
      isBoss: false),
  "thio": Krosmaster(
      id: "thio",
      name: "Thio",
      level: 4,
      appearance: "a",
      initiative: 10,
      unique: Unique.gold,
      isBoss: false),
  "elogio": Krosmaster(
      id: "elogio",
      name: "Elogio",
      level: 4,
      appearance: "a",
      initiative: 1,
      unique: Unique.gold,
      isBoss: false),
  "tofu real": Krosmaster(
      id: "tofu-real",
      name: "Tofu Real",
      level: 3,
      appearance: "a",
      initiative: 7,
      unique: Unique.gold,
      isBoss: true),
  "papatudo real": Krosmaster(
      id: "papatudo-real",
      name: "Papatudo Real",
      level: 3,
      appearance: "a",
      initiative: 1,
      unique: Unique.gold,
      isBoss: true),
  "gasper feyto": Krosmaster(
      id: "gasper-feyto",
      name: "Gasper Feyto",
      level: 3,
      appearance: "a",
      initiative: 3,
      unique: Unique.gold,
      isBoss: false),
  "deminobola": Krosmaster(
      id: "deminobola",
      name: "Deminobola",
      level: 3,
      appearance: "a",
      initiative: 7,
      unique: Unique.white,
      isBoss: false),
  "diver birel": Krosmaster(
      id: "diver-birel",
      name: "Diver Briel",
      level: 3,
      appearance: "a",
      initiative: 6,
      unique: Unique.white,
      isBoss: false),
  "riktus de brakmar": Krosmaster(
      id: "riktus-de-brakmar",
      name: "Riktus de Brakmar",
      level: 2,
      appearance: "a",
      initiative: 3,
      unique: Unique.black,
      isBoss: false),
  "jordy ritane": Krosmaster(
      id: "jordy-ritane",
      name: "Jordy Ritane",
      level: 2,
      appearance: "a",
      initiative: 0,
      unique: Unique.white,
      isBoss: false),
  "henual": Krosmaster(
      id: "henual",
      name: "Henual",
      level: 2,
      appearance: "a",
      initiative: 6,
      unique: Unique.white,
      isBoss: false),
  "barden tadura": Krosmaster(
      id: "barden-tadura",
      name: "Steamy Wonder ",
      level: 1,
      appearance: "a",
      initiative: 0,
      unique: Unique.gold,
      isBoss: false),
  "steamy wonder": Krosmaster(
      id: "steamy-wonder",
      name: "Steamy Wonder ",
      level: 1,
      appearance: "a",
      initiative: 0,
      unique: Unique.gold,
      isBoss: false),
  "jeyro rello": Krosmaster(
      id: "jeyro-rello",
      name: "Jeyro Rello",
      level: 1,
      appearance: "a",
      initiative: 0,
      unique: Unique.gold,
      isBoss: false),
  "poochan": Krosmaster(
      id: "poochan",
      name: "Poochan",
      level: 1,
      appearance: "a",
      initiative: 5,
      unique: Unique.gold,
      isBoss: false),
  "day kiri": Krosmaster(
      id: "day-kiri",
      name: "Day Kiri",
      level: 1,
      appearance: "a",
      initiative: 0,
      unique: Unique.gold,
      isBoss: false),
  "kivin": Krosmaster(
      id: "kivin",
      name: "kivin",
      level: 1,
      appearance: "a",
      initiative: 0,
      unique: Unique.white,
      isBoss: false),
  "wally faier": Krosmaster(
      id: "wally-faier",
      name: "Wally Faier",
      level: 1,
      appearance: "a",
      initiative: 4,
      unique: Unique.white,
      isBoss: false),
};

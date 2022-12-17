import 'package:kros6/backend/krosmasters/krosmaster.dart';

Krosmaster krosmaster(String key) {
  final kros = all.firstWhere((krosmaster) => key == krosmaster.name);
  return kros;
}

class FixtureException implements Exception {
  final String message;

  FixtureException(this.message);

  @override
  String toString() => "Fixture: $message";
}

Krosmaster lazy(
    String name, num level, num initiaitive, [String unique = "white", bool boss = false]) {
  final Unique uniqueType;
  switch (unique) {
    case "gold":
      {
        uniqueType = Unique.gold;
      }
      break;
    case "white":
      {
        uniqueType = Unique.white;
      }
      break;
    case "black":
      {
        uniqueType = Unique.black;
      }
      break;

    default:
      {
        uniqueType = Unique.white;
      }
  }

  return Krosmaster(
      id: name,
      name: name,
      level: level,
      appearance: "wip",
      initiative: initiaitive,
      unique: uniqueType,
      isBoss: boss);
}

final all = {
 lazy("Otomai", 6, 0, "gold", false),
 lazy("Gein", 6, 12, "gold", false),
 lazy("Thio", 4, 10, "gold", false),
 lazy("Elogio", 4, 1, "gold", false),
 lazy("Ary Saf", 5, 5, "gold", false),
 lazy("Tofu Real", 3, 7, "gold", true),
 lazy("Papatudo Real", 3, 1, "gold", true),
 lazy("Gasper Feyto", 3, 3, "gold", false),
 lazy("Deminobola", 3, 7, "white", false),
 lazy("Diver Birel", 3, 6, "white", false),
 lazy("Jordy Ritane", 2, 0, "white", false),
 lazy("Henual", 2, 6, "white", false),
 lazy("Barden Tadura", 1, 0, "gold", false),
 lazy("Steamy Wonder", 1, 0, "gold", false),
 lazy("Jeyro Rello", 1, 0, "gold", false),
 lazy("Poochan", 1, 5, "gold", false),
 lazy("Day Kiri", 1, 0, "gold", false),
 lazy("Kivin", 1, 0, "white", false),
 lazy("Wally Faier", 1, 4, "white", false),
 lazy("Ostron Doz", 2, 3),
 lazy("Rib ombar", 3, 4),
 lazy("Remington Smif", 5, 5, "gold"),
 lazy("Zorbalo Greg", 2, 4),
 lazy("Kreol Panikon", 3, 4),
 lazy("Dokdes Tyno", 5, 9, "gold"),
 lazy("Jems Blond", 4, 8),
 lazy("Gui Yermetel", 3, 7),
 lazy("Ben O Ripata", 4, 9, "gold"),
 lazy("Henual", 2, 6),
 lazy("Henual", 1, 3),
 lazy("Ayan", 2, 5),
 lazy("Srammy", 2, 9),
 lazy("Vigg Arysta", 3, 4),
 lazy("Ratweyra", 4, 4, "gold"),
 lazy("Koa Gular", 1, 6),
 lazy("Ana Tomya", 3, 9),
 lazy("Klor Ofila", 2, 4),
 lazy("Makum Bag", 4, 6),
 lazy("Sadida", 1, 2, "gold"),
 lazy("Quentin Flush", 1, 2),
 lazy("Dany Oshan", 4, 5),
 lazy("Naz Rael", 2, 3, "gold"),
 lazy("Percimol", 5, 2, "gold"),
 lazy("Shak Shaka", 5, 0, "gold"),
 lazy("Cavaleiro Gota", 3, 2, "gold"),
 lazy("Cavaleiro Chama", 3, 4, "gold"),
 lazy("Capitão Amakna", 6, 8, "gold", true),
 lazy("Merkator", 6, 7, "gold", true),
 lazy("Rei dos Papatudos", 3, 2, "gold"),
 lazy("Kanibola Jav", 2, 6),
 lazy("Ruel Stroud", 3, 6, "gold"),
 lazy("Tristepan", 3, 3, "gold"),
 lazy("Luk Ylook", 2, 6, "gold"),
 lazy("Rainha dos Tofus", 3, 8, "gold"),
 lazy("Yugo", 3, 7, "gold"),
 lazy("Conde Frigost", 6, 6, "gold"),
 lazy("Gultar O Bárbaro", 6, 5, "gold"),
 lazy("Lumino", 2, 6, "black"),
 lazy("Korvox", 2, 4, "black"),
 lazy("Skalo", 2, 4, "black"),
 lazy("Frondor", 2, 4, "black"),
 lazy("Skoria", 2, 4, "black"),
 lazy("Sombra", 2, 4, "black"),
 lazy("Raul Bek", 3, 8),
 lazy("Katsou Mee", 3, 2),
 lazy("Kitty Rage", 5, 5),
 lazy("Emma Sacre", 4, 0, "gold"),
 lazy("Bade Barjosa", 3, 3),
 lazy("Mercedes Ligga", 4, 4),
 lazy("Assai Dahy", 4, 8),
 lazy("Pandaysa", 3, 5),
 lazy("Mali Buh", 5, 5),
 lazy("Poochan", 1, 5),
 lazy("Elgward Haporta", 2, 4),
 lazy("Duque Rex", 5, 7),
 lazy("Adamai", 3, 7, "gold"),
 lazy("Qilby", 6, 6, "gold"),
 lazy("Riktus de Brakmar", 2, 3, "black"),
 lazy("Riktus de Amakna", 2, 3, "black"),
 lazy("Riktus de Bonta", 2, 3, "black"),
 lazy("Riktus de Elite", 4, 6),
 lazy("Conde Transparent", 6, 8, "gold"),
 lazy("Rainha dos Ladrões", 4, 8, "gold"),
 lazy("Grampy", 4, 4, "gold"),
 lazy("Kerub Crepin", 4, 9, "gold"),
 lazy("Joris", 2, 8, "gold"),
 lazy("Lou", 2, 2, "gold"),
 lazy("Kanibola Arqueiro", 1, 1),
 lazy("Kanibola Sarbak", 1, 5),
 lazy("Kanibola Thierry", 2, 2, "gold"),
 lazy("Kanibola Phora", 3, 7, "gold"),
 lazy("Moon", 5, 1, "gold"),
 lazy("Dragoeth o Pensador", 2, 5),
 lazy("Dralegre a Contente", 3, 5),
 lazy("Dragosa", 4, 5),
 lazy("Omanetta", 2, 2),
 lazy("Boomba", 1, 3, "gold"),
 lazy("Minotoror", 4, 7, "gold"),
 lazy("Grougaloragran", 1, 2, "gold"),
 lazy("Gultar", 6, 7, "gold"),
 lazy("Diaul", 1, 4, "gold"),
 lazy("Katar", 6, 9, "gold"),
 lazy("Vampyro", 5, 8, "gold", true),
 lazy("Corvo Negro", 4, 4, "gold"),
 lazy("Kriss o Krasso", 3, 7, "gold"),
 lazy("Vlad Sombrio", 2, 7, "gold"),
 lazy("Darkli Moon", 2, 6, "gold"),
 lazy("Ogres criança", 1, 5, "gold"),
 lazy("Choppy Sue", 3, 1, "gold"),
 lazy("Tiktokovitch", 3, 4, "gold"),
 lazy("Bakara", 4, 7, "gold"),
 lazy("Jahash", 4, 1, "gold", true),
 lazy("Lilota", 2, 2, "gold"),
 lazy("Julith", 4, 11, "gold"),
 lazy("Khan Karkass", 2, 6, "gold"),
 lazy("Miauvô protetor", 4, 6, "gold"),
 lazy("Marline", 2, 4, "gold"),
 lazy("Joris espadachim", 2, 4, "gold"),
 lazy("Chafer lanceiro", 1, 3, "black"),
 lazy("Abade Mente", 3, 5),
 lazy("Chafer de Infantaria", 1, 3),
 lazy("Padre Sombrio", 2, 5),
 lazy("Fraderrapada", 3, 5),
 lazy("Milimilobo", 1, 3),
 lazy("Dark Vlad Karnated", 3, 7, "gold"),
 lazy("Bwork Arqueiro", 1, 4),
 lazy("Groarg Gamel", 2, 6),
 lazy("Medor Thraki", 3, 6, "gold"),
 lazy("Ko-fang o Branco", 1, 2),
 lazy("Evangelyne", 3, 8, "gold"),
 lazy("Aly Zelo", 4, 3),
 lazy("Amália", 3, 3, "gold"),
 lazy("Kip Agau", 3, 2, "gold"),
 lazy("Merty Olat", 3, 5),
 lazy("Nox", 6, 10),
 lazy("Missiz Frizz", 6, 8),
};

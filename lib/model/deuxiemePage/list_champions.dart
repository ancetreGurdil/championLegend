import 'package:championlegends/model/deuxiemePage/champion_standalone.dart';

class ListChampion {
   final Map<String,ChampionStandAlone> champion;

  const ListChampion({
    required this.champion,
  });

  factory ListChampion.fromJson(Map<String, dynamic> json) {
    return ListChampion(
      champion: json.map((key, value) => MapEntry(key, ChampionStandAlone.fromJson(value)))
    );
  }
}
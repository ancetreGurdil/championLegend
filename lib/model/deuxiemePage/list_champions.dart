import 'package:championlegends/model/deuxiemePage/champion_standalone.dart';

class ListChampionTamere {
   final Map<String,ChampionStandAlone> champion;

  const ListChampionTamere({
    required this.champion,
  });

  factory ListChampionTamere.fromJson(Map<String, dynamic> json) {
    return ListChampionTamere(
      champion: json.map((key, value) => MapEntry(key, ChampionStandAlone.fromJson(value)))
    );
  }
}
import 'package:championlegends/model/premierePage/champion.dart';

class ListChampion {
   final Map<String,Champion> champions;

  const ListChampion({
    required this.champions,
  });

  factory ListChampion.fromJson(Map<String, dynamic> json) {
    return ListChampion(
      champions: json.map((key, value) => MapEntry(key, Champion.fromJson(value)))
    );
  }
}

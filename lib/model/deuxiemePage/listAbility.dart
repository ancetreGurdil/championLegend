import 'package:championlegends/model/deuxiemePage/ability.dart';

class ListAbility {
   final Map<String,Ability> ability;

  const ListAbility({
    required this.ability,
  });

  factory ListAbility.fromJson(Map<String, dynamic> json) {
    return ListAbility(
      ability: json.map((key, value) => MapEntry(key, Ability.fromJson(value)))
    );
  }
}
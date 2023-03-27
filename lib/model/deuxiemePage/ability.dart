import 'package:championlegends/model/deuxiemePage/image.dart';

class Ability {
  final String id;
  final String name;
  final String description;
  final String tooltip;
  final Object leveltip;
  final int maxrank;
  final List cooldown;
  final String cooldownBurn;
  final List cost;
  final String costBurn;
  final Object datavalues;
  final List effect;
  final List effectburn;
  final List vars;
  final String costType;
  final String maxammo;
  final List range;
  final String rangeBurn;
  final Image image;
  final String ressource;

  const Ability({
    required this.id,
    required this.name,
    required this.description,
    required this.tooltip,
    required this.leveltip,
    required this.maxrank,
    required this.cooldown,
    required this.cooldownBurn,
    required this.cost,
    required this.costBurn,
    required this.datavalues,
    required this.effect,
    required this.effectburn,
    required this.vars,
    required this.costType,
    required this.maxammo,
    required this.range,
    required this.rangeBurn,
    required this.image,
    required this.ressource,
  });


factory Ability.fromJson(Map<String,dynamic> json){
    return Ability(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      tooltip: json['tooltip'],
      leveltip: json['leveltip'],
      maxrank: json['maxrank'],
      cooldown: json['cooldown'],
      cooldownBurn: json['cooldownBurn'],
      cost: json['cost'],
      costBurn: json['costBurn'],
      datavalues: json['datavalues'],
      effect: json['effect'],
      effectburn: json['effectburn'],
      vars: json['vars'],
      costType: json['costType'],
      maxammo: json['maxammo'],
      range: json['range'],
      rangeBurn: json['rangeBurn'],
      image: Image.fromJson(json['image']),
      ressource: json['ressource'],
    );
  }
}
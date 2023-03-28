import 'package:championlegends/model/deuxiemePage/ability.dart';
import 'package:championlegends/model/deuxiemePage/image.dart';
import 'package:championlegends/model/deuxiemePage/listAbility.dart';
import 'package:championlegends/model/deuxiemePage/passive.dart';

class ChampionStandAlone {
  final String id;
  final String key;
  final String name;
  final String title;
  final Image image;
  final List skins;
  final String lore;
  final String blurb;
  final List allytips;
  final List enemytips;
  final List tags;
  final String partype;
  final Object info;
  final Object stats;
  final ListAbility spells;
  final Passive passive;
  final List recommended;

  const ChampionStandAlone({
    required this.id,
    required this.key,
    required this.name,
    required this.title,
    required this.image,
    required this.skins,
    required this.lore,
    required this.blurb,
    required this.allytips,
    required this.enemytips,
    required this.tags,
    required this.partype,
    required this.info,
    required this.stats,
    required this.spells,
    required this.passive,
    required this.recommended,
  });

  factory ChampionStandAlone.fromJson(Map<String, dynamic> json) {
    return ChampionStandAlone(
      id: json['id'],
      key: json['key'],
      name: json['name'],
      title: json['title'],
      image: Image.fromJson(json['image']),
      skins: json['skins'],
      lore: json['lore'],
      blurb: json['blurb'],
      allytips: json['allytips'],
      enemytips: json['enemytips'],
      tags: json['tags'],
      partype: json['partype'],
      info: json['info'],
      stats: json['stats'],
      spells: ListAbility.fromJson(json['spells']),
      passive: Passive.fromJson(json['passive']),
      recommended: json['recommended'],
    );
  }
}
class Champion{
  final String version;
  final String id;
  final String key;
  final String name;
  final String title;
  final String blurb;
  final  Object info;
  final Object image;
  final List tags;
  final String partype;
  final Object stats;

  const Champion({  
    required this.version,
    required this.id,
    required this.key,
    required this.name,
    required this.title,
    required this.blurb,
    required this.info,
    required this.image,
    required this.tags,
    required this.partype,
    required this.stats
  });
  

  // ignore: avoid_types_as_parameter_names
  factory Champion.fromJson(Map<String, dynamic> json) {
    return Champion(
      version: json['version'],
      id: json['id'],
      key: json['key'],
      name: json['name'],
      title: json['title'],
      blurb: json['blurb'],
      info: json['info'],
      image: json['image'],
      tags: json['tags'],
      partype: json['partype'],
      stats: json['stats'],
    );
  }
}
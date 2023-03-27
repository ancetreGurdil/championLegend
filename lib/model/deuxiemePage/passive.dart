import 'package:championlegends/model/deuxiemePage/image.dart';

class Passive {
  final String name;
  final String description;
  final Image image;

  const Passive({
    required this.name,
    required this.description,
    required this.image
  });

  factory Passive.fromJson(Map<String,dynamic> json){
    return Passive(
      name: json['name'], 
      description: json['description'],
      image: Image.fromJson(json['image']),
      );
  }
}
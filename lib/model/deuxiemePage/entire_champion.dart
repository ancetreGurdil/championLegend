import 'package:championlegends/model/deuxiemePage/list_champions.dart';

class Entire {
  final String type;
  final String format;
  final String version;
  final ListChampion data;

  const Entire({
    required this.type,
    required this.format,
    required this.version,
    required this.data
  });

  factory Entire.fromJson(Map<String,dynamic> json){
    return Entire(
      type: json['type'],
      format: json['format'],
      version: json['version'],
      data: ListChampion.fromJson(json['data'])    );
  }
}
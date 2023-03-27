import 'package:championlegends/model/premierePage/list_champion.dart';

class AllChampion {  
  final String type;
  final String format;
  final String version;
  final ListChampion data;

  const AllChampion({
    required this.type,
    required this.format,
    required this.version,
    required this.data
  });

  factory AllChampion.fromJson(Map<String, dynamic> json) {
    return AllChampion(
      type: json['type'],
      format: json['format'],
      version: json['version'],
      data: ListChampion.fromJson(json['data'])
    );
  }
  
}
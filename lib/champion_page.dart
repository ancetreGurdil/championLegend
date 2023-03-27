import 'dart:convert';
import 'dart:developer';
import 'package:championlegends/model/deuxiemePage/entire_champion.dart';
import 'package:http/http.dart' as http;
import 'package:championlegends/model/premierePage/champion.dart';
import 'package:flutter/material.dart';



Future<Entire> fetchEntire() async {
  final response = await http.get(Uri.parse('http://ddragon.leagueoflegends.com/cdn/13.6.1/data/fr_FR/champion/Aatrox.json'));
  if (response.statusCode == 200) {
    return Entire.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load all Champions');
  }
}

class ChampionPage extends StatefulWidget {
  const ChampionPage({super.key, required this.champion});

  final Champion champion;

  @override
  // ignore: library_private_types_in_public_api
  _ChampionPageState createState() => _ChampionPageState();
}

class _ChampionPageState extends State<ChampionPage> {

	 late Future<Entire> futureEntire;
  @override
  void initState() {
    super.initState();
    futureEntire = fetchEntire();
  }

/* final Future _champion =  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 2000,
        height: 2000,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              'http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${widget.champion.id}_0.jpg'
            )
          )
        ),
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<Entire>(
          future: futureEntire,
          builder: (context, snapshot) {
            log(widget.champion.name);
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.hasData) {
              List<Widget> children = [];
              snapshot.data?.data.champion.values.forEach((champ) {
                children.add(
                  Row(
                    children: [
                      Container(
                        height: 400,
                        width: 550,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Color.fromRGBO(200, 170, 110, 1), width: 4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start, // Aligner les conteneurs en haut
                          children: [
                            Align(
                              alignment: Alignment.topLeft, // Aligner les conteneurs au centre horizontalement
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  border: Border.all(color: const Color.fromRGBO(200, 170, 110, 1), width: 3),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft, // Aligner les conteneurs au centre horizontalement
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  border: Border.all(color: const Color.fromRGBO(200, 170, 110, 1), width: 3),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft, // Aligner les conteneurs au centre horizontalement
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  border: Border.all(color: const Color.fromRGBO(200, 170, 110, 1), width: 3),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft, // Aligner les conteneurs au centre horizontalement
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  border: Border.all(color: const Color.fromRGBO(200, 170, 110, 1), width: 3),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft, // Aligner les conteneurs au centre horizontalement
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage('http://ddragon.leagueoflegends.com/cdn/13.6.1/img/spell/${champ.passive.image.full}')),
                                  border: Border.all(color: const Color.fromRGBO(200, 170, 110, 1), width: 3),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]
                  ),
                );
              });
              return Row(
                children: children
                /* children: children, */
              );
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

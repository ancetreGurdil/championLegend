import 'dart:convert';
import 'package:championlegends/champion_page.dart';
import 'package:championlegends/model/all_champion.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future <AllChampion> fetchChampion() async  {
  final response =  await http.get(Uri.parse('http://ddragon.leagueoflegends.com/cdn/13.5.1/data/fr_FR/champion.json')) ;
  if (response.statusCode == 200) {
    return AllChampion.fromJson(jsonDecode(response.body));
  }else{
    throw Exception('Failed to load all Champions');
  }
}

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CHAMPION LEAGUE',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<AllChampion> futureAllChampion;
  @override
    void initState() {
    super.initState();
    futureAllChampion = fetchChampion();
    
    } 
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
                    padding: const EdgeInsets.all(8),
                    child: 
                      FutureBuilder<AllChampion>(
                        future: futureAllChampion,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<Widget> children = [];
                            snapshot.data?.data.champions.values.forEach((champion) {
                              children.add(
                                InkResponse(
                                    containedInkWell: true,
                                    onTap: () => {
                                      Navigator.push(context,
                                        MaterialPageRoute<void>(
                                          builder:(BuildContext context) { 
                                            return const ChampionPage();
                                          }
                                        )
                                      )
                                                              },
                                    child: Column(
                                      children: [
                                        Image.network('http://ddragon.leagueoflegends.com/cdn/img/champion/loading/${champion.id}_0.jpg'),
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(champion.name),
                                        )
                                      ]),
                                  ));
                            });

                            return GridView.count(
                              crossAxisCount: 3,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              childAspectRatio: 0.8,
                              children: children,
                              );
                          }
                          // By default, show a loading spinner.
                          return const CircularProgressIndicator();
                  },),
                  )
        // GridView.count(  
        //         crossAxisCount: 3,  
        //         crossAxisSpacing: 20.0,  
        //         mainAxisSpacing: 8.0,  
        //         children: <Widget>[
        //            Container(
        //             padding: const EdgeInsets.all(8),
        //             child: 
        //               Image.network('http://ddragon.leagueoflegends.com/cdn/img/champion/loading/Aatrox_0.jpg')
        //           ),
        //           Container(
        //              padding: const EdgeInsets.all(8),
        //              child: 
        //               Image.network('http://ddragon.leagueoflegends.com/cdn/img/champion/loading/Aatrox_0.jpg')
        //           ),
        //           Container(
        //              padding: const EdgeInsets.all(8),
        //              child: 
        //               Image.network('http://ddragon.leagueoflegends.com/cdn/img/champion/loading/Aatrox_0.jpg')
        //           ),
        //           Container(
        //              padding: const EdgeInsets.all(8),
        //              child: 
        //               Image.network('http://ddragon.leagueoflegends.com/cdn/img/champion/loading/Aatrox_0.jpg')
        //           ),Container(
        //              padding: const EdgeInsets.all(8),
        //              child: 
        //               Image.network('http://ddragon.leagueoflegends.com/cdn/img/champion/loading/Aatrox_0.jpg')
        //           ),
        //         ],
        // )
    );
  }
}
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_examen1/components/video_hero.dart';
import 'package:flutter_examen1/pages/regions_page.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 80, 112, 125)),
              child: ListTile(
                title: Text(
                  " France Data",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'RobotoMono'),
                ),
                subtitle: Text(
                  "Atlas de Données Françaises",
                  style: TextStyle(
                      color: Color.fromARGB(255, 219, 214, 214),
                      fontFamily: 'RobotoMono'),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Accueil'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.map,
              ),
              title: const Text('Régions'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
              ),
              title: const Text('Paramètres'),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: ListView(
        // agencement des sections du body en colonne
        children: <Widget>[
          Container(
            margin: EdgeInsets.zero,
            child: const VideoHero(),
          ),
          Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'I.Nos Régions',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 244, 241, 241)),
                    ),
                  )),
              Container(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: Svg(
                        'assets/img/france.svg',
                      ),
                    ),
                  ),
                  child: const Text(
                      '''Lorem Ipsum is simply dummy text of the printing and Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industryLorem Ipsum is simply dummy text of the printing and typesLorem Ipsum is simply dummy text of the printing and typesetting industry''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 18,
                      )))
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(50, 40, 50, 0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const RegionPage(title: "Recherche par Region")),
                );
              },
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(250, 40)),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search, color: Colors.blueAccent),
                  SizedBox(width: 5),
                  Text("Rechercher Par Région",
                      style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

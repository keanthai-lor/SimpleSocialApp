import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:flutter/painting.dart' as p;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    'assets/images/cambodia1.jpeg',
    'assets/images/norway1.jpeg',
    'assets/images/sweden1.webp',
    'assets/images/turkey1.jpeg',
  ];
  int index = 0;
  List<PaletteColor> dyColor = [];

  @override
  void initState() {
    super.initState();
    addColor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: dyColor.isEmpty ? Colors.black : dyColor[index].color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: dyColor.isEmpty ? Colors.black : dyColor[index].color.withOpacity(0.8),
            child: PageView(
              onPageChanged: (index){
                setState(() {
                  this.index = index;
                });
              },
              children: images.map((image) => Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              )).toList(),
            ),
          ),
          const Center(
            child: Text(
              'Best Places to Visit',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(25.0),
            alignment: Alignment.center,
            child: const Text(
              '''    With a world full of fascinating destinations, choosing the perfect vacation spot can present a challenge. That\'s why U.S. News used expert opinions, reader votes and current trends – and evaluated sights, cultures, scenic beauty, food scenes and more – to compile this list of the world\'s best places to visit.''',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addColor() async {
    for (String image in images) {
      final PaletteGenerator pg = await PaletteGenerator.fromImageProvider(
        AssetImage(image),
        size: const Size(200,200));
      setState(() {
        dyColor.add(pg.darkVibrantColor ?? PaletteColor(Colors.white, 2));
      });
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class TripPage extends StatefulWidget {
  const TripPage({Key? key}) : super(key: key);

  @override
  _TripPageState createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  final List<String> titles = [
    'Angkor Wat',
    'Royal Palace',
    'Koh Rong Samloem',
    'Sea Forest',
    'Bamboo Train',
    'Knong Psa',
    'Phnom Kulen',
    'Grape Farm',
  ];
  final List<Widget> images = [
    Image.asset('assets/images/angkorwat.jpeg',fit: BoxFit.cover),
    Image.asset('assets/images/royalpalace.jpeg',fit: BoxFit.cover),
    Image.asset('assets/images/kohrongsamloem.jpeg',fit: BoxFit.cover),
    Image.asset('assets/images/seaforest.jpeg',fit: BoxFit.cover),
    Image.asset('assets/images/bambootrain.jpeg',fit: BoxFit.cover),
    Image.asset('assets/images/knongpsa.jpeg',fit: BoxFit.cover),
    Image.asset('assets/images/pnhomkulen.jpeg',fit: BoxFit.cover),
    Image.asset('assets/images/banangrapefarm.jpeg',fit: BoxFit.cover),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.5),
      ),
      child: Column(
        children: [
          Expanded(
            child: Card(
              child: VerticalCardPager(
                titles: titles,
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10.0,
                ),
                images: images,
                onPageChanged: (page){},
                onSelectedItem: (index){},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

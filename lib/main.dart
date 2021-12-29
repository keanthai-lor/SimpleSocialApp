import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:demo/trip_page.dart';
import 'package:demo/favorite_page.dart';
import 'package:demo/home_page.dart';
import 'package:demo/personal_page.dart';
import 'package:demo/setting_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Demo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController _pageController;
  int page = 0;
  List<Widget> pages = const [
    HomePage(),
    TripPage(),
    FavoritePage(),
    SettingPage(),
    PersonalPage(),
  ];
  List<String> titles = [
    'Home',
    'Trip',
    'Favorite',
    'Setting',
    'Personal',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[page]),
        backgroundColor: (page == 1 || page == 3)
            ? Colors.green
            : Colors.orange,
      ),
      body: pages[page],
      bottomNavigationBar: CurvedNavigationBar(
        items: const [
          Icon(Icons.home,size: 30),
          Icon(Icons.airplanemode_active,size: 30),
          Icon(Icons.favorite,size: 30),
          Icon(Icons.build,size: 30),
          Icon(Icons.person,size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.orange,
        backgroundColor: Colors.green,
        animationCurve: Curves.easeIn,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index){
          setState(() {
            page = index;
          });
        },
      ),
    );
  }

}

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<Model> items = [
    Model(false, 'Hot Pot'),
    Model(false, 'Barbecue'),
    Model(false, 'Malatang'),
    Model(false, 'Pizza'),
    Model(false, 'Burger'),
    Model(false, 'Oolong Tea Machiato'),
    Model(false, 'Buffet',),
    Model(false, 'Steak'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.5),
      ),
      child: ReorderableListView(
        onReorder: reorderData,
        children: [
          for (final item in items)
            Card(
              //color: Colors.white,
              key: ValueKey(item),
              elevation: 2,
              child: ListTile(
                title: Text(
                  item.text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: GestureDetector(
                  onTap: () {
                    setState(() {
                      item.isSelected = !item.isSelected;
                    });
                  },
                  child: item.isSelected
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite_border,
                          color: Colors.orange,
                        ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void reorderData(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final item = items.removeAt(oldIndex);
      items.insert(newIndex, item);
    });
  }

  void sorting() {
    setState(() {
      items.sort();
    });
  }
}

class Model{
  bool isSelected;
  final String text;

  Model(this.isSelected, this.text);
}

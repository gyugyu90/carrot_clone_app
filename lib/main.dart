import 'package:carrot_clone_app/components/home_feed_list_item.dart';
import 'package:carrot_clone_app/data/example_feeds.dart';
import 'package:carrot_clone_app/screens/home_screen.dart';
import 'package:carrot_clone_app/screens/sell_my_goods_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CarrotCloneApp());
}

class CarrotCloneApp extends StatelessWidget {
  const CarrotCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

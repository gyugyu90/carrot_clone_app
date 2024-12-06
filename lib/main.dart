import 'package:flutter/material.dart';

void main() {
  runApp(const CarrotCloneApp());
}

class CarrotCloneApp extends StatelessWidget {
  const CarrotCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            child: const Row(
              children: [
                Text(
                  '노량진제1동',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                Icon(
                  Icons.expand_more_sharp,
                  size: 30,
                ),
              ],
            ),
            onTap: () {
              debugPrint('TODO 동네 선택');
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                debugPrint('TODO 검색');
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                debugPrint('TODO 알림 조회');
              },
              icon: const Icon(
                Icons.notifications_outlined,
                size: 30,
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(color: Colors.amber),
          child: const Center(
            child: Text('Hello Body'),
          ),
        ),
      ),
    );
  }
}

import 'package:carrot_clone_app/components/home_feed_list_item.dart';
import 'package:carrot_clone_app/models/home_feed.dart';
import 'package:carrot_clone_app/screens/sell_my_goods_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _list = <HomeFeed>[];

  @override
  void initState() {
    super.initState();

    fetchHomeFeeds();
  }

  void fetchHomeFeeds() async {
    final db = FirebaseFirestore.instance;
    await db.collection("usedGood").get().then((event) {
      var list = <HomeFeed>[];
      for (var doc in event.docs) {
        var data = doc.data();
        final homeFeed = HomeFeed(
          id: doc.id,
          title: data['title'],
          price: data['price'],
          created: (data['created'] as Timestamp).toDate(),
          thumbnailImageUrl: 'placeholder.png',
          region: '노량진동',
          comments: 0,
          likes: 0,
        );

        list.add(homeFeed);
      }

      setState(() {
        _list.addAll(list);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView.separated(
        itemBuilder: (context, index) {
          var homeFeed = _list[index];
          return HomeFeedListItem(
            homeFeed: homeFeed,
          );
        },
        itemCount: _list.length,
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 0.25,
            indent: 10,
            endIndent: 10,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 255, 111, 15),
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        elevation: 1,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SellMyGoodsScreen(
              onSave: (homeFeed) {
                setState(() {
                  _list.add(homeFeed);
                });
              },
            ),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

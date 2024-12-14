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
          margin: const EdgeInsets.all(10),
          decoration:
              const BoxDecoration(color: Color.fromARGB(32, 255, 193, 7)),
          child: Row(
            children: [
              Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 0.5, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const Image(
                    image: AssetImage('assets/images/placeholder.png'),
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '접이식 원형 테이블, 가로 700 높이 720, 한 달 밖에 안 쓴 완전 새 제품입니다. 매우 튼튼해요!!!!!!!!!!!!!!!!!!',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '상도동 · 1주 전',
                      style: TextStyle(
                        color: Color.fromARGB(255, 64, 64, 64),
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      '10,000원',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 17,
                          child: Icon(
                            Icons.comment_outlined,
                            size: 15,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '2',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 100, 100, 100),
                          ),
                        ),
                        SizedBox(
                          width: 17,
                          child: Icon(
                            Icons.favorite_border_outlined,
                            size: 15,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '5',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 100, 100, 100),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

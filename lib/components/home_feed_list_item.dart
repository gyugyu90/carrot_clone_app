import 'package:flutter/material.dart';

class HomeFeedListItem extends StatelessWidget {
  const HomeFeedListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Stack(
        children: [
          Row(
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
                    Padding(
                      padding: EdgeInsets.only(right: 35.0),
                      child: Text(
                        '접이식 원형 테이블, 가로 700 높이 720, 한 달 밖에 안 쓴 완전 새 제품입니다. 매우 튼튼해요!!!!!!!!!!!!!!!!!!',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
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
          Positioned(
            top: 5,
            right: 5,
            child: GestureDetector(
              onTap: () {
                debugPrint('TODO 더보기');
              },
              child: const Icon(Icons.more_vert_sharp),
            ),
          )
        ],
      ),
    );
  }
}

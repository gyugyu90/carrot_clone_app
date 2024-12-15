import 'package:carrot_clone_app/extensions/date_time_extension.dart';
import 'package:carrot_clone_app/extensions/int_extension.dart';
import 'package:carrot_clone_app/models/home_feed.dart';
import 'package:flutter/material.dart';

class HomeFeedListItem extends StatelessWidget {
  const HomeFeedListItem({
    super.key,
    required this.homeFeed,
  });

  final HomeFeed homeFeed;

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
                  child: Image(
                    image: AssetImage(
                        'assets/images/${homeFeed.thumbnailImageUrl}'),
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 35.0),
                      child: Text(
                        homeFeed.title,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${homeFeed.region} · ${homeFeed.created.timeAgo()}',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 64, 64, 64),
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      '${homeFeed.price.withComma()}원',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(
                          width: 17,
                          child: Icon(
                            Icons.comment_outlined,
                            size: 15,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          homeFeed.comments.toString(),
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 100, 100, 100),
                          ),
                        ),
                        const SizedBox(
                          width: 17,
                          child: Icon(
                            Icons.favorite_border_outlined,
                            size: 15,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          homeFeed.likes.toString(),
                          style: const TextStyle(
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

import 'package:carrot_clone_app/extensions/int_extension.dart';

class HomeFeed {
  final String id;
  final String thumbnailImageUrl;
  final String title;
  final String region;
  final DateTime created;
  final int price;
  final int comments;
  final int likes;

  HomeFeed({
    required this.id,
    required this.thumbnailImageUrl,
    required this.title,
    required this.region,
    required this.created,
    required this.price,
    required this.comments,
    required this.likes,
  });

  String get displayPrice => price > 0 ? '${price.withComma()}원' : '나눔 🧡';
}

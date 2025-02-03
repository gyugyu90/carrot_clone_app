import 'package:carrot_clone_app/models/goods_image.dart';
import 'package:flutter/material.dart';

class GoodsImageListView extends StatelessWidget {
  const GoodsImageListView({
    super.key,
    required this.images,
  });

  final List<GoodsImage> images;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return index == 0
              ? const AddImageButton()
              : GoodsImageBox(
                  image: images[index - 1],
                  main: index == 1,
                );
        },
        scrollDirection: Axis.horizontal,
        itemCount: images.length + 1,
      ),
    );
  }
}

class GoodsImageBox extends StatelessWidget {
  const GoodsImageBox({
    super.key,
    required this.image,
    required this.main,
  });

  final GoodsImage image;
  final bool main;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
          decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.grey),
            borderRadius: BorderRadius.circular(3),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: Image.asset(
              'assets/images/${image.localImagePath}',
            ),
          ),
        ),
        Positioned(
          right: 5,
          child: SizedBox(
            width: 15,
            height: 15,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.close),
              iconSize: 12,
              color: Colors.white,
              padding: EdgeInsets.zero,
              style: IconButton.styleFrom(
                backgroundColor: Colors.black,
              ),
            ),
          ),
        ),
        if (main)
          Positioned(
            bottom: 5,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(3))),
              width: 60,
              child: const Text(
                '대표 사진',
                style: TextStyle(color: Colors.white, fontSize: 10),
                textAlign: TextAlign.center,
              ),
            ),
          )
      ],
    );
  }
}

class AddImageButton extends StatelessWidget {
  const AddImageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      margin: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Colors.grey),
        borderRadius: BorderRadius.circular(3),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.photo_camera,
            color: Colors.grey,
            size: 24,
          ),
          Text(
            "0/10",
            style: TextStyle(
              fontSize: 11,
              color: Colors.black54,
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:io';

import 'package:carrot_clone_app/models/goods_image.dart';
import 'package:flutter/material.dart';

class GoodsImageListView extends StatelessWidget {
  const GoodsImageListView({
    super.key,
    required this.images,
    required this.onAddImage,
    required this.onDeleteImage,
  });

  final List<GoodsImage> images;
  final void Function() onAddImage;
  final void Function(GoodsImage image) onDeleteImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return index == 0
              ? AddImageButton(
                  onAddImage: onAddImage,
                  imageCount: images.length,
                )
              : GoodsImageBox(
                  image: images[index - 1],
                  main: index == 1,
                  onTapDelete: () => onDeleteImage(images[index - 1]),
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
    required this.onTapDelete,
  });

  final GoodsImage image;
  final bool main;
  final void Function() onTapDelete;

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
            child: Image.file(
              File(image.localImagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          right: 5,
          child: SizedBox(
            width: 15,
            height: 15,
            child: IconButton(
              onPressed: onTapDelete,
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
    required this.onAddImage,
    required this.imageCount,
  });

  final void Function() onAddImage;
  final int imageCount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onAddImage,
      child: Container(
        width: 60,
        margin: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.grey),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.photo_camera,
              color: Colors.grey,
              size: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  imageCount.toString(),
                  style: TextStyle(
                    fontSize: 11,
                    color: imageCount == 0
                        ? Colors.black54
                        : Theme.of(context).colorScheme.primary,
                  ),
                ),
                const Text(
                  "/10",
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black54,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

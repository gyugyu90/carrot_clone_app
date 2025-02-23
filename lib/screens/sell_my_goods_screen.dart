import 'dart:io';

import 'package:carrot_clone_app/components/goods_image_list_view.dart';
import 'package:carrot_clone_app/models/goods_image.dart';
import 'package:carrot_clone_app/models/home_feed.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class SellMyGoodsScreen extends StatefulWidget {
  const SellMyGoodsScreen({
    super.key,
    required this.onSave,
  });

  final void Function(HomeFeed homeFeed) onSave;

  @override
  State<SellMyGoodsScreen> createState() => _SellMyGoodsScreenState();
}

class _SellMyGoodsScreenState extends State<SellMyGoodsScreen> {
  final _titleTextEditingController = TextEditingController();
  final _priceTextEditingController = TextEditingController();
  final _descriptionTextEditingController = TextEditingController();

  final _images = <GoodsImage>[];

  @override
  void initState() {
    super.initState();

    debugPrint('_SellMyGoodsScreenState initState called');
  }

  @override
  void dispose() {
    super.dispose();

    debugPrint('_SellMyGoodsScreenState dispose called');

    _titleTextEditingController.dispose();
    _priceTextEditingController.dispose();
    _descriptionTextEditingController.dispose();
  }

  var tempSaveButtonColor = Colors.grey;

  void _pickAndUploadImage() async {
    debugPrint('_pickAndUploadImage');

    var imagePicker = ImagePicker();
    var files = await imagePicker.pickMultiImage(imageQuality: 50, limit: 10);

    final storageRef = FirebaseStorage.instance.ref();
    final imagesRef = storageRef.child('images');

    for (var file in files) {
      setState(() {
        _images.add(GoodsImage(
          localImagePath: file.path,
          remoteImageUrl: null,
        ));
      });
    }

    for (var file in files) {
      final uuid = const Uuid().v8();
      final fileExtension = file.name.split('.').last;
      imagesRef
          .child('$uuid.$fileExtension')
          .putFile(File(file.path))
          .then((task) async {
        final downloadUrl = await task.ref.getDownloadURL();
        _images.where((e) => e.localImagePath == file.path).forEach((e) {
          e.remoteImageUrl = downloadUrl;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '내 물건 팔기',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.1,
        shadowColor: Colors.black,
        leading: IconButton(
          onPressed: Navigator.of(context).pop, // tear-off
          icon: const Icon(Icons.close),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              '임시저장',
              style: TextStyle(
                color: tempSaveButtonColor,
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GoodsImageListView(
              images: _images,
              onAddImage: _pickAndUploadImage,
            ),
            const FormLabel('제목'),
            TextField(
              onChanged: (value) {
                setState(() {
                  tempSaveButtonColor =
                      value.isEmpty ? Colors.grey : Colors.orange;
                });
              },
              controller: _titleTextEditingController,
            ),
            const SizedBox(height: 30),
            const FormLabel('거래방식'),
            TextField(
              controller: _priceTextEditingController,
            ),
            const SizedBox(height: 30),
            const FormLabel('자세한 설명'),
            TextField(
              controller: _descriptionTextEditingController,
            ),
            const SizedBox(height: 30),
            FilledButton(
                onPressed: () {
                  final db = FirebaseFirestore.instance;

                  db.collection('usedGood').add({
                    'title': _titleTextEditingController.text,
                    'description': _descriptionTextEditingController.text,
                    'price': int.parse(_priceTextEditingController.text),
                    'created': DateTime.now(),
                  }).then(
                    (value) {
                      debugPrint('saved id:: ${value.id}');
                    },
                  );

                  Navigator.of(context).pop();
                },
                child: const Text('작성 완료'))
          ],
        ),
      ),
    );
  }
}

class FormLabel extends StatelessWidget {
  const FormLabel(
    this.labelText, {
    super.key,
  });

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Text(
      labelText,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );
  }
}

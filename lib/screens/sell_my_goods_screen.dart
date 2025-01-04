import 'package:carrot_clone_app/models/home_feed.dart';
import 'package:flutter/material.dart';

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
                  debugPrint('''content:
title: ${_titleTextEditingController.text},
price: ${_priceTextEditingController.text},
description: ${_descriptionTextEditingController.text}''');

                  final newFeed = HomeFeed(
                    id: 999,
                    thumbnailImageUrl: 'placeholder.png',
                    title: _titleTextEditingController.text,
                    region: '강남구',
                    created: DateTime.now(),
                    price: int.parse(_priceTextEditingController.text),
                    comments: 0,
                    likes: 0,
                  );

                  widget.onSave(newFeed);
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

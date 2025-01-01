import 'package:flutter/material.dart';

class SellMyGoodsScreen extends StatefulWidget {
  const SellMyGoodsScreen({super.key});

  @override
  State<SellMyGoodsScreen> createState() => _SellMyGoodsScreenState();
}

class _SellMyGoodsScreenState extends State<SellMyGoodsScreen> {
  @override
  void initState() {
    super.initState();

    debugPrint('_SellMyGoodsScreenState initState called');
  }

  @override
  void dispose() {
    super.dispose();

    debugPrint('_SellMyGoodsScreenState dispose called');
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
                // debugPrint('TextField.onChanged $value');
                setState(() {
                  tempSaveButtonColor =
                      value.isEmpty ? Colors.grey : Colors.orange;
                });
              },
            ),
            const SizedBox(height: 30),
            const FormLabel('거래방식'),
            const TextField(),
            const SizedBox(height: 30),
            const FormLabel('자세한 설명'),
            const TextField(),
            const SizedBox(height: 30),
            FilledButton(onPressed: () {}, child: const Text('작성 완료'))
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

import 'package:flutter/material.dart';
import 'package:flutter_mvvm/models/article_model.dart';
import 'package:provider/provider.dart';

class ArticleViewScreen extends StatelessWidget {
  const ArticleViewScreen({Key? key, required this.title, required this.body})
      : super(key: key);

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              body,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}

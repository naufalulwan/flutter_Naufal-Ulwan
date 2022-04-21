import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm/providers/article_provider.dart';
import 'package:provider/provider.dart';

import 'article_view_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Article'),
      ),
      body: Consumer<ArticleProvider>(
        builder: ((context, articles, _) {
          Future.delayed(Duration.zero, () {
            final _provider =
                Provider.of<ArticleProvider>(context, listen: false);
            _provider.getContactData();
          });
          if (articles.model.isEmpty) {
            return const Center(
              child: Text('Tidak ada data yang tersedia'),
            );
          } else {
            return ListView.builder(
              itemCount: articles.model.length,
              itemBuilder: (context, index) {
                final article = articles.model[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticleViewScreen(
                          title: articles.model[index].title!,
                          body: articles.model[index].body!,
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(article.title!),
                    subtitle: Text(article.body!),
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}

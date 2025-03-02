import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../model/blog_post.dart';

class BlogDetailPage extends StatelessWidget {
  final BlogPost post;

  const BlogDetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(post.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(post.imageUrl, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16),
              child: MarkdownBody(
                data: post.content,
                styleSheet: MarkdownStyleSheet(
                  h1: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  h2: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  h3: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  p: const TextStyle(fontSize: 16),
                  strong: const TextStyle(fontWeight: FontWeight.bold), // In đậm
                  listBullet: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

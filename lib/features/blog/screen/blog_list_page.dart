import 'package:flutter/material.dart';

import '../model/blog_post.dart';
import '../widget/blog_card.dart';

class BlogListPage extends StatelessWidget {
  final List<BlogPost> posts;

  const BlogListPage({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tất cả tin tức')),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return BlogCard(post: posts[index]);
        },
      ),
    );
  }
}

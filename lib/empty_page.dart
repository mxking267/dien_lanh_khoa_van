import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  final String title;

  const EmptyPage({super.key, this.title = "Đang cập nhật"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

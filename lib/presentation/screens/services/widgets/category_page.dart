import 'package:dien_lanh_khoa_van/core/constants/image_string.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  final String title;
  final String description;
  final List<String> services;

  const CategoryPage({
    super.key,
    required this.title,
    required this.description,
    required this.services,
  });

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.services.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            padding: EdgeInsets.only(bottom: 0),
            indicator: UnderlineTabIndicator(
              borderSide: const BorderSide(width: 2.0, color: Colors.blue),
              insets: EdgeInsets.symmetric(horizontal: 20),
            ),
            indicatorWeight: 8.0,
            tabAlignment: TabAlignment.start,
            tabs: widget.services
                .map((service) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Text(service, style: const TextStyle(fontSize: 16)),
            ))
                .toList(),
          ),
        Expanded(
          child: TabBarView(
            controller: _tabController, // Liên kết với TabController
            children: widget.services.map((service) {
              return Column(
                children: [
                  SizedBox(height: 40),
                  Image.asset(ImageString.iconCardboard, width: 80, height: 80),
                  const SizedBox(height: 16),
                  const Text(
                    "Rất tiếc, hiện tại chưa có dịch vụ nào.\n Bạn vui lòng thử lại sau nhé",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

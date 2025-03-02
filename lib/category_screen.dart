import 'package:flutter/material.dart';
import 'category_page.dart';
import 'category_item.dart';
import 'package:dien_lanh_khoa_van/utils/constants/image_string.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> categories = const [
    {
      "title": "Bảo trì",
      "icon": ImageString.iconMaintenance,
      "description": "Dịch vụ bảo trì và sửa chữa thiết bị gia dụng.",
      "services": [
        "Sửa tủ lạnh",
        "Sửa điều hoà",
        "Sửa máy giặt",
        "Sửa máy lạnh",
      ],
    },
    {
      "title": "Vệ sinh",
      "icon": ImageString.iconLaundry,
      "description": "Dịch vụ vệ sinh giúp thiết bị luôn sạch sẽ.",
      "services": [
        "Vệ sinh máy lạnh",
        "Vệ sinh máy giặt"
      ],
    },
    {
      "title": "Cho thuê",
      "icon": ImageString.iconTool,
      "description": "Dịch vụ cho thuê thiết bị tiện lợi.",
      "services": [
        "Cho thuê máy lạnh",
        "Cho thuê quạt hơi nước",
      ],
    }
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum:  EdgeInsets.only(top:30),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Danh mục dịch vụ"),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(90), // Điều chỉnh chiều cao TabBar
            child: Container(
              height: 90,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(categories.length, (index) {
                    return  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: CategoryItem(
                            icon: categories[index]["icon"],
                            title: categories[index]["title"],
                            description: categories[index]["description"],
                             onTap: () {
                        setState(() {
                        _tabController.index = index; // Chuyển tab
                        });
                        print("Clicked on ${categories[index]["title"]}");
                        // Thêm chức năng khác ở đây nếu cần
                        },),
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: categories.map((category) {
            return CategoryPage(
              title: category["title"],
              description: category["description"],
              services: category["services"],
            );
          }).toList(),
        ),
      ),
    );
  }
}

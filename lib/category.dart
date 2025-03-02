import 'package:dien_lanh_khoa_van/utils/constants/image_string.dart';
import 'package:flutter/material.dart';

import 'category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  final List<Map<String, dynamic>> categories = const [
    {
      "title": "Bảo trì",
      "icon": ImageString.iconMaintenance,
      "description": "Dịch vụ bảo trì và sửa chữa thiết bị gia dụng, đảm bảo hoạt động ổn định và kéo dài tuổi thọ sản phẩm."
    },
    {
      "title": "Bảo dưỡng",
      "icon": ImageString.iconAirConditioner,
      "description": "Dịch vụ bảo trì và sửa chữa thiết bị gia dụng, đảm bảo hoạt động ổn định và kéo dài tuổi thọ sản phẩm."
    },
    {
      "title": "Vệ sinh",
      "icon": ImageString.iconLaundry,
      "description": "Dịch vụ vệ sinh chuyên nghiệp, giúp thiết bị và không gian sống luôn sạch sẽ, an toàn và hiệu quả."
    },
    {
      "title": "Cho thuê",
      "icon": ImageString.iconTool,
      "description": "Dịch vụ cho thuê thiết bị tiện lợi, phù hợp với nhu cầu sử dụng ngắn hạn và tiết kiệm chi phí."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryItem(
            icon: category['icon'],
            title: category['title'],
            description: category['description'],
            onTap: () {},
          );
        },
      ),
    );
  }
}
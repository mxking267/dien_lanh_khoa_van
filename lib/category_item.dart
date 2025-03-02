import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final VoidCallback? onTap; // Nhận sự kiện onTap

  const CategoryItem({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.onTap, // Gán giá trị onTap
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap, // Gọi hàm onTap từ bên ngoài
        borderRadius: BorderRadius.circular(10), // Bo góc khi nhấn
        splashColor: Colors.grey.withOpacity(0.3), // Hiệu ứng chạm
        highlightColor: Colors.grey[300], // Hiệu ứng giữ
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Image.asset(icon, width: 50, height: 50),
              const SizedBox(height: 6),
              Text(
                title,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

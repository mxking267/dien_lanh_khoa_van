import 'package:flutter/material.dart';
import 'package:dien_lanh_khoa_van/core/constants/image_string.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final List<String> _inactiveIcons = [
    ImageString.menuHome,
    ImageString.menuStore,
    ImageString.menuHistory,
    ImageString.menuUser,
  ];

  final List<String> _activeIcons = [
    ImageString.menuHomeActive,
    ImageString.menuStoreActive,
    ImageString.menuHistoryActive,
    ImageString.menuUserActive,
  ];

  final List<String> _labels = ["Trang chủ", "Cửa hàng", "Lịch sử", "Tài khoản"];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_labels.length + 1, (index) {
          // Thêm icon dấu cộng vào giữa
          if (index == 2) {
            return GestureDetector(
              onTap: () {
                widget.onTap(2);
              },
              child: Container(
                width: 56,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 32),
              ),
            );
          }

          // Điều chỉnh index của các item khác
          final adjustedIndex = index > 2 ? index - 1 : index;
          final isSelected = widget.currentIndex == index;

          return GestureDetector(
            onTap: () => widget.onTap(index),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12),

              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    isSelected ? _activeIcons[adjustedIndex] : _inactiveIcons[adjustedIndex],
                    width: 28,
                    height: 28
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _labels[adjustedIndex],
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

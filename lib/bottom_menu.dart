import 'package:dien_lanh_khoa_van/category_screen.dart';
import 'package:dien_lanh_khoa_van/features/account/page/account_page.dart';
import 'package:dien_lanh_khoa_van/home.dart';
import 'package:dien_lanh_khoa_van/utils/constants/image_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'empty_page.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      body: Stack(
        children: [
          // Nội dung chính
          Obx(() => controller.screens[controller.selectedIndex.value]),

          // Bottom Navigation Bar
          Positioned(
            bottom: 10, // Đẩy menu lên trên một chút
            left: 10,
            right: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // Bo góc
              child: Obx(
                    () => Theme(
                  data: Theme.of(context).copyWith(
                    splashFactory: NoSplash.splashFactory, // Loại bỏ hiệu ứng nhấn
                    highlightColor: Colors.transparent, // Loại bỏ hiệu ứng sáng khi chạm
                  ),
                  child: BottomAppBar(
                    color: Colors.white.withOpacity(0.9), // Làm mờ nhẹ
                    elevation: 0, // Xóa đổ bóng
                    child: BottomNavigationBar(
                      backgroundColor: Colors.transparent, // Để không che mất nội dung
                      type: BottomNavigationBarType.fixed,
                      elevation: 0, // Xóa đổ bóng
                      currentIndex: controller.selectedIndex.value,
                      onTap: (index) => controller.selectedIndex.value = index,
                      items: [
                        _buildNavItem(0, 'Trang chủ', ImageString.menuHome, ImageString.menuHomeActive, controller),
                        _buildNavItem(1, 'Dịch vụ', ImageString.menuStore, ImageString.menuStoreActive, controller),
                        _buildNavItem(2, 'Hoạt động', ImageString.menuHistory, ImageString.menuHistoryActive, controller),
                        _buildNavItem(3, 'Tài khoản', ImageString.menuUser, ImageString.menuUserActive, controller),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
      int index, String label, String icon, String activeIcon, NavigationController controller) {
    return BottomNavigationBarItem(
      icon: Obx(
            () => Image.asset(
          controller.selectedIndex.value == index ? activeIcon : icon,
          width: 22,
          height: 22,
        ),
      ),
      label: label,
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final List<Widget> screens = [
    HomeScreen(),
    CategoryScreen(),
    const EmptyPage(title: "Hoạt động đang cập nhật"),
    AccountPage()
  ];
}

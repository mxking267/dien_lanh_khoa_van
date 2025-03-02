import 'package:dien_lanh_khoa_van/utils/constants/image_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.blue,
      padding: EdgeInsets.only(top: 24),
      child: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(ImageString.iconMan, width: 40, height: 40),
              SizedBox(width: 8),
              Text(
                "Khoa văn",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(LucideIcons.bell, color: Colors.white),
            onPressed: () {
              print('Thông báo được nhấn');
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + MediaQueryData.fromWindow(WidgetsBinding.instance.window).padding.top);
}

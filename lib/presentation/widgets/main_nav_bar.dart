import 'package:flutter/material.dart';
import 'package:dien_lanh_khoa_van/core/constants/nav_const.dart';
import 'package:dien_lanh_khoa_van/core/constants/colors.dart';
import 'package:flutter_svg/svg.dart';

class CustomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  bool _isBottomSheetOpen = false;

  void _showBottomSheet() {
    setState(() => _isBottomSheetOpen = true);

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) =>
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            // Add your bottom sheet content here
            child: Center(child: Text('Bottom Sheet Content')),
          ),
    ).whenComplete(() {
      setState(() => _isBottomSheetOpen = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: NavConstants.navBarHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(5, (index) {
                if (index == 2) {
                  // Placeholder cho button giữa
                  return SizedBox(width: 72);
                }
                final navIndex = index > 2 ? index - 1 : index;
                final item = NavConstants.navItems[navIndex];

                return _buildNavItem(
                  index: navIndex,
                  item: item,
                  isActive: widget.currentIndex == navIndex,
                );
              }),
            ],
          ),
          // Center button
          GestureDetector(
            onTap: _showBottomSheet,
            child: Container(
              width: 72,
              height: 72,
              padding: EdgeInsets.all(10),
              child: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: ThemeColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 26,
                ),
              ),
            ),

          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required NavItem item,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: () => widget.onTap(index),
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              isActive ? item.icon.active : item.icon.inactive,
              width: NavConstants.iconSize,
              height: NavConstants.iconSize,
              colorFilter: ColorFilter.mode(
                isActive ? NavConstants.activeColor : NavConstants
                    .inactiveColor,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(height: 4),
            Text(
              item.label,
              style: TextStyle(
                fontSize: 12,
                color: isActive
                    ? NavConstants.activeColor
                    : NavConstants.inactiveColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
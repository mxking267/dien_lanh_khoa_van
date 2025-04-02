// lib/core/constants/nav_constants.dart

import 'dart:ui';
import 'package:dien_lanh_khoa_van/core/constants/colors.dart';
import 'nav_icon.dart';

class NavConstants {
  // Danh sách navigation items
  static const List<NavItem> navItems = [
    NavItem(
      icon: NavIcon(
        active: NavIcons.homeFilled,
        inactive: NavIcons.home,
      ),
      label: 'Trang chủ',
      route: '/home',
    ),
    NavItem(
      icon: NavIcon(
        active: NavIcons.serviceFilled,
        inactive: NavIcons.service,
      ),
      label: 'Dịch vụ',
      route: '/service',
    ),
    NavItem(
      icon: NavIcon(
        active: NavIcons.historyFilled,
        inactive: NavIcons.history,
      ),
      label: 'Lịch sử GD',
      route: '/history',
    ),
    NavItem(
      icon: NavIcon(
        active: NavIcons.profileFilled,
        inactive: NavIcons.profile,
      ),
      label: 'Cá nhân',
      route: '/profile',
    ),
  ];

  // Style
  static const double navBarHeight = 72.0;
  static const double iconSize = 26.0;
  static const Color activeColor = ThemeColors.primary; // Màu #0172FC
  static const Color inactiveColor = Color(0xFF9E9E9E);
}

class NavItem {
  final NavIcon icon;
  final String label;
  final String route;

  const NavItem({
    required this.icon,
    required this.label,
    required this.route,
  });
}

class NavIcon {
  final String active;
  final String inactive;

  const NavIcon({
    required this.active,
    required this.inactive,
  });
}
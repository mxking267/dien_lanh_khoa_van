import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum:  EdgeInsets.only(top:30),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cá nhân'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Tài khoản',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _buildContainer([
              _buildListItem(context, 'Thông tin cá nhân', '/profile'),
              _buildListItem(context, 'Sổ địa chỉ', '/address_book'),
              _buildListItem(context, 'Voucher của tôi', '/vouchers'),
            ]),
            const SizedBox(height: 16),
            const Text(
              'Hỗ trợ khách hàng',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _buildContainer([
              _buildListItem(context, 'Hotline: xxxxxx', null),
              _buildListItem(context, 'Fanpage', null),
            ]),
            const SizedBox(height: 32),
            Center(
              child: OutlinedButton.icon(
                onPressed: () {
                  // Xử lý đăng xuất
                },
                icon: const Icon(LucideIcons.log_out, color: Colors.red),
                label: const Text(
                  'Đăng xuất',
                  style: TextStyle(color: Colors.red),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.red), // Viền đỏ
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildListItem(BuildContext context, String title, String? route) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: route != null ? () => Navigator.pushNamed(context, route) : () {},
          splashColor: Colors.grey[300], // Màu hiệu ứng khi nhấn
          highlightColor: Colors.grey[100], // Màu sáng khi nhấn giữ
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: const TextStyle(fontSize: 16)),
                const Icon(LucideIcons.chevron_right, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

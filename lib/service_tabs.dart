import 'package:flutter/material.dart';
import 'package:dien_lanh_khoa_van/utils/constants/image_string.dart';

class ServiceTabs extends StatefulWidget {
  const ServiceTabs({super.key});

  @override
  _ServiceTabsState createState() => _ServiceTabsState();
}

class _ServiceTabsState extends State<ServiceTabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Dịch vụ đang xử lý',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Custom TabBar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(3, (index) => _buildTab(index)),
          ),
        ),
        const SizedBox(height: 12),

        // Nội dung của các tab
        Expanded(
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              EmptyServiceScreen(),
              EmptyServiceScreen(),
              EmptyServiceScreen(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTab(int index) {
    List<String> tabTitles = ["Bảo trì", "Vệ sinh", "Cho thuê"];
    bool isSelected = _tabController.index == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _tabController.index = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue[50] : Colors.grey[200], // Màu nền xám khi unselected
          borderRadius: BorderRadius.circular(8),
          border: isSelected
              ? Border.all(color: Colors.blue, width: 1)
              : Border.all(color: Colors.transparent), // Không có border khi unselected
        ),
        child: Text(
          tabTitles[index],
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
            color: isSelected ? Colors.blue : Colors.grey[700], // Text màu xanh khi selected
          ),
        ),
      ),
    );
  }
}

class EmptyServiceScreen extends StatelessWidget {
  const EmptyServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 40),
        Image.asset(ImageString.iconCardboard, width: 80, height: 80),
        const SizedBox(height: 16),
        const Text(
          "Chưa có dịch vụ nào đang xử lý.",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: ElevatedButton(
            onPressed: () {
              print("Chuyển đến trang đặt dịch vụ");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text("Đặt dịch vụ"),
          ),
        ),
      ],
    );
  }
}

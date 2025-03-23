import 'package:dien_lanh_khoa_van/blog_data.dart';
import 'package:dien_lanh_khoa_van/service_tabs.dart';
import 'package:dien_lanh_khoa_van/utils/constants/image_string.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:url_launcher/url_launcher.dart';
import 'appbar.dart';
import 'category.dart';
import 'features/blog/screen/blog_list_page.dart';
import 'features/blog/widget/blog_card.dart'; // Import CategoryList

class HomeScreen extends StatelessWidget {
  final List<String> imagePaths = [
    ImageString.promoBanner1,
    ImageString.promoBanner2,
    ImageString.promoBanner3,
  ];

  Future<void> _makePhoneCall() async {
    final Uri uri = Uri(scheme: 'tel', path: '0344887910 ');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Không thể gọi số ${0344887910}';
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Nội dung trang
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: CarouselSlider(
                              options: CarouselOptions(
                                height: 200.0,
                                autoPlay: true,
                                enlargeCenterPage: true,
                                viewportFraction: 0.9,
                                aspectRatio: 16 / 9,
                                autoPlayInterval: const Duration(seconds: 3),
                              ),
                              items: imagePaths.map((path) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        path,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                          ),

                          const SizedBox(height: 8),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Danh mục dịch vụ',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),

                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: CategoryList(),
                          ),

                          const SizedBox(height: 8),

                          Container(
                            height: 400,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: const ServiceTabs(),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Tin tức',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BlogListPage(posts: blogPosts),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Xem tất cả',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 8),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              children: blogPosts.take(2).map((post) => BlogCard(post: post)).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),


              ],
            ),

            // Floating Button Đặt trên cùng
            Positioned(
              bottom: 100, // Đặt cao hơn BottomNav
              right: 20,
              child: FloatingActionButton(
                onPressed: _makePhoneCall,
                heroTag: 'callButton',
                backgroundColor: Colors.blue,
                child: const Icon(
                  LucideIcons.phone,
                  color: Colors.white,
                  size: 28,
                ),
                elevation: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

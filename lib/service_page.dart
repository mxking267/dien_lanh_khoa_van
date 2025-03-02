import 'package:dien_lanh_khoa_van/utils/constants/image_string.dart';
import 'package:flutter/material.dart';
import 'appbar.dart';
import 'category.dart'; // Import CategoryList

class ServicePage extends StatelessWidget {
  final List<String> imagePaths = [
    ImageString.promoBanner1,
    ImageString.promoBanner2,
    ImageString.promoBanner3,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: const CustomAppBar(),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: CategoryList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

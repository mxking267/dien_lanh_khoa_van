import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: ThemeColors.primary,
              padding: const EdgeInsets.all(0),
              child: Stack(
                children: [
                  Container(
                    width: 400,
                    height: 400,
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(400),
                      color: ThemeColors.textWhite.withOpacity(0.1)
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

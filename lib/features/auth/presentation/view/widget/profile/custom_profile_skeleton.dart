import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomSkeleton extends StatelessWidget {
  const CustomSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(20),
        Skeletonizer(
          child: Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
          ),
        ),
        Gap(50),
        Skeletonizer(
          child: Container(
            height: 20,
            width: double.infinity,
            color: Colors.grey[300],
          ),
        ),
        Gap(25),
        Skeletonizer(
          child: Container(
            height: 20,
            width: double.infinity,
            color: Colors.grey[300],
          ),
        ),
        Gap(25),
        Skeletonizer(
          child: Container(
            height: 20,
            width: double.infinity,
            color: Colors.grey[300],
          ),
        ),
        Gap(25),
        Divider(color: Colors.grey[400]),
        Gap(25),
        Skeletonizer(
          child: Container(
            height: 50,
            width: double.infinity,
            color: Colors.grey[300],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hungry/core/resources/app_colors.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),

      // child: Padding(
      //   padding: EdgeInsets.all(16),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Text('Welcome, User', style: TextStyle(color: Colors.white, fontSize: 18)),
      //       Icon(Icons.settings, color: Colors.white),
      //     ],
      //   ),
      // ),
    );
  }
}

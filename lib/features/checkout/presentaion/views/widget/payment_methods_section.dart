import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/resources/app_colors.dart';
import 'package:hungry/features/checkout/presentaion/views/widget/payment_method_tile.dart';
import '../../../../../core/resources/images.dart';
import '../../../../../core/resources/style.dart';

class PaymentMethodsSection extends StatelessWidget {
  final String selected;
  final Function(String?) onChanged;

  const PaymentMethodsSection({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaymentMethodTile(
          image: AppImages.dollar,
          text: 'Cash on Delivery',
          value: 'Cash',
          groupValue: selected,
          colors: const Color(0xff3C2F2F),
          textColor: Colors.white,
          subtitle: 'false',
          onChanged: onChanged,
        ),
        Gap(27.h),
        PaymentMethodTile(
          image: AppImages.visa,
          text: 'Debit card',
          value: 'Visa',
          groupValue: selected,
          colors: Colors.blue.shade900,
          textColor: Colors.black,
          subtitle: '3566 **** **** 0505',
          onChanged: onChanged,
        ),
        Gap(16.h),
        Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (f) {},
              activeColor: AppColors.primary
            ),
            Expanded(
              child: Text(
                "Save card details for future payments",
                style: AppStyle.text15.copyWith(fontSize: 15.sp),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

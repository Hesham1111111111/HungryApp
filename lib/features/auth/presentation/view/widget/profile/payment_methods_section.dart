import 'package:flutter/material.dart';

import '../../../../../../core/resources/images.dart';
import '../../../../../checkout/presentaion/views/widget/payment_method_tile.dart';
class PaymentMethodsSection extends StatelessWidget {
  const PaymentMethodsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        PaymentMethodTile(
          image: AppImages.visaProfile,
          text: 'Debit card',
          value: 'Visa',
          groupValue: "",
          colors: Color(0xffF3F4F6),
          textColor: Colors.black,
          subtitle: '3566 **** **** 0505',
          onChanged: (_) {},
        ),
        SizedBox(height: 90),
      ],
    );
  }
}

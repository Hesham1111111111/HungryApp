import 'package:flutter/material.dart';
import 'package:hungry/features/auth/presentation/view/widget/profile/profile_fields_form.dart';

import '../../../../../../core/resources/images.dart';
class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: ProfileFieldsForm(),
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        leading: Image.asset(AppImages.visa, width: 40),
        title: const Text('Debit Card', style: TextStyle(fontWeight: FontWeight.w600)),
        subtitle: const Text('3566 **** **** 0505'),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

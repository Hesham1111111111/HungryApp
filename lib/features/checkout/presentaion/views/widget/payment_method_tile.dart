import 'package:flutter/material.dart';

import '../../../../../core/resources/images.dart';
import '../../../../../core/resources/style.dart';

class PaymentMethodTile extends StatelessWidget {
  const PaymentMethodTile({
    super.key,
    required this.image,
    required this.text,
    required this.value,
    required this.groupValue,
    required this.colors,
    required this.textColor,
    required this.subtitle,
    required this.onChanged,

  });

  final String image;
  final String text;
  final String value;
  final String groupValue;
  final String subtitle;
  final Color colors;
  final Color textColor;
  final ValueChanged<String?> onChanged;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: subtitle == "false"
          ? null
          : Text(subtitle, style: AppStyle.title),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.5)),
      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      tileColor: colors,
      leading: Image.asset(image, width: 72, height: 72),
      title: Text(text, style: AppStyle.text20.copyWith(color: textColor)),
      trailing: Radio<String>(
        activeColor: Colors.white,
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}

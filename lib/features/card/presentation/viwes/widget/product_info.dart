import 'package:flutter/material.dart';
import 'package:hungry/features/card/data/model/get_cart_model/order_Item.dart';

import '../../../../../core/resources/images.dart';
import '../../../../../core/resources/style.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key, required this.orderItem});

  final OrderItem orderItem;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Image.network(orderItem.image,width: 200,height: 120,),
          Text(orderItem.name, style: AppStyle.bold,maxLines: 1,),
        ],
      ),
    );
  }
}

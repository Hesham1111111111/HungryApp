import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/style.dart';
import '../../../../../core/widget/custom_button.dart';
import '../../../../card/data/model/get_cart_model/order_data_model.dart';
import '../../../../checkout/presentaion/views/checkout_view.dart';

class OrderHistoryData extends StatelessWidget {
  const OrderHistoryData({super.key, required this.orderData, required this.totalPrice});
  final List<OrderData> orderData;
  final String totalPrice ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(orderData.first.item.first.image,width: 110,height: 100,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(orderData.first.item.first.name, style: AppStyle.bold,maxLines: 1,),
                Text(orderData.first.item.first.quantity.toString()),
                Text("Price : ${orderData.first.item.first.price}\$", style: AppStyle.bold),
              ],
            ),
            Gap(20.w),
          ],
        ),
        Gap(20.h),
        InkWell(
          onTap: (){
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=>CheckoutView(totalPrice: totalPrice,)));
          },
          child: CustomButton(
            text: "Order Again  ",
            color: Colors.grey.shade400,
            width: double.infinity,
            height: 55.h,
          ),
        ),
      ],
    );
  }
}

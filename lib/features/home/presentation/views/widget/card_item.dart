import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/features/card/data/model/get_cart_model/order_data_model.dart';

import '../../../../../core/resources/style.dart';
import '../../../../product/presenation/views/product_details_view.dart';
import '../../../data/model/category_moodle.dart';

class CardItem extends StatefulWidget {
  final ProductModel product;

  const CardItem({super.key, required this.product});

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  bool select = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailsView(
                    product: widget.product,
                    productId: widget.product.id,
                    price: widget.product.price,


                  ),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 155.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.product.image),
                      ),
                    ),
                  ),
                  Gap(10.h),
                  Text(widget.product.name, style: AppStyle.bold, maxLines: 1),
                  Text(widget.product.desc, maxLines: 1),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              children: [
                const Icon(Icons.star, color: Color(0xffFF9633)),
                Text(widget.product.rating),
                const Spacer(),
                InkWell(
                  onTap: () => setState(() => select = !select),
                  child: Icon(
                    select ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

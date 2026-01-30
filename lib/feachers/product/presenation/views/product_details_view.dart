// product_details_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../../../home/data/model/category_moodle.dart';
import 'widget/burger_spice_slider.dart';
import 'widget/product_customization_section.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({
    super.key,
    required this.product,
    required this.productId,
    required this.price,
  });

  final ProductModel product;
  final int productId;
  final String price;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  double spicyValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, size: 24.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BurgerSpiceSlider(
                value: spicyValue,
                onchange: (v) => setState(() => spicyValue = v),
              ),
              Gap(52.h),
              ProductCustomizationSection(
                productId: widget.productId,
                spicy: spicyValue,
                price: widget.product.price,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

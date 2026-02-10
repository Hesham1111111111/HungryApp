import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/features/product/data/model/toppings_model.dart';

class IngredientTileTopping extends StatelessWidget {
  const IngredientTileTopping({
    super.key,
    required this.toppingsModel,
    required this.isSelected,
  });

  final ToppingsModel toppingsModel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Container(
        height: 122.h,
        width: 100.w,
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.withOpacity(0.2) : Colors.white,
          borderRadius: BorderRadius.circular(22.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6.r,
              offset: Offset(0, 3.h),
            ),
          ],
          border: Border.all(
            color: isSelected ? Colors.green : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(22.r)),
              child: Container(
                height: 70.h,
                width: double.infinity,
                color: Colors.white,
                child: Image.network(
                  toppingsModel.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: isSelected ? Colors.green : Color(0xff3C2F2F),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      toppingsModel.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    width: 20.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : Color(0xffEF2A39),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isSelected ? Icons.check : Icons.add,
                      color: isSelected ? Colors.green : Colors.white,
                      size: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

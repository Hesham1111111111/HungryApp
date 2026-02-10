import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/features/product/data/model/side_options_model.dart';

class SideIngredientTile extends StatelessWidget {
  const SideIngredientTile({
    super.key,
    required this.sideOptions,
    required this.isSelected,
  });

  final SideOptionsModel sideOptions;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: GestureDetector(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 120.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22.r),
            boxShadow: [
              BoxShadow(
                color: isSelected
                    ? Colors.green.withOpacity(0.25)
                    : Colors.black.withOpacity(0.08),
                blurRadius: isSelected ? 12 : 6,
                offset: Offset(0, 4.h),
              ),
            ],
            border: Border.all(
              color: isSelected ? Colors.green : Colors.grey.shade200,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(22.r)),
                child: Image.network(
                  sideOptions.image,
                  height: 70.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Expanded(
                child: Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.green : const Color(0xff3C2F2F),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(22.r),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          sideOptions.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      SizedBox(width: 6.w),

                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 22.w,
                        height: 22.h,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.white
                              : const Color(0xffEF2A39),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isSelected ? Icons.check : Icons.add,
                          color:
                          isSelected ? Colors.green : Colors.white,
                          size: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

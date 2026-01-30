import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/feachers/home/manager/categories_manager/categories_cubit.dart';
import 'package:hungry/feachers/home/manager/categories_manager/categories_state.dart';
import '../../../../../core/resources/app_colors.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is LoadingCategoriesState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SuccessCategoriesState) {
            return Row(
              children: List.generate(state.categories.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 27.w,
                      vertical: 15.h,
                    ),
                    margin: EdgeInsets.only(right: 8.w),
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? AppColors.primary
                          : const Color(0xffF3F4F6),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      state.categories[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: selectedIndex == index
                            ? Colors.white
                            : Colors.grey.shade600,
                      ),
                    ),
                  ),
                );
              }),
            );
          } else if (state is ErrorCategoriesState) {
            return Center(
              child: Text(
                state.errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

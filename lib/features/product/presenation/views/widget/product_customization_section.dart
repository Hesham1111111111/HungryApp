import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/resources/app_colors.dart';

import 'package:hungry/core/resources/style.dart';
import 'package:hungry/features/product/manager/side_option_manager/side_option_cubit.dart';
import 'package:hungry/features/product/manager/side_option_manager/side_option_state.dart';
import 'package:hungry/features/product/manager/toppings_manager/toppings_cubit.dart';
import 'package:hungry/features/product/manager/toppings_manager/toppings_state.dart';
import 'package:hungry/features/product/presenation/views/widget/sideIngredient_tile.dart';
import 'package:hungry/features/product/presenation/views/widget/toppings.dart';

import '../../../../card/data/model/add_to_cart_model/add_to_cart_model.dart';
import '../../../../card/manager/add_to_cart_manager/ad_to_cart_cubit.dart';
import '../../../../card/manager/add_to_cart_manager/add_to_curt_state.dart';

class ProductCustomizationSection extends StatefulWidget {
  const ProductCustomizationSection({
    super.key,
    required this.productId,
    required this.spicy,
    required this.price,
  });

  final int productId;
  final double spicy;
  final String price;

  @override
  State<ProductCustomizationSection> createState() =>
      _ProductCustomizationSectionState();
}

class _ProductCustomizationSectionState
    extends State<ProductCustomizationSection> {
  final List<int> selectedToppings = [];
  final List<int> selectedSideOptions = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Toppings", style: AppStyle.text18.copyWith(fontSize: 18.sp)),
        Gap(10.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: BlocBuilder<ToppingsCubit, ToppingsState>(
            builder: (context, state) {
              if (state is LoadingToppingsState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is SuccessToppingsState) {
                return Row(
                  children: state.toppingsModel.map((topping) {
                    final isSelected = selectedToppings.contains(topping.id);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedToppings.remove(topping.id);
                          } else {
                            selectedToppings.add(topping.id);
                          }
                        });
                      },
                      child: IngredientTileTopping(
                        toppingsModel: topping,
                        color: isSelected
                            ? Colors.green.withOpacity(.2)
                            : Colors.white,
                      ),
                    );
                  }).toList(),
                );
              } else if (state is ErrorToppingsState) {
                return Text(state.errorMassege);
              }
              return const SizedBox();
            },
          ),
        ),

        Gap(15.h),

        Text("Side Options", style: AppStyle.text18.copyWith(fontSize: 18.sp)),
        Gap(10.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: BlocBuilder<SideOptionsCubit, SideOptionsState>(
            builder: (context, state) {
              if (state is LoadingSideOptionsState) {
                return Center(child: const CircularProgressIndicator());
              } else if (state is SuccessSideOptionsState) {
                return Row(
                  children: state.sideOptions.map((side) {
                    final isSelected = selectedSideOptions.contains(side.id);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedSideOptions.remove(side.id);
                          } else {
                            selectedSideOptions.add(side.id);
                          }
                        });
                      },
                      child: SideIngredientTile(
                        sideOptions: side,
                        isSelected: isSelected,
                      ),
                    );
                  }).toList(),
                );
              } else if (state is ErrorSideOptionsState) {
                return Text(state.errorMassege);
              }
              return const SizedBox();
            },
          ),
        ),

        Gap(20.h),

        BlocListener<AddToCartCubit, CartState>(
          listener: (context, state) {
            if (state is CartSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: const [
                      Icon(Icons.check_circle, color: Colors.white),
                      SizedBox(width: 10),
                      Text("Added to cart!",style: TextStyle(fontSize: 15),),
                    ],
                  ),
                  backgroundColor: AppColors.primary,
                  duration: Duration(seconds: 3),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              );
            } else if (state is CartErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Error: ${state.message}")),
              );
            }
          },
          child: InkWell(
            onTap: () {
              final cartRequest = CartRequestModel(
                items: [
                  CartModel(
                    productId: widget.productId,
                    quantity: 1,
                    spicy: widget.spicy,
                    toppings: selectedToppings,
                    sideOptions: selectedSideOptions,
                  ),
                ],
              );

              context.read<AddToCartCubit>().addToCart(cartRequest);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              height: 60.h,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.price,
                      style: AppStyle.text20.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Text(
                      "Add To Cart",
                      style: AppStyle.text20.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )

        ),

        Gap(200.h),
      ],
    );
  }
}

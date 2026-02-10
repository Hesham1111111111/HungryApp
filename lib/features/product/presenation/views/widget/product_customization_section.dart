import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/features/product/presenation/views/widget/side_options_section.dart';
import 'package:hungry/features/product/presenation/views/widget/totppings_section.dart';
import '../../../../../core/widget/custom_snack_bar_success.dart';
import '../../../../card/data/model/add_to_cart_model/add_to_cart_model.dart';
import '../../../../card/manager/add_to_cart_manager/ad_to_cart_cubit.dart';
import '../../../../card/manager/add_to_cart_manager/add_to_curt_state.dart';
import 'add_to_cart_button.dart';

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
        ToppingsSection(
          selectedToppings: selectedToppings,
          onTap: (id) {
            setState(() {
              selectedToppings.contains(id)
                  ? selectedToppings.remove(id)
                  : selectedToppings.add(id);
            });
          },
        ),
        Gap(20.h),

        SideOptionsSection(
          selectedSideOptions: selectedSideOptions,
          onTap: (id) {
            setState(() {
              selectedSideOptions.contains(id)
                  ? selectedSideOptions.remove(id)
                  : selectedSideOptions.add(id);
            });
          },
        ),
        Gap(30.h),
        BlocConsumer<AddToCartCubit, CartState>(
          listener: (context, state) {
            if (state is CartSuccessState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(snackBarSuccess("Added to cart"));
            }
            if (state is CartErrorState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            final isLoading = state is CartLoadingState;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GestureDetector(
                onTap: isLoading
                    ? null
                    : () {
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
                child: AddToCartButton(
                  price: widget.price,
                  isLoading: isLoading,
                ),
              ),
            );
          },
        ),

        Gap(20.h),
      ],
    );
  }
}

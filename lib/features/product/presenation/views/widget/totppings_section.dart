import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/features/product/presenation/views/widget/product_details_shimmer/sideIngredient_details%20_shimmer.dart';
import 'package:hungry/features/product/presenation/views/widget/toppings.dart';

import '../../../../../core/resources/style.dart';
import '../../../manager/toppings_manager/toppings_cubit.dart';
import '../../../manager/toppings_manager/toppings_state.dart';


class ToppingsSection extends StatelessWidget {
  const ToppingsSection({
    super.key,
    required this.selectedToppings,
    required this.onTap,
  });

  final List<int> selectedToppings;
  final void Function(int toppingId) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Toppings", style: AppStyle.text18),
        Gap(10.h),
        SizedBox(
          height: 120.h,
          child: BlocBuilder<ToppingsCubit, ToppingsState>(
            builder: (context, state) {
              if (state is LoadingToppingsState) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (_, __) =>
                  const SideIngredientTileShimmer(),
                );
              }

              if (state is SuccessToppingsState) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.toppingsModel.length,
                  itemBuilder: (context, index) {
                    final topping = state.toppingsModel[index];
                    final isSelected =
                    selectedToppings.contains(topping.id);

                    return GestureDetector(
                      onTap: () => onTap(topping.id),
                      child: IngredientTileTopping(
                        toppingsModel: topping,
                        isSelected: isSelected,
                      ),
                    );
                  },
                );
              }

              if (state is ErrorToppingsState) {
                return Center(child: Text(state.errorMassege));
              }

              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}

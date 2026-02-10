import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/features/product/presenation/views/widget/product_details_shimmer/sideIngredient_details%20_shimmer.dart';
import 'package:hungry/features/product/presenation/views/widget/sideIngredient_tile.dart';

import '../../../../../core/resources/style.dart';
import '../../../manager/side_option_manager/side_option_cubit.dart';
import '../../../manager/side_option_manager/side_option_state.dart';
class SideOptionsSection extends StatelessWidget {
  const SideOptionsSection({
    super.key,
    required this.selectedSideOptions,
    required this.onTap,
  });

  final List<int> selectedSideOptions;
  final void Function(int sideId) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Side Options", style: AppStyle.text18),
        Gap(10.h),
        SizedBox(
          height: 130.h,
          child: BlocBuilder<SideOptionsCubit, SideOptionsState>(
            builder: (context, state) {
              if (state is LoadingSideOptionsState) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (_, __) =>
                  const SideIngredientTileShimmer(),
                );
              }

              if (state is SuccessSideOptionsState) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.sideOptions.length,
                  itemBuilder: (context, index) {
                    final side = state.sideOptions[index];
                    final isSelected =
                    selectedSideOptions.contains(side.id);

                    return GestureDetector(
                      onTap: () => onTap(side.id),
                      child: SideIngredientTile(
                        sideOptions: side,
                        isSelected: isSelected,
                      ),
                    );
                  },
                );
              }

              if (state is ErrorSideOptionsState) {
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

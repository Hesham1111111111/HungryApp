import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/features/auth/manager/auth_cubit.dart';
import 'package:hungry/features/home/manager/home_manger/home_cubit.dart';
import 'package:hungry/features/home/presentation/views/widget/catogery_item.dart';
import 'package:hungry/features/home/presentation/views/widget/header_view.dart';
import 'package:hungry/features/home/presentation/views/widget/home_builder.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();

    context.read<HomeProductCubit>().getHomeProduct();
    context.read<AuthCubit>().getProfileData();
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            HeaderView(),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(children: [CategoryItem(), Gap(20.h)]),
              ),
            ),
            HomeBuilder(),
          ],
        ),
      ),
    );
  }
}

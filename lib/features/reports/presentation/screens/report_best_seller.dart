import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/reports/presentation/widgets/list_tile/best_seller_product_tile.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class ReportBestSellerScreen extends StatelessWidget {
  const ReportBestSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) => switch (state) {
        AuthReady() => const ReportBestSeller(),
        _ => const Scaffold(body: Center(child: CircularProgressIndicator())),
      },
    );
  }
}

class ReportBestSeller extends StatelessWidget {
  const ReportBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Produk Terlaris",
      ),
      body: Scrollbar(
        child: RefreshIndicator(
          backgroundColor: TColors.neutralLightLightest,
          onRefresh: () async {
            return await Future.delayed(const Duration(milliseconds: 200));
          },
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: TColors.neutralLightMedium,
                    ),
                  ),
                ),
                child: BestSellerProductTile(
                  imageSrc: "https://picsum.photos/100?random=$index",
                  sold: 89,
                  name: "Produk ${index + 1}",
                  rank: index + 1,
                  onTap: () {
                    Navigator.pushNamed(context, "/reports/best_seller/detail");
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

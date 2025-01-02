import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lakoe_pos/common/data/models.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_cubit.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_state.dart';
import 'package:lakoe_pos/features/checkout/application/filters/filter_purchase_cubit.dart';
import 'package:lakoe_pos/features/checkout/application/filters/filter_purchase_state.dart';
import 'package:lakoe_pos/features/checkout/application/purchase_cubit.dart';
import 'package:lakoe_pos/features/checkout/application/purchase_state.dart';
import 'package:lakoe_pos/features/packages/presentation/widgets/card_item_history.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';
import 'package:owner_repository/owner_repository.dart';

class HistoryPurchasePackageScreen extends StatelessWidget {
  const HistoryPurchasePackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FilterPurchaseCubit()),
      ],
      child: const HistoryPurchasePackage(),
    );
  }
}

class HistoryPurchasePackage extends StatefulWidget {
  const HistoryPurchasePackage({super.key});

  @override
  State<HistoryPurchasePackage> createState() => _HistoryPurchasePackageState();
}

class _HistoryPurchasePackageState extends State<HistoryPurchasePackage> {
  final List<LabelValue<String>> _statuses = [
    const LabelValue(label: "Pending", value: "PENDING"),
    const LabelValue(label: "Berhasil", value: "SUCCEEDED"),
    const LabelValue(label: "Gagal", value: "FAILED"),
  ];

  @override
  void initState() {
    super.initState();
    context.read<PurchaseCubit>().init();
  }

  Future<void> _onRefresh() async {
    FilterPurchaseState filterState = context.read<FilterPurchaseCubit>().state;
    await context
        .read<PurchaseCubit>()
        .findAll(filterState.toFindAllPurchaseDto);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<FilterPurchaseCubit, FilterPurchaseState>(
          listener: (context, state) {
            context.read<PurchaseCubit>().findAll(state.toFindAllPurchaseDto);
          },
        ),
      ],
      child: Scaffold(
        appBar: CustomAppbar(
          title: "Paket & Riwayat",
        ),
        body: Scrollbar(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 12.0),
                  child: TextHeading3(
                    "Paket Aktif",
                    color: TColors.neutralDarkDarkest,
                  ),
                ),
                CardItemPackageActive(),
                Container(
                  margin: EdgeInsets.only(bottom: 8.0, top: 24),
                  child: TextHeading3(
                    "Riwayat Pembelian",
                    color: TColors.neutralDarkDarkest,
                  ),
                ),
                BlocBuilder<FilterPurchaseCubit, FilterPurchaseState>(
                    builder: (context, state) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      spacing: 8.0,
                      children: _statuses.map((status) {
                        bool selected =
                            status.value == state.toFindAllPurchaseDto.status;
                        return InputChip(
                          label: selected
                              ? TextHeading4(
                                  status.label,
                                  color: TColors.primary,
                                )
                              : TextBodyM(
                                  status.label,
                                  color: TColors.neutralDarkDarkest,
                                ),
                          selected: selected,
                          onPressed: () {
                            final cubit = context.read<FilterPurchaseCubit>();
                            if (selected) {
                              cubit.setFilter(status: "ALL");
                            } else {
                              cubit.setFilter(status: status.value);
                            }
                          },
                        );
                      }).toList(),
                    ),
                  );
                }),
                BlocBuilder<PurchaseCubit, PurchaseState>(
                    builder: (context, state) {
                  final stateFilter = context.read<FilterPurchaseCubit>().state;
                  if (state is PurchaseLoadSuccess) {
                    String title = stateFilter.status == "PENDING"
                        ? "Tidak ada pembelian pending"
                        : stateFilter.status == "SUCCEEDED"
                            ? "Belum ada pembelian sukses"
                            : stateFilter.status == "FAILED"
                                ? "Tidak ada pembelian  gagal"
                                : "Belum ada riwayat pembelian, nih!";

                    String subtitle = stateFilter.status == "PENDING"
                        ? "Saat ini kamu tidak memiliki tagihan pembelian paket yang belum dibayar."
                        : stateFilter.status == "SUCCEEDED"
                            ? "Kamu belum pernah berhasil atau menyelesaikan pembelian paket."
                            : stateFilter.status == "FAILED"
                                ? "Saat ini kamu tidak memiliki pembelian paket yang gagal."
                                : "Yuk, Upgrade paket Lakoe bersama dengan bertumbuhnya bisnis kamu.";

                    if (state.purchases.isEmpty) {
                      return EmptyList(
                        image: SvgPicture.asset(
                          TImages.catBox,
                          width: 140,
                          height: 101.45,
                        ),
                        title: title,
                        subTitle: subtitle,
                        action: (stateFilter.status == "ALL" ||
                                stateFilter.status == null ||
                                stateFilter.status == "SUCCEEDED")
                            ? TextButton(
                                onPressed: () =>
                                    Navigator.pushNamed(context, "/packages"),
                                child: TextActionL(
                                  "Explore Paket",
                                  color: TColors.primary,
                                ),
                              )
                            : null,
                      );
                    }
                    return Expanded(
                      child: ListView.builder(
                          itemCount: state.purchases.length,
                          itemBuilder: (context, index) {
                            PurchaseModel purchase = state.purchases[index];
                            return CardItemHistory(
                                data: purchase,
                                onTap: () async {
                                  bool? result = await Navigator.pushNamed(
                                    context,
                                    "/packages/purchase/detail",
                                    arguments: purchase,
                                  ) as bool?;

                                  if (result == true) {
                                    _onRefresh();
                                  }
                                });
                          }),
                    );
                  } else if (state is PurchaseLoadInProgress) {
                    return Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state is PurchaseLoadFailure) {
                    return EmptyList(
                      title: "Gagal memuat data, nih!",
                      subTitle: "Ada sedikit gangguan. Coba coba lagi, ya",
                      action: TextButton(
                        onPressed: _onRefresh,
                        child: TextActionL(
                          "Coba Lagi",
                          color: TColors.primary,
                        ),
                      ),
                    );
                  } else {
                    return EmptyList(
                      title: "Bentar, ada masalah tak terduga, nih!",
                      subTitle: "Tenang, kamu bisa mencobanya lagi, kok",
                      action: TextButton(
                        onPressed: _onRefresh,
                        child: TextActionL(
                          "Coba Lagi",
                          color: TColors.primary,
                        ),
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardItemPackageActive extends StatelessWidget {
  const CardItemPackageActive({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OwnerCubit, OwnerState>(builder: (context, state) {
      if (state is OwnerLoadSuccess) {
        OwnerProfileModel owner = state.owner;
        return InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            if (owner.packageName == "GROW" || owner.packageName == "PRO") {
              Navigator.pushNamed(
                context,
                "/account/active_package",
                arguments: {'packageName': owner.packageName},
              );
            } else {
              Navigator.pushNamed(context, "/packages");
            }
          },
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: owner.packageName == "GROW"
                  ? TColors.successLight
                  : owner.packageName == "PRO"
                      ? Color(0xFFF4DEF8)
                      : TColors.highlightLightest,
              border: Border.all(
                color: TColors.neutralLightMedium,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    TImages.pakcageWaves,
                    colorFilter: ColorFilter.mode(
                      owner.packageName == "GROW"
                          ? Color(0xFF00712D)
                          : owner.packageName == "PRO"
                              ? Color(0xFF9306AF)
                              : Color(0xFFFC4100),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextHeading3(
                            "Paket ${TFormatter.capitalizeEachWord(owner.packageName)}",
                            color: TColors.neutralDarkDark,
                          ),
                          SizedBox(height: 4),
                          (owner.packageName == "LITE")
                              ? TextBodyM(
                                  "Gratis selamanya!",
                                  color: TColors.neutralDarkLight,
                                )
                              : Row(
                                  children: [
                                    TextBodyM(
                                      "Aktif sampai:",
                                      color: TColors.neutralDarkLight,
                                    ),
                                    SizedBox(width: 4),
                                    TextBodyM(
                                      "16 Nov 2024",
                                      fontWeight: FontWeight.bold,
                                      color: TColors.neutralDarkLight,
                                    ),
                                  ],
                                ),
                        ],
                      ),
                      Image.asset(
                        owner.packageName == "GROW"
                            ? TImages.growLogoPackage
                            : owner.packageName == "PRO"
                                ? TImages.proLogoPackage
                                : TImages.liteLogoPackage,
                        height: 28,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/online_shop/application/cubit/shop_order_detail_cubit/shop_order_track_cubit.dart';
import 'package:lakoe_pos/features/online_shop/application/cubit/shop_order_detail_cubit/shop_order_track_state.dart';
import 'package:lakoe_pos/features/online_shop/data/arguments/online_shop_order_track_argument.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/online_shop/utils/constants/order_tracking_status_label.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';
import 'package:lakoe_pos/utils/helpers/helper.dart';
import 'package:timelines_plus/timelines_plus.dart';

class OnlineShopOrderTrackScreen extends StatelessWidget {
  const OnlineShopOrderTrackScreen({super.key, required this.arguments});

  final OnlineShopOrderTrackArgument arguments;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopOrderTrackCubit(),
      child: OnlineShopOrderTrack(arguments: arguments),
    );
  }
}

class OnlineShopOrderTrack extends StatefulWidget {
  const OnlineShopOrderTrack({super.key, required this.arguments});

  final OnlineShopOrderTrackArgument arguments;

  @override
  State<OnlineShopOrderTrack> createState() => _OnlineShopOrderTrackState();
}

class _OnlineShopOrderTrackState extends State<OnlineShopOrderTrack> {
  Future<void> _onInit() async {
    context
        .read<ShopOrderTrackCubit>()
        .track(orderId: widget.arguments.order.id);
  }

  Future<void> _onRefresh() async {
    context
        .read<ShopOrderTrackCubit>()
        .track(orderId: widget.arguments.order.id);
  }

  Future<void> _onCopy({required String title, required String text}) async {
    await THelper.copyToClipboard(text);

    if (!mounted) return;
    SnackBar snackBar = SnackBar(
      content: Text(title),
      showCloseIcon: true,
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        snackBar,
      );
  }

  bool isEdgeIndex(int index, int length) {
    return index == 0 || index == length + 1;
  }

  @override
  void initState() {
    super.initState();

    _onInit();
  }

  @override
  Widget build(BuildContext context) {
    final order = widget.arguments.order;

    return Scaffold(
      appBar: CustomAppbar(
        title: "Lacak Pengiriman",
      ),
      body: BlocBuilder<ShopOrderTrackCubit, ShopOrderTrackState>(
        builder: (context, state) => switch (state) {
          ShopOrderTrackLoadSuccess(:final track) => Scrollbar(
              child: RefreshIndicator(
                backgroundColor: TColors.neutralLightLight,
                onRefresh: _onRefresh,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 4),
                                    child: TextBodyM("Kurir"),
                                  ),
                                  TextActionL(
                                      "${order.shipment.courierCompany} - ${order.shipment.courierType}")
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 4),
                                    child: Row(
                                      children: [
                                        TextBodyM("No. Resi"),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 4),
                                          child: UiIcons(
                                            onTap: () {
                                              _onCopy(
                                                title:
                                                    "Nomor resi berhasil disalin",
                                                text: track.waybillId,
                                              );
                                            },
                                            TIcons.copy,
                                            size: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextActionL(track.waybillId)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 4),
                                    child: TextBodyM("Penjual"),
                                  ),
                                  TextActionL(track.origin.contactName)
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 4),
                                    child: TextBodyM("Pembeli"),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 4),
                                    child: TextActionL(
                                        track.destination.contactName),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 4,
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        color: TColors.neutralLightMedium,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 4),
                                    child: TextBodyM("Status"),
                                  ),
                                  TextHeading3(
                                    OrderTrackingStatusLabel.getLabel(
                                      track.status,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 1,
                              color: TColors.neutralLightMedium,
                            ),
                          ),
                          child: track.history.isEmpty
                              ? Center(
                                  child: TextBodyS(
                                    "Riwayat pengiriman masih kosong",
                                    color: TColors.neutralDarkLight,
                                  ),
                                )
                              : FixedTimeline.tileBuilder(
                                  theme: TimelineThemeData(
                                    nodePosition: 0,
                                    color: Color(0xff989898),
                                    indicatorTheme: IndicatorThemeData(
                                      position: 0,
                                      size: 20.0,
                                    ),
                                    connectorTheme: ConnectorThemeData(
                                      thickness: 2.5,
                                    ),
                                  ),
                                  builder: TimelineTileBuilder.connected(
                                    connectionDirection:
                                        ConnectionDirection.before,
                                    itemCount: track.history.length,
                                    contentsBuilder: (_, index) {
                                      final history = track.history.reversed
                                          .elementAt(index);

                                      return Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 4),
                                              child: TextHeading4(history.note),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 4),
                                              child: TextBodyS(
                                                TFormatter.orderDate(
                                                  history.updatedAt,
                                                  withDay: true,
                                                ),
                                                color: TColors.neutralDarkLight,
                                              ),
                                            )
                                            // _InnerTimeline(
                                            //     messages: processes[index].messages),
                                          ],
                                        ),
                                      );
                                    },
                                    indicatorBuilder: (_, index) {
                                      if (index == 0) {
                                        return OutlinedDotIndicator(
                                          borderWidth: 5,
                                          color: TColors.highlightLight,
                                          backgroundColor:
                                              TColors.highlightDarkest,
                                        );
                                      } else {
                                        return OutlinedDotIndicator(
                                          borderWidth: 5,
                                          color: TColors.neutralLightMedium,
                                          backgroundColor:
                                              TColors.neutralLightDark,
                                        );
                                      }
                                    },
                                    connectorBuilder: (_, index, ___) =>
                                        SolidLineConnector(
                                      thickness: 1.5,
                                      color: index == 0
                                          ? Color(0xff66c97f)
                                          : TColors.neutralLightMedium,
                                      indent: 4,
                                      endIndent: 4,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          _ => Center(
              child: CircularProgressIndicator(),
            ),
        },
      ),
    );
  }
}

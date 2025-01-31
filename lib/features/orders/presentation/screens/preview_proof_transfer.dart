import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/appbar/light_appbar.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_l.dart';
import 'package:lakoe_pos/features/orders/application/cubit/order_detail/order_detail_cubit.dart';
import 'package:lakoe_pos/features/orders/application/cubit/order_detail/order_detail_state.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class PreviewProofTransfer extends StatefulWidget {
  const PreviewProofTransfer({super.key});

  @override
  State<PreviewProofTransfer> createState() => _PreviewProofTransferState();
}

class _PreviewProofTransferState extends State<PreviewProofTransfer> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailCubit, OrderDetailState>(
        builder: (context, state) => switch (state) {
              OrderDetailLoadSuccess(:final order) => Scaffold(
                  backgroundColor: Colors.black,
                  appBar: CustomAppbarLight(
                    title: "Bukti Transfer",
                  ),
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: order.transactions![0].photo != null
                              ? Image.network(
                                  order.transactions![0].photo!,
                                  width: 300,
                                  fit: BoxFit
                                      .contain, // Menggunakan BoxFit.contain agar gambar tetap proporsional
                                  alignment: Alignment
                                      .center, // Pastikan gambar berada di tengah
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Text(
                                      "Gagal memuat gambar",
                                      style: TextStyle(color: Colors.white),
                                    );
                                  },
                                )
                              : const Text(
                                  "Photo tidak tersedia",
                                  style: TextStyle(color: Colors.white),
                                ),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 60),
                            child: TextBodyL(
                              "Bukti transfer pembayaran untuk pesanan #${order.no}",
                              color: TColors.neutralLightLightest,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: OutlinedButton.styleFrom(
                                side:
                                    BorderSide(color: Colors.white, width: 1.0),
                              ),
                              child: TextActionL(
                                "Kembali",
                                color: TColors.neutralLightLightest,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              OrderDetailLoadFailure() => Scaffold(
                  appBar: CustomAppbar(
                    title: "Bukti Transfer",
                  ),
                  body: EmptyList(
                    title: "Gagal memuat data, nih!",
                    subTitle: "Ada sedikit gangguan. Coba coba lagi, ya",
                  ),
                ),
              _ => const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            });
  }
}

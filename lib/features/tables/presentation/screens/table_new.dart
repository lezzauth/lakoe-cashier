import 'package:app_data_provider/app_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/error_display/error_display.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/features/tables/application/cubit/table_master/table_master_cubit.dart';
import 'package:lakoe_pos/features/tables/application/cubit/table_master/table_master_state.dart';
import 'package:lakoe_pos/features/tables/presentation/widgets/forms/table_information_form.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:table_repository/table_repository.dart';

class TableNewScreen extends StatelessWidget {
  const TableNewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TableNew();
  }
}

class TableNew extends StatefulWidget {
  const TableNew({super.key});

  @override
  State<TableNew> createState() => _TableNewState();
}

class _TableNewState extends State<TableNew> {
  final AppDataProvider _appDataProvider = AppDataProvider();

  final dummyTableModel = TableModel(
    id: "1",
    no: "T-00",
    capacity: 4,
    outletId: "outlet123",
    outletRoomId: "room456",
    createdAt: "2024-11-05T10:30:00Z",
    updatedAt: "2024-11-05T12:00:00Z",
    outletRoom: OutletRoom(
      id: "room456",
      name: "Main Hall",
      outletId: "outlet123",
      createdAt: "2024-11-01T08:00:00Z",
      updatedAt: "2024-11-05T10:30:00Z",
    ),
  );

  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> _onSubmit() async {
    bool isFormValid = _formKey.currentState?.saveAndValidate() ?? false;

    if (!isFormValid) {
      return;
    }

    FocusScope.of(context).unfocus();
    dynamic value = _formKey.currentState?.value;

    await context.read<TableMasterCubit>().create(CreateTableDto(
          no: value["no"],
          capacity: int.parse(value["capacity"]),
          outletRoomId: value["outletRoomId"],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<TableMasterCubit, TableMasterState>(
          listener: (context, state) async {
            if (state is TableMasterActionSuccess) {
              Navigator.pop(context, true);
            } else if (state is TableMasterReachesLimit) {
              final activePackage = await _appDataProvider.activePackage;

              String limit = "5";

              if (activePackage == "GROW") {
                limit = "20";
              }

              if (!context.mounted) return;

              showModalBottomSheet(
                context: context,
                enableDrag: false,
                isDismissible: false,
                builder: (context) {
                  return PopScope(
                    canPop: false,
                    onPopInvokedWithResult: (didPop, result) async {},
                    child: CustomBottomsheet(
                      hasGrabber: false,
                      child: ErrorDisplay(
                        imageSrc: TImages.limitQuota,
                        title: "Meja udah maksimal, nih!",
                        description:
                            "Sudah tersimpan $limit data meja. Upgrade untuk tambah meja tanpa batas!",
                        actionTitlePrimary: "Lihat Paket",
                        onActionPrimary: () {
                          Navigator.pop(context);
                          Navigator.pop(context, true);
                          if (activePackage != "LITE") {
                            Navigator.pushNamed(
                              context,
                              "/account/active_package",
                              arguments: {'packageName': activePackage},
                            );
                          } else {
                            Navigator.pushNamed(context, "/packages");
                          }
                        },
                        actionTitleSecondary: "Nanti Saja",
                        onActionSecondary: () {
                          Navigator.pop(context);
                          Navigator.pop(context, true);
                        },
                      ),
                    ),
                  );
                },
              );
            }
          },
        )
      ],
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: CustomAppbar(
            title: "Buat Meja Baru",
            actions: [
              // ResponsiveLayout(
              //   mobile: BlocBuilder<TableMasterCubit, TableMasterState>(
              //       builder: (context, state) {
              //     return TextButton(
              //       onPressed:
              //           state is TableMasterActionInProgress ? null : _onSubmit,
              //       child: state is TableMasterActionInProgress
              //           ? const SizedBox(
              //               height: 16,
              //               width: 16,
              //               child: CircularProgressIndicator(
              //                 strokeWidth: 1.2,
              //               ),
              //             )
              //           : const TextActionL(
              //               "SIMPAN",
              //               color: TColors.primary,
              //             ),
              //     );
              //   }),
              //   tablet: SizedBox.shrink(),
              // ),
              BlocBuilder<TableMasterCubit, TableMasterState>(
                  builder: (context, state) {
                return TextButton(
                  onPressed:
                      state is TableMasterActionInProgress ? null : _onSubmit,
                  child: state is TableMasterActionInProgress
                      ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 1.2,
                          ),
                        )
                      : const TextActionL(
                          "SIMPAN",
                          color: TColors.primary,
                        ),
                );
              }),
            ],
            // bottom: PreferredSize(
            //   preferredSize: Size.fromHeight(48.0),
            //   child: ResponsiveLayout(
            //     mobile: TabContainer(
            //       tabs: [
            //         TabItem(title: "Info Meja"),
            //         TabItem(title: "QR Order")
            //       ],
            //     ),
            //     tablet: SizedBox.shrink(),
            //   ),
            // ),
          ),
          body: SingleChildScrollView(
            child: BlocBuilder<TableMasterCubit, TableMasterState>(
                builder: (context, state) {
              return SingleChildScrollView(
                padding: EdgeInsets.only(top: 16),
                child: TableInformationForm(
                  formKey: _formKey,
                  table: dummyTableModel,
                  tableNumber: dummyTableModel.no,
                  isLoading: state is TableMasterActionInProgress,
                  onSubmit: () => _onSubmit(),
                ),
              );
            }),
          ),

          // ResponsiveLayout(
          //   mobile: TabBarView(
          //     children: [
          //       SingleChildScrollView(
          //         padding: EdgeInsets.only(top: 16),
          //         child: TableInformationForm(
          //           formKey: _formKey,
          //           tableNumber: dummyTableModel.no,
          //           table: dummyTableModel,
          //         ),
          //       ),
          //       TableQrOrderTab(),
          //     ],
          //   ),
          //   tablet: SingleChildScrollView(
          //     padding: EdgeInsets.fromLTRB(0, 16, 40, 16),
          //     child: BlocBuilder<TableMasterCubit, TableMasterState>(
          //         builder: (context, state) {
          //       return SingleChildScrollView(
          //         padding: EdgeInsets.only(top: 16),
          //         child: TableInformationForm(
          //           formKey: _formKey,
          //           table: dummyTableModel,
          //           tableNumber: dummyTableModel.no,
          //           isLoading: state is TableMasterActionInProgress,
          //           onSubmit: () => _onSubmit(),
          //         ),
          //       );
          //     }),
          //   ),
          // ),
        ),
      ),
    );
  }
}

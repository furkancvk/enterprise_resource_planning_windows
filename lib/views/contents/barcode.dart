import 'package:erp_windows/models/app_material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../design/app_colors.dart';
import '../../design/app_text.dart';
import '../../packages/edited_advanced_PDT.dart';
import '../../packages/edited_advanced_datatable_source.dart';
import '../../states/states.dart';
import '../../widgets/app_form.dart';

class Barcode extends StatefulWidget {
  const Barcode({Key? key}) : super(key: key);

  @override
  State<Barcode> createState() => _BarcodeState();
}

class _BarcodeState extends State<Barcode> {
  List<bool> selected = List<bool>.generate(10, (int index) => false);
  int? sortColumnIndex;
  bool isAscending = false;
  List<AppMaterial> materialStock = [
    AppMaterial(materialId: 13, referenceNumber: 3315, imageUrl: '', materialName: 'Gizli Ayak', typeName: '12CM', unitName: 'Adet', amount: 200, colorName: 'Kahverengi', sizeName: '24', description: '', createdAt: '16/08/2022', updatedAt: ''),
    AppMaterial(materialId: 14, referenceNumber: 1, imageUrl: '', materialName: 'Vida', typeName: '14CM', unitName: 'Torba', amount: 400, colorName: '', sizeName: '', description: '', createdAt: '17/08/2022', updatedAt: ''),
    AppMaterial(materialId: 15, referenceNumber: 2, imageUrl: '', materialName: 'Kumaş', typeName: '5', unitName: 'CM2', amount: 1000, colorName: 'Sarı', sizeName: '', description: '', createdAt: '16/08/2002', updatedAt: ''),
    AppMaterial(materialId: 16, referenceNumber: 3, imageUrl: '', materialName: 'İskelet', typeName: 'a', unitName: 'Adet', amount: 20, colorName: '', sizeName: '', description: '', createdAt: '18/08/2022', updatedAt: ''),
  ];

  var rowsPerPage = AdvancedPaginatedDataTable.defaultRowsPerPage;

  @override
  Widget build(BuildContext context) {
    final source = ExampleSource(context, materialStock);

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(FluentIcons.barcode_scanner_24_regular),
        title: const Text("Etiket"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.lightSecondary,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6.9),
                            decoration: BoxDecoration(
                              color: AppColors.lightSecondary,
                              border: Border.all(color: AppColors.lightPrimary),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: PopupMenuButton<int>(
                              tooltip: "Toplu İşlemler",
                              padding: const EdgeInsets.all(8),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  onTap: () {},
                                  value: 1,
                                  child: Row(
                                    children: [
                                      const Icon(
                                        FluentIcons.person_28_regular,
                                        color: AppColors.lightPrimary,
                                      ),
                                      const SizedBox(width: 10),
                                      Text("Profil",
                                          style: AppText.contextSemiBold),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  onTap: () {},
                                  value: 2,
                                  child: Row(
                                    children: [
                                      const Icon(
                                        FluentIcons.settings_24_regular,
                                        color: AppColors.lightPrimary,
                                      ),
                                      const SizedBox(width: 10),
                                      Text("Ayarlar",
                                          style: AppText.contextSemiBold),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  onTap: () {},
                                  value: 3,
                                  child: Row(
                                    children: [
                                      const Icon(
                                        FluentIcons.chat_help_24_regular,
                                        color: AppColors.lightPrimary,
                                      ),
                                      const SizedBox(width: 10),
                                      Text("Yardım",
                                          style: AppText.contextSemiBold),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  onTap: () {},
                                  value: 4,
                                  child: Row(
                                    children: [
                                      const Icon(
                                        FluentIcons.arrow_exit_20_regular,
                                        color: AppColors.lightPrimary,
                                      ),
                                      const SizedBox(width: 10),
                                      Text("Çıkış Yap",
                                          style: AppText.contextSemiBold),
                                    ],
                                  ),
                                )
                              ],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: const BorderSide(color: AppColors.lightPrimary),
                              ),
                              splashRadius: 20,
                              offset: const Offset(0, 44),
                              color: AppColors.lightSecondary,
                              elevation: 0,
                              child: Row(
                                children: [
                                  const Icon(FluentIcons.options_16_filled,color: AppColors.lightPrimary),
                                  const SizedBox(width: 16),
                                  Text("Toplu İşlemler", style: AppText.contextSemiBoldBlue),
                                  const SizedBox(width: 16),
                                  const Icon(FluentIcons.chevron_down_12_regular, size: 20),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(FluentIcons.database_search_24_regular),
                            label: const Text("Dışa Aktar"),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 300,
                            height: 40,
                            child: AppForm.appAutoCompleteTextFormFieldForSearch(
                              hint: "Ara...",
                              controller: TextEditingController(),
                              key: GlobalKey(),
                              suggestions: [],
                            ),
                          ),
                          OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(FluentIcons.filter_24_regular),
                            label: const Text("Filtrele",style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.4,
                              color: AppColors.lightPrimary,
                            )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                AdvancedPaginatedDataTable(
                  sortAscending: isAscending,
                  sortColumnIndex: sortColumnIndex,
                  /*customTableFooter: ,*/
                  addEmptyRows: false,
                  source: source,
                  showFirstLastButtons: true,
                  rowsPerPage: rowsPerPage,
                  availableRowsPerPage: const [10, 16, 20, 56],
                  onRowsPerPageChanged: (newRowsPerPage) {
                    if (newRowsPerPage != null) {
                      setState(() {
                        rowsPerPage = newRowsPerPage;
                      });
                    }
                  },
                  columns: [
                    DataColumn(label: Text('Barkod', style: AppText.contextSemiBoldBlue),onSort: onSort),
                    DataColumn(label: Text('Görsel', style: AppText.contextSemiBoldBlue)),
                    DataColumn(label: Text('İsim', style: AppText.contextSemiBoldBlue),onSort: onSort),
                    DataColumn(label: Text('Cins', style: AppText.contextSemiBoldBlue),onSort: onSort),
                    DataColumn(label: Text('Renk', style: AppText.contextSemiBoldBlue),onSort: onSort),
                    DataColumn(label: Text('Boyut', style: AppText.contextSemiBoldBlue),onSort: onSort),
                    DataColumn(label: Text('Miktar', style: AppText.contextSemiBoldBlue)),
                    DataColumn(label: Text('İşlemler', style: AppText.contextSemiBoldBlue)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  ///Sorting Functions ///zortlamıyor sııkıntı gadaaaaaaaaasss
  void onSort(int columnIndex, bool ascending) {
    if(columnIndex == 0){
      materialStock.sort((material1, material2) => compareString(ascending, material1.referenceNumber.toString(), material1.referenceNumber.toString()));
    }else if(columnIndex == 2){
      materialStock.sort((material1, material2) => compareString(ascending, material1.materialName, material1.materialName));
    }else if(columnIndex == 3){
      materialStock.sort((material1, material2) => compareString(ascending, material1.typeName, material1.typeName));
    }else if(columnIndex == 4){
      materialStock.sort((material1, material2) => compareString(ascending, material1.colorName, material1.colorName));
    }else if(columnIndex == 5){
      materialStock.sort((material1, material2) => compareString(ascending, material1.sizeName, material1.sizeName));
    }
    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }
}

int compareString(bool ascending, String value1, String value2) {return ascending ? value1.compareTo(value2) : value2.compareTo(value1);}

///Sorting işlemleri bitiş
///DataTable Source Kısmı
class RowData {
  final int index;
  final String value;

  RowData(this.index, this.value);
}

class ExampleSource extends AdvancedDataTableSource<RowData> {
  final data = List<RowData>.generate(30, (index) => RowData(index+1, 'Value for no. ${index+1}'));
  final List<AppMaterial> materialStock;

  ExampleSource(this.context, this.materialStock);

  final BuildContext context;

  @override
  DataRow? getRow(int index) {
    Function setMaterialSelectedRows = Provider.of<States>(context).setMaterialSelectedRows;
    List<int> materialSelectedRows = Provider.of<States>(context).materialSelectedRows;

    final currentRowData = materialStock[index];
    return DataRow(
      selected: materialSelectedRows.contains(currentRowData.materialId) ? true : false,
      onSelectChanged: (value) {
        setMaterialSelectedRows(currentRowData.materialId);
      },
      cells: [
        DataCell(
          Text(currentRowData.referenceNumber.toString(), style: AppText.context),
        ),
        DataCell(
          Text(currentRowData.imageUrl, style: AppText.context),
        ),
        DataCell(
          Text(currentRowData.materialName , style: AppText.context),
        ),
        DataCell(
          Text(currentRowData.typeName, style: AppText.context),
        ),
        DataCell(
          Text(currentRowData.colorName, style: AppText.context),
        ),
        DataCell(
          Text(currentRowData.sizeName, style: AppText.context),
        ),
        DataCell(
            IncDecInput(controller: TextEditingController()),
        ),
        DataCell(
            Row(
              children: [
                OutlinedButton(
                    onPressed: (){
                      print('printe basıldı');
                    },
                    child: Row(
                      children:
                      const[
                        Icon(FluentIcons.print_20_regular, color: AppColors.lightPrimary),
                        SizedBox(width: 8),
                        Text('Yazdır', style: TextStyle(color: AppColors.lightPrimary),
                        )],
                    )),
                IconButton(onPressed: (){print('icon butona basıldı');}, icon: const Icon(FluentIcons.more_vertical_20_regular, color: AppColors.lightPrimary), splashRadius: 20,)
              ],
            )
        ), /// İşlem butonlarına popUpButtonları konucak
      ],
      color: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {return AppColors.lightPrimary.withOpacity(0.5);}
            if (index.isEven) {return AppColors.lightPrimary.withOpacity(0.08);}
            return null;
          }),
    );
  }

  @override
  int get selectedRowCount => 0;

  @override
  Future<RemoteDataSourceDetails<RowData>> getNextPage(NextPageRequest pageRequest) async {
    return RemoteDataSourceDetails(
      materialStock.length,
      data
          .skip(pageRequest.offset)
          .take(pageRequest.pageSize)
          .toList(),
    );
  }
}
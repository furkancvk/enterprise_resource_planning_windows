import 'package:erp_windows/utils/helpers.dart';
import 'package:erp_windows/views/modals/update_material.dart';
import 'package:erp_windows/widgets/app_cards.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../design/app_colors.dart';
import '../../../design/app_text.dart';
import '../../../models/app_material.dart';
import '../../../packages/edited_advanced_PDT.dart';
import '../../../packages/edited_advanced_datatable_source.dart';
import '../../../services/base_service.dart';
import '../../../services/material_service.dart';
import '../../../states/states.dart';
import '../../../widgets/app_alerts.dart';
import '../../../widgets/app_form.dart';
import '../../modals/export_data.dart';

class StockMaterial extends StatefulWidget {
  const StockMaterial({Key? key}) : super(key: key);

  @override
  State<StockMaterial> createState() => _StockMaterialState();
}

class _StockMaterialState extends State<StockMaterial> {
  final TextEditingController searchQueryController = TextEditingController();

  int? sortColumnIndex;
  bool isAscending = false;
  var rowsPerPage = AdvancedPaginatedDataTable.defaultRowsPerPage;

  String filterName = '';

  List<AppMaterial> materials = [];
  bool isNotFound = false;

  bool isLoading = true;

  void getAllMaterial() {
    MaterialService.getAllMaterial().then((value) => {
      if(value["success"]) {
        for(var data in value["data"]) {
          materials.add(AppMaterial.fromJson(data)),
        },
        if(value["data"].isEmpty) isNotFound = true,
        isLoading = false,
        setState(() {}),
      }
    });
  }

  void onSort(int columnIndex, bool ascending) {
    if(columnIndex == 1){materials.sort((material1, material2) => compareString(ascending, material1.materialName, material2.materialName));
    }else if(columnIndex == 2){materials.sort((material1, material2) => compareString(ascending, material1.typeName, material2.typeName));
    }else if(columnIndex == 3){materials.sort((material1, material2) => compareString(ascending, material1.colorName, material2.colorName));
    }else if(columnIndex == 6){///Stok durumuna göre değişmeli burasımaterials.sort((material1, material2) => compareString(ascending, material1.amount.toString(), material2.amount.toString()));
    }
    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) {
    return ascending ? value1.compareTo(value2) : value2.compareTo(value1);
  }

  void showExportDataModal(List<AppMaterial> dataList) {
    const tableHeaders = ['İsim', 'Cins', 'Renk', 'Boyut', 'Miktar', 'Stok Durumu'];

    List<dynamic> buildRow(int index) {
      List<dynamic> row = [
        Helpers.titleCase(dataList[index].materialName),
        Helpers.titleCase(dataList[index].typeName),
        Helpers.titleCase(dataList[index].colorName),
        Helpers.titleCase(dataList[index].sizeName),
        "${dataList[index].amount} ${Helpers.titleCase(dataList[index].unitName)}",
        dataList[index].amount > 100 ? (dataList[index].amount <= 300 ? 'Kritik' : 'Yeterli') : 'Yetersiz',
      ];

      return row;
    }

    showDialog(
      context: context,
      builder: (context) {
        return ExportData(
          title: "Hammadde Stok Tablosu",
          dataList: dataList,
          tableHeaders: tableHeaders,
          buildRow: buildRow,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getAllMaterial();
  }

  @override
  Widget build(BuildContext context) {
    final source = StockMaterialSource(context, materials);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              FluentIcons.box_toolbox_24_regular,
              color: AppColors.lightBlack,
              size: 24,
            ),
            const SizedBox(width: 16),
            Text("Stok", style: AppText.titleSemiBold,),
            const SizedBox(width: 20),
            const Icon(
              FluentIcons.chevron_right_16_filled,
              color: AppColors.lightBlack,
              size: 20,
            ),
            const SizedBox(width: 20),
            Text("Hammadde", style: AppText.titleSemiBold),
          ],
        ),
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
                                  value: 2,
                                  child: Row(
                                    children: [
                                      const Icon(
                                        FluentIcons.edit_24_regular,
                                        color: AppColors.lightPrimary,
                                      ),
                                      const SizedBox(width: 10),
                                      Text("Düzenle", style: AppText.contextSemiBold),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  onTap: () {},
                                  value: 1,
                                  child: Row(
                                    children: [
                                      const Icon(
                                        FluentIcons.delete_24_regular,
                                        color: AppColors.lightPrimary,
                                      ),
                                      const SizedBox(width: 10),
                                      Text("Sil", style: AppText.contextSemiBold),
                                    ],
                                  ),
                                ),
                              ],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: const BorderSide(color: AppColors.lightPrimary),
                              ),
                              splashRadius: 20,
                              offset: const Offset(18, 34),
                              color: AppColors.lightSecondary,
                              elevation: 0,
                              child: Row(
                                children: [
                                  const Icon(FluentIcons.options_24_regular,color: AppColors.lightPrimary),
                                  const SizedBox(width: 16),
                                  Text("Toplu İşlemler", style: AppText.contextSemiBoldBlue),
                                  const SizedBox(width: 16),
                                  const Icon(FluentIcons.chevron_down_24_filled, size: 20, color: AppColors.lightPrimary),
                                ],
                              ),
                            ),
                          ),
                          // DropdownButtonFormField()
                          const SizedBox(width: 16),
                          OutlinedButton.icon(
                            onPressed: () {showExportDataModal(materials);},
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
                            child: TextFormField(
                              controller: searchQueryController,
                              onChanged: (query) => source.filterClientSide(searchQueryController.text, filterName),
                              decoration: const InputDecoration(
                                suffixIcon: Icon(FluentIcons.search_24_filled, color: AppColors.lightPrimary),
                                hintText: "Ara...",
                              ),
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
                const SizedBox(height: 16),
                if(isLoading) const Text("Yükleniyor"),
                if(isNotFound) AppAlerts.info("Herhangi bir kayıt bulunamadı."),
                if(materials.isNotEmpty) AdvancedPaginatedDataTable(
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
                    DataColumn(label: Text('Görsel', style: AppText.contextSemiBoldBlue)),
                    DataColumn(label: Text('İsim', style: AppText.contextSemiBoldBlue),onSort: onSort),
                    DataColumn(label: Text('Cins', style: AppText.contextSemiBoldBlue),onSort: onSort),
                    DataColumn(label: Text('Renk', style: AppText.contextSemiBoldBlue),onSort: onSort),
                    DataColumn(label: Text('Boyut', style: AppText.contextSemiBoldBlue)),
                    DataColumn(label: Text('Miktar', style: AppText.contextSemiBoldBlue)),
                    DataColumn(label: Text('Stok Durumu', style: AppText.contextSemiBoldBlue),onSort: onSort),
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
}

class StockMaterialSource extends AdvancedDataTableSource<AppMaterial> {
  StockMaterialSource(this.context, this.materials);

  final List<AppMaterial> materials;
  final BuildContext context;

  String searchQuery = '';
  String filterName = '';

  @override
  DataRow? getRow(int index) {
    Function setMaterialSelectedRows = Provider.of<States>(context).setMaterialSelectedRows;
    List<int> materialSelectedRows = Provider.of<States>(context).materialSelectedRows;

    final material = materials.where((element) {
      switch(filterName) {
        case 'typeName': {
          return element.typeName.contains(searchQuery);
        }
        case 'colorName': {
          return element.colorName.contains(searchQuery);
        }
        case 'sizeName': {
          return element.sizeName.contains(searchQuery);
        }
        case 'amount': {
          return element.amount.toString().contains(searchQuery);
        }
        default: {
          return element.materialName.contains(searchQuery);
        }
      }
    }).toList()[index];

    // String imageUrl = "${"${BaseService.baseUrl}/images/materials/${material.materialId}"}/${material.imageUrl}";

    String imageUrl = "${BaseService.baseUrl}/api/v1/images/materials/${material.materialId}";

    return DataRow(
      selected: materialSelectedRows.contains(material.materialId) ? true : false,
      onSelectChanged: (value) {
        setMaterialSelectedRows(material.materialId);
      },
      cells: [
        DataCell(
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              /*image: const DecorationImage(
                image: AssetImage("assets/images/placeholder-image.jpg"),
                fit: BoxFit.cover,
              ),*/
              image: material.imageName.isEmpty ? const DecorationImage(
                image: AssetImage("assets/images/placeholder-image.jpg"),
                fit: BoxFit.cover,
              ) : DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        DataCell(
          Text(
            Helpers.titleCase(material.materialName),
            style: AppText.context,
          ),
        ),
        DataCell(
          Text(
            Helpers.titleCase(material.typeName),
            style: AppText.context,
          ),
        ),
        DataCell(
          Text(
            Helpers.titleCase(material.colorName),
            style: AppText.context,
          ),
        ),
        DataCell(
          Text(
            material.sizeName,
            style: AppText.context,
          ),
        ),
        DataCell(
          Text(
            "${material.amount} ${Helpers.titleCase(material.unitName)}",
            style: AppText.context,
          ),
        ),
        DataCell(
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: AppCards.stockSituationCard(
                color: material.amount > 100 ? (material.amount <= 300 ? AppColors.lightWarning : AppColors.lightSuccess) : AppColors.lightError,
                data: material.amount > 100 ? (material.amount <= 300 ? 'Kritik' : 'Yeterli') : 'Yetersiz',
              ),
            )
        ), ///Yeterli-Kritik-Yetersiz değerleri dinamik yapılcak
        DataCell(
            Row(
              children: [
                IconButton(onPressed: (){
                  print('edited');
                  showDialog(context: context, builder: (context) =>  UpdateMaterial(material: material));
                }, icon: const Icon(FluentIcons.edit_16_regular, color: AppColors.lightPrimary), splashRadius: 20),
                IconButton(onPressed: (){print('deleted');}, icon: const Icon(FluentIcons.delete_16_regular, color: AppColors.lightPrimary), splashRadius: 20),
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

  void filterClientSide(String filterQuery, String filter) {
    searchQuery = filterQuery.toLowerCase().trim();
    filterName = filter;
    setNextView();
  }

  @override
  int get selectedRowCount => 0;

  @override
  Future<RemoteDataSourceDetails<AppMaterial>> getNextPage(NextPageRequest pageRequest) async {
    List<AppMaterial> filteredMaterials = materials.where((element) {
      switch(filterName) {
        case 'typeName': {
          return element.typeName.contains(searchQuery);
        }
        case 'colorName': {
          return element.colorName.contains(searchQuery);
        }
        case 'sizeName': {
          return element.sizeName.contains(searchQuery);
        }
        case 'amount': {
          return element.amount.toString().contains(searchQuery);
        }
        default: {
          return element.materialName.contains(searchQuery);
        }
      }
    }).toList();

    return RemoteDataSourceDetails(
      filteredMaterials.length,
      filteredMaterials
          .skip(pageRequest.offset)
          .take(pageRequest.pageSize)
          .toList(),
      filteredRows: searchQuery.isNotEmpty ? filteredMaterials.length : null,
    );
  }
}
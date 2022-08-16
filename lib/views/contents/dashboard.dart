

import 'package:erp_windows/models/app_material.dart';
import 'package:erp_windows/models/user.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';


import '../../design/app_colors.dart';
import '../../design/app_text.dart';
import '../../models/app_process.dart';
import '../../packages/edited_advanced_PDT.dart';
import '../../packages/edited_advanced_datatable_source.dart';
import '../../states/states.dart';
import '../../widgets/app_cards.dart';
import '../../widgets/app_form.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<bool> selected = List<bool>.generate(10, (int index) => false);
  int? sortColumnIndex;
  bool isAscending = false;
  List<AppProcess> processHistory = [
    AppProcess(processId: 1, user: User(userId: 2, username: 'abdulakdireyigül', firstName: 'abdulkadir', lastName: 'eyigül', email: 'abulkadir@gmail.com', password: 'test123', phoneNumber: '5054718110', departmentName: 'Depo', imageUrl: '', isAdmin: true, createdAt: '08/08/2022', updatedAt: '09/08/2022'), material: AppMaterial(materialId: 24, referenceNumber: 56, imageUrl: '', materialName: 'Gizli Ayak', typeName: '24 CM', unitName: 'Adet', amount: 500, colorName: 'Kahverengi', sizeName: 'Uzun', description: '', createdAt: '05/08/2022', updatedAt: '06/08/2022'), amount: 200, processTypeName: 'Giriş', createdAt: '16/08/2022', updatedAt: '17/08/2022'),
    AppProcess(processId: 2, user: User(userId: 3, username: 'furkancevik', firstName: 'Furkan', lastName: 'Çevik', email: 'furkan@gmail.com', password: 'test123', phoneNumber: '5063045562', departmentName: 'Transfer', imageUrl: '', isAdmin: false, createdAt: '02/08/2022', updatedAt: '04/08/2022'), material: AppMaterial(materialId: 25, referenceNumber: 99, imageUrl: '', materialName: 'Kumaş', typeName: '344', unitName: 'CM3', amount: 422, colorName: 'siyah', sizeName: '', description: '', createdAt: '05/08/2022', updatedAt: '05/08/2022'), amount: 250, processTypeName: 'Çıkış', createdAt: '05/08/2022', updatedAt: '05/08/2022'),
  ];
  var rowsPerPage = AdvancedPaginatedDataTable.defaultRowsPerPage;

  @override
  Widget build(BuildContext context) {
    Function setIndexTabBar = Provider.of<States>(context).setIndexTabBar;
    int indexTabBar = Provider.of<States>(context).indexTabBar;

    final source = ExampleSource(context, processHistory);

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(FluentIcons.board_24_regular),
        title: const Text("Panel"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppCards.panelDataCard(
                  icon: FluentIcons.people_team_24_regular,
                  label: "Toplam Personel",
                  data: "5",
                  color: AppColors.lightBlack,
                ),
                const SizedBox(width: 30),
                AppCards.panelDataCard(
                  icon: FluentIcons.apps_24_regular,
                  label: "Toplam Hammadde",
                  data: "3,456",
                  color: AppColors.lightBlack,
                ),
                const SizedBox(width: 30),
                AppCards.panelDataCard(
                  icon: FluentIcons.cube_24_regular,
                  label: "Toplam Bitmiş Ürün",
                  data: "217",
                  color: AppColors.lightBlack,
                ),
                const SizedBox(width: 30),
                AppCards.panelDataCard(
                  icon: FluentIcons.warning_24_regular,
                  label: "Yetersiz Stok",
                  data: "12",
                  color: AppColors.lightError,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Container(
                width: 350,
                height: 500,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.lightSecondary,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TableCalendar(
                  focusedDay: DateTime.now(),
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  rowHeight: 40,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: SizedBox(
                  height: 500,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextButton(
                            onPressed: (){setIndexTabBar(0);},
                            style: TextButton.styleFrom(
                              backgroundColor: indexTabBar == 0 ? AppColors.lightSecondary : AppColors.lightPrimary.withOpacity(0.04),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4),
                                ),
                              ),
                            ),
                            child: Text('Yapılacaklar', style: AppText.titleSemiBold),
                          ),
                          TextButton(
                            onPressed: (){setIndexTabBar(1);},
                            style: TextButton.styleFrom(
                              backgroundColor: indexTabBar == 1 ? AppColors.lightSecondary : AppColors.lightPrimary.withOpacity(0.04),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4),
                                ),
                              ),
                            ),
                            child: Text('İşlemde', style: AppText.titleSemiBold),
                          ),
                          TextButton(
                            onPressed: (){setIndexTabBar(2);},
                            style: TextButton.styleFrom(
                              backgroundColor: indexTabBar == 2 ? AppColors.lightSecondary : AppColors.lightPrimary.withOpacity(0.04),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4),
                                ),
                              ),
                            ),
                            child: Text('Tamamlandı', style: AppText.titleSemiBold),
                          )
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 456,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.lightSecondary,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: indexTabBar == 0 ? const ToDo() : (indexTabBar == 1 ? const InProgress() : const Completed()),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
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
                    DataColumn(label: Text('İsim', style: AppText.contextSemiBoldBlue),onSort: onSort),
                    DataColumn(label: Text('Soyisim', style: AppText.contextSemiBoldBlue),onSort: onSort),
                    DataColumn(label: Text('Birim', style: AppText.contextSemiBoldBlue),onSort: onSort),
                    DataColumn(label: Text('Materyal', style: AppText.contextSemiBoldBlue),onSort: onSort),
                    DataColumn(label: Text('Miktar', style: AppText.contextSemiBoldBlue)),
                    DataColumn(label: Text('İşlem Türü', style: AppText.contextSemiBoldBlue),onSort: onSort),
                    DataColumn(label: Text('Tarih', style: AppText.contextSemiBoldBlue),onSort: onSort),
                    DataColumn(label: Text('Saat', style: AppText.contextSemiBoldBlue),onSort: onSort),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

///Sorting Functions
  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0){
      processHistory.sort((process1, process2) => compareString(ascending, process1.user.firstName, process2.user.firstName));
    }else if(columnIndex == 1){
      processHistory.sort((process1, process2) => compareString(ascending, process1.user.lastName, process2.user.lastName));
    }else if(columnIndex == 2){
      processHistory.sort((process1, process2) => compareString(ascending, process1.user.departmentName, process2.user.departmentName));
    }else if(columnIndex == 3){
      processHistory.sort((process1, process2) => compareString(ascending, process1.material.materialName, process2.material.materialName));
    }else if(columnIndex == 5){
      processHistory.sort((process1, process2) => compareString(ascending, process1.processTypeName, process2.processTypeName));
    }else if(columnIndex == 6){
      processHistory.sort((process1, process2) => compareString(ascending, process1.createdAt, process2.createdAt));
    }else if(columnIndex == 7){
      processHistory.sort((process1, process2) => compareString(ascending, process1.updatedAt, process2.user.updatedAt));
    }
    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }
}
  int compareString(bool ascending, String value1, String value2) {return ascending ? value1.compareTo(value2) : value2.compareTo(value1);}

///Sorting işlemleri bitiş


class ToDo extends StatelessWidget {
  const ToDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(FluentIcons.database_search_24_regular),
              label: const Text("Dışa Aktar"),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(FluentIcons.add_24_regular),
              label: const Text("Yeni Görev Ekle"),
            ),
          ],
        ),
        const SizedBox(height: 24),
        AppCards.taskCard(
          color: AppColors.lightError,
          title: "Yapılacaklar",
          task: "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir.",
          date: "03/08/2022",
          fullName: "Burak Yalnız",
        ),
        const SizedBox(height: 16),
        AppCards.taskCard(
          color: AppColors.lightWarning,
          title: "Başlık",
          task: "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir.",
          date: "03/08/2022",
          fullName: "Burak Yalnız",
        ),
      ],
    );
  }
}

class InProgress extends StatelessWidget {
  const InProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(FluentIcons.database_search_24_regular),
              label: const Text("Dışa Aktar"),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(FluentIcons.add_24_regular),
              label: const Text("Yeni Görev Ekle"),
            ),
          ],
        ),
        const SizedBox(height: 24),
        AppCards.taskCard(
          color: AppColors.lightSuccess,
          title: "İşlemde",
          task: "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir.",
          date: "03/08/2022",
          fullName: "Burak Yalnız",
        ),
      ],
    );
  }
}

class Completed extends StatelessWidget {
  const Completed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(FluentIcons.database_search_24_regular),
              label: const Text("Dışa Aktar"),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(FluentIcons.add_24_regular),
              label: const Text("Yeni Görev Ekle"),
            ),
          ],
        ),
        const SizedBox(height: 24),
        AppCards.taskCard(
          color: AppColors.lightWarning,
          title: "Tamamlandı",
          task: "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir.",
          date: "03/08/2022",
          fullName: "Burak Yalnız",
        ),
      ],
    );
  }
}

///DataTable Source Kısmı
class RowData {
  final int index;
  final String value;

  RowData(this.index, this.value);
}

class ExampleSource extends AdvancedDataTableSource<RowData> {
  final data = List<RowData>.generate(30, (index) => RowData(index+1, 'Value for no. ${index+1}'));
  final List<AppProcess> processHistory;

  ExampleSource(this.context, this.processHistory);

  final BuildContext context;

  @override
  DataRow? getRow(int index) {
    Function setProcessSelectedRows = Provider.of<States>(context).setProcessSelectedRows;
    List<int> processSelectedRows = Provider.of<States>(context).processSelectedRows;

    final currentRowData = processHistory[index];
    return DataRow(
      selected: processSelectedRows.contains(currentRowData.processId) ? true : false,
      onSelectChanged: (value) {
        setProcessSelectedRows(currentRowData.processId);
      },
      cells: [
        DataCell(
          Text(currentRowData.user.firstName, style: AppText.context),
        ),
        DataCell(
          Text(currentRowData.user.lastName , style: AppText.context),
        ),
        DataCell(
          Text(currentRowData.user.departmentName, style: AppText.context),
        ),
        DataCell(
          Text(currentRowData.material.materialName, style: AppText.context),
        ),
        DataCell(
          Text(currentRowData.amount.toString(), style: AppText.context),
        ),
        DataCell(
          Text(currentRowData.processTypeName, style: AppText.context),
        ),
        DataCell(
          Text(currentRowData.createdAt, style: AppText.context),
        ),
        DataCell(
          Text(currentRowData.updatedAt, style: AppText.context),
        ),
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
      processHistory.length,
      data
          .skip(pageRequest.offset)
          .take(pageRequest.pageSize)
          .toList(), //again in a real world example you would only get the right amount of rows
    );
  }
}

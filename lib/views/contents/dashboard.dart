import 'package:erp_windows/models/app_material.dart';
import 'package:erp_windows/services/process_service.dart';
import 'package:erp_windows/utils/helpers.dart';
import 'package:erp_windows/views/modals/notes.dart';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

import '../../design/app_colors.dart';
import '../../design/app_text.dart';
import '../../models/app_process.dart';
import '../../packages/edited_advanced_PDT.dart';
import '../../packages/edited_advanced_datatable_source.dart';
import '../../services/employee_service.dart';
import '../../services/material_service.dart';
import '../../states/states.dart';
import '../../storage/storage.dart';
import '../../widgets/app_alerts.dart';
import '../../widgets/app_cards.dart';
import '../../widgets/app_form.dart';
import '../modals/export_data.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  static SecureStorage secureStorage = SecureStorage();
  int? sortColumnIndex;
  bool isAscending = false;
  var rowsPerPage = AdvancedPaginatedDataTable.defaultRowsPerPage;
  List tasks = [];
  String input = "";
  List<AppProcess> processes = [];

  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Function setIndexTabBar = Provider.of<States>(context).setIndexTabBar;
    int indexTabBar = Provider.of<States>(context).indexTabBar;

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
                FutureBuilder(
                  future: getAllEmployee(),
                  builder:
                      (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                    if (snapshot.data != null) {
                      return AppCards.panelDataCard(
                        icon: FluentIcons.people_team_24_regular,
                        label: "Toplam Personel",
                        data: snapshot.data!["data"].length.toString(),
                        color: AppColors.lightBlack,
                      );
                    } else {
                      return AppCards.panelDataCard(
                        icon: FluentIcons.people_team_24_regular,
                        label: "Toplam Personel",
                        data: "0",
                        color: AppColors.lightBlack,
                      );
                    }
                  },
                ),
                const SizedBox(width: 30),
                FutureBuilder(
                  future: getAllMaterials(),
                  builder:
                      (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                    if (snapshot.data != null) {
                      return AppCards.panelDataCard(
                        icon: FluentIcons.apps_24_regular,
                        label: "Toplam Hammadde",
                        data: snapshot.data!["data"].length.toString(),
                        color: AppColors.lightBlack,
                      );
                    } else {
                      return AppCards.panelDataCard(
                        icon: FluentIcons.apps_24_regular,
                        label: "Toplam Hammadde",
                        data: "0",
                        color: AppColors.lightBlack,
                      );
                    }
                  },
                ),
                const SizedBox(width: 30),
                AppCards.panelDataCard(
                  icon: FluentIcons.cube_24_regular,
                  label: "Toplam Bitmiş Ürün",
                  data: "217",
                  color: AppColors.lightBlack,
                ),
                const SizedBox(width: 30),
                FutureBuilder(
                  future: getAllMaterials(),
                  builder:
                      (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                    if (snapshot.data != null) {
                      List<AppMaterial> materials = List.generate(
                          snapshot.data!["data"].length,
                          (index) => AppMaterial.fromJson(
                              snapshot.data!["data"][index]));
                      materials.retainWhere((element) => element.amount <= 100);

                      return AppCards.panelDataCard(
                        icon: FluentIcons.warning_24_regular,
                        label: "Yetersiz Stok",
                        data: materials.length.toString(),
                        color: AppColors.lightError,
                      );
                    } else {
                      return AppCards.panelDataCard(
                        icon: FluentIcons.warning_24_regular,
                        label: "Yetersiz Stok",
                        data: "0",
                        color: AppColors.lightError,
                      );
                    }
                  },
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
                  onDaySelected: (DateTime selectDay, DateTime focusDay) {
                    setState(() {
                      selectedDay = selectDay;
                      focusedDay = focusDay;
                    });
                    print(focusedDay);
                  },
                  selectedDayPredicate: (DateTime date) {
                    return isSameDay(selectedDay, date);
                  },
                  focusedDay: selectedDay,
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  rowHeight: 40,
                  calendarStyle: CalendarStyle(
                    outsideDaysVisible: false,
                    rangeStartDecoration: BoxDecoration(
                        color: AppColors.lightSecondary,
                        borderRadius: BorderRadius.circular(4)),
                    rangeEndDecoration: BoxDecoration(
                        color: AppColors.lightSecondary,
                        borderRadius: BorderRadius.circular(4)),
                    disabledDecoration: BoxDecoration(
                        color: AppColors.lightSecondary,
                        borderRadius: BorderRadius.circular(4)),
                    defaultDecoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(4)),
                    weekendDecoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(4)),
                    isTodayHighlighted: true,
                    selectedDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColors.lightAccent.withOpacity(0.5)),
                    selectedTextStyle: AppText.labelSemiBold,
                    todayDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColors.lightPrimary.withOpacity(0.75)),
                    todayTextStyle: TextStyle(color: AppColors.lightSecondary),
                  ),
                  headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: AppText.headerSemiBold),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: SizedBox(
                  height: 500,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.lightSecondary,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                " NOTLARIM ",
                                style: AppText.headerSemiBold,
                                textAlign: TextAlign.center,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            Function setTasks =
                                                Provider.of<States>(context)
                                                    .setTasks;
                                            Function setInput =
                                                Provider.of<States>(context)
                                                    .setInput;
                                            return AlertDialog(
                                              title: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "Yapılacak Not Ekle",
                                                    style:
                                                        AppText.contextSemiBold,
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      icon: Icon(
                                                        Icons.close_outlined,
                                                        size: 20,
                                                      ),
                                                  splashRadius: 16,)
                                                ],
                                              ),
                                              content: Container(
                                                height: 150,
                                                width: 300,
                                                child: TextField(
                                                  maxLength: 300,
                                                  maxLines: 7,
                                                  onChanged: (String value) {
                                                    input = value;
                                                    setInput(input);
                                                  },
                                                ),
                                              ),
                                              actions: [
                                                Row(
                                                  mainAxisAlignment:MainAxisAlignment.end ,
                                                  children: [
                                                    TextButton(
                                                        onPressed: () {
                                                          if (input != "") {
                                                            setState(() {
                                                              tasks.add(input);
                                                              setTasks(tasks);
                                                            });
                                                            Navigator.of(context)
                                                                .pop();

                                                            input = "";
                                                            ScaffoldMessenger.of(
                                                                    context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(0),
                                                                content: AppAlerts
                                                                    .success(
                                                                        "Not başarıyla eklendi"),
                                                                duration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            1500),
                                                                backgroundColor:
                                                                    AppColors
                                                                        .lightSecondary,
                                                              ),
                                                            );
                                                            ;
                                                          } else {
                                                            Navigator.of(context)
                                                                .pop();
                                                            ScaffoldMessenger.of(
                                                                    context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(0),
                                                                content:
                                                                    AppAlerts.error(
                                                                        "Not alanı boş bırakılamaz"),
                                                                duration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            1500),
                                                                backgroundColor:
                                                                    AppColors
                                                                        .lightSecondary,
                                                              ),
                                                            );
                                                          }
                                                        },
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              FluentIcons
                                                                  .add_24_regular,
                                                              size: 20,color: AppColors.lightBlack,
                                                            ),
                                                            SizedBox(
                                                              width: 12,
                                                            ),
                                                            Text(
                                                              "Ekle",
                                                              style: AppText
                                                                  .titleSemiBold,
                                                            ),
                                                          ],
                                                        )),
                                                  ],
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                    icon: Icon(
                                        FluentIcons.add_circle_24_regular,
                                        color: AppColors.lightPrimary),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return NotePad();
                                          });
                                    },
                                    label: Text("Notları Aç"),
                                    icon: Icon(FluentIcons.note_24_regular),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.lightSecondary,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),

                      /*Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              setIndexTabBar(0);
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: indexTabBar == 0
                                  ? AppColors.lightSecondary
                                  : AppColors.lightPrimary.withOpacity(0.04),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4),
                                ),
                              ),
                            ),
                            child: Text('Yapılacaklar',
                                style: AppText.titleSemiBold),
                          ),
                          TextButton(
                            onPressed: () {
                              setIndexTabBar(1);
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: indexTabBar == 1
                                  ? AppColors.lightSecondary
                                  : AppColors.lightPrimary.withOpacity(0.04),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4),
                                ),
                              ),
                            ),
                            child:
                                Text('İşlemde', style: AppText.titleSemiBold),
                          ),
                          TextButton(
                            onPressed: () {
                              setIndexTabBar(2);
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: indexTabBar == 2
                                  ? AppColors.lightSecondary
                                  : AppColors.lightPrimary.withOpacity(0.04),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4),
                                ),
                              ),
                            ),
                            child: Text('Tamamlandı',
                                style: AppText.titleSemiBold),
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
                        child: indexTabBar == 0
                            ? const ToDo()
                            : (indexTabBar == 1
                                ? const InProgress()
                                : const Completed()),
                      ),*/
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
                                  value: 2,
                                  child: Row(
                                    children: [
                                      const Icon(
                                        FluentIcons.edit_24_regular,
                                        color: AppColors.lightPrimary,
                                      ),
                                      const SizedBox(width: 10),
                                      Text("Düzenle",
                                          style: AppText.contextSemiBold),
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
                                      Text("Sil",
                                          style: AppText.contextSemiBold),
                                    ],
                                  ),
                                ),
                              ],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: const BorderSide(
                                    color: AppColors.lightPrimary),
                              ),
                              splashRadius: 20,
                              offset: const Offset(18, 34),
                              color: AppColors.lightSecondary,
                              elevation: 0,
                              child: Row(
                                children: [
                                  const Icon(FluentIcons.options_24_regular,
                                      color: AppColors.lightPrimary),
                                  const SizedBox(width: 16),
                                  Text("Toplu İşlemler",
                                      style: AppText.contextSemiBoldBlue),
                                  const SizedBox(width: 16),
                                  const Icon(FluentIcons.chevron_down_24_filled,
                                      size: 20, color: AppColors.lightPrimary),
                                ],
                              ),
                            ),
                          ),
                          // DropdownButtonFormField()
                          const SizedBox(width: 16),
                          OutlinedButton.icon(
                            onPressed: () {
                              showExportDataModal(processes);
                            },
                            icon: const Icon(
                                FluentIcons.database_search_24_regular),
                            label: const Text("Dışa Aktar"),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 300,
                            height: 40,
                            child:
                                AppForm.appAutoCompleteTextFormFieldForSearch(
                              hint: "Ara...",
                              controller: TextEditingController(),
                              key: GlobalKey(),
                              suggestions: [],
                            ),
                          ),
                          OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(FluentIcons.filter_24_regular),
                            label: const Text(
                              "Filtrele",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.4,
                                color: AppColors.lightPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                FutureBuilder(
                  future: getAllProcess(),
                  builder:
                      (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.data == null) {
                      return AppAlerts.error("Herhangi bir kayıt bulunamadı.");
                    } else {
                      processes = List.generate(
                          snapshot.data!["data"].length,
                          (index) => AppProcess.fromJson(
                              snapshot.data!["data"][index]));
                      void onSort(int columnIndex, bool ascending) {
                        if (columnIndex == 0) {
                          processes.sort((process1, process2) => compareString(
                              ascending,
                              process1.user.firstName,
                              process2.user.firstName));
                        } else if (columnIndex == 1) {
                          processes.sort((process1, process2) => compareString(
                              ascending,
                              process1.user.lastName,
                              process2.user.lastName));
                        } else if (columnIndex == 2) {
                          processes.sort((process1, process2) => compareString(
                              ascending,
                              process1.user.departmentName,
                              process2.user.departmentName));
                        } else if (columnIndex == 3) {
                          processes.sort((process1, process2) => compareString(
                              ascending,
                              process1.material.materialName,
                              process2.material.materialName));
                        } else if (columnIndex == 5) {
                          processes.sort((process1, process2) => compareString(
                              ascending,
                              process1.processTypeName,
                              process2.processTypeName));
                        } else if (columnIndex == 6) {
                          processes.sort((process1, process2) => compareString(
                              ascending,
                              process1.createdAt,
                              process2.createdAt));
                        } else if (columnIndex == 7) {
                          processes.sort((process1, process2) => compareString(
                              ascending,
                              process1.updatedAt,
                              process2.user.updatedAt));
                        }
                        setState(() {
                          sortColumnIndex = columnIndex;
                          isAscending = ascending;
                        });
                      }

                      final source = DashboardSource(context, processes);
                      return AdvancedPaginatedDataTable(
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
                          DataColumn(
                              label: Text('İsim',
                                  style: AppText.contextSemiBoldBlue),
                              onSort: onSort),
                          DataColumn(
                              label: Text('Soyisim',
                                  style: AppText.contextSemiBoldBlue),
                              onSort: onSort),
                          DataColumn(
                              label: Text('Birim',
                                  style: AppText.contextSemiBoldBlue),
                              onSort: onSort),
                          DataColumn(
                              label: Text('Materyal',
                                  style: AppText.contextSemiBoldBlue),
                              onSort: onSort),
                          DataColumn(
                              label: Text('Miktar',
                                  style: AppText.contextSemiBoldBlue)),
                          DataColumn(
                              label: Text('İşlem Türü',
                                  style: AppText.contextSemiBoldBlue),
                              onSort: onSort),
                          DataColumn(
                              label: Text('Tarih',
                                  style: AppText.contextSemiBoldBlue),
                              onSort: onSort),
                          DataColumn(
                              label: Text('Saat',
                                  style: AppText.contextSemiBoldBlue),
                              onSort: onSort),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<Map<String, dynamic>> getAllEmployee() async {
    return await EmployeeService.getAllEmployee();
  }

  Future<Map<String, dynamic>> getAllMaterials() async {
    return await MaterialService.getAllMaterials();
  }

  Future<Map<String, dynamic>> getAllProcess() async {
    return await ProcessService.getAllProcess();
  }

  int compareString(bool ascending, String value1, String value2) {
    return ascending ? value1.compareTo(value2) : value2.compareTo(value1);
  }

  void showExportDataModal(List<AppProcess> dataList) {
    const tableHeaders = [
      'İsim',
      'Soyisim',
      'Birim',
      'Materyal',
      'Miktar',
      'İşlem Türü',
      'Tarih',
      'Saat'
    ];

    List<dynamic> buildRow(int index) {
      String createdDate =
          DateTime.parse(dataList[index].createdAt).toLocal().toString();
      String date = createdDate.substring(0, createdDate.indexOf(" "));
      String time = createdDate.substring(
          createdDate.indexOf(" "), createdDate.length - 7);

      List<dynamic> row = [
        Helpers.titleCase(dataList[index].user.firstName),
        Helpers.titleCase(dataList[index].user.lastName),
        Helpers.titleCase(dataList[index].user.departmentName),
        Helpers.titleCase(dataList[index].material.materialName),
        "${dataList[index].amount} ${Helpers.titleCase(dataList[index].material.unitName)}",
        Helpers.titleCase(dataList[index].processTypeName),
        date,
        time,
      ];

      return row;
    }

    showDialog(
      context: context,
      builder: (context) {
        return ExportData(
          title: "İşlem Geçmişi Tablosu",
          dataList: dataList,
          tableHeaders: tableHeaders,
          buildRow: buildRow,
        );
      },
    );
  }
}

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
          task:
              "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir.",
          date: "03/08/2022",
          fullName: "Burak Yalnız",
        ),
        const SizedBox(height: 16),
        AppCards.taskCard(
          color: AppColors.lightWarning,
          title: "Başlık",
          task:
              "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir.",
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
          task:
              "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir.",
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
          task:
              "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir.",
          date: "03/08/2022",
          fullName: "Burak Yalnız",
        ),
      ],
    );
  }
}

class DashboardSource extends AdvancedDataTableSource<AppProcess> {
  DashboardSource(this.context, this.processes);

  final List<AppProcess> processes;
  final BuildContext context;

  @override
  DataRow? getRow(int index) {
    Function setProcessSelectedRows =
        Provider.of<States>(context).setProcessSelectedRows;
    List<int> processSelectedRows =
        Provider.of<States>(context).processSelectedRows;

    final process = processes[index];

    String createdDate = DateTime.parse(process.createdAt).toLocal().toString();
    String date = createdDate.substring(0, createdDate.indexOf(" "));
    String time =
        createdDate.substring(createdDate.indexOf(" "), createdDate.length - 7);

    return DataRow(
      selected: processSelectedRows.contains(process.processId) ? true : false,
      onSelectChanged: (value) => setProcessSelectedRows(process.processId),
      cells: [
        DataCell(
          Text(
            Helpers.titleCase(process.user.firstName),
            style: AppText.context,
          ),
        ),
        DataCell(
          Text(
            Helpers.titleCase(process.user.lastName),
            style: AppText.context,
          ),
        ),
        DataCell(
          Text(
            Helpers.titleCase(process.user.departmentName),
            style: AppText.context,
          ),
        ),
        DataCell(
          Text(
            Helpers.titleCase(process.material.materialName),
            style: AppText.context,
          ),
        ),
        DataCell(
          Text(
            "${process.amount} ${Helpers.titleCase(process.material.unitName)}",
            style: AppText.context,
          ),
        ),
        DataCell(
          Text(
            Helpers.titleCase(process.processTypeName),
            style: AppText.context,
          ),
        ),
        DataCell(
          Text(
            date,
            style: AppText.context,
          ),
        ),
        DataCell(
          Text(
            time,
            style: AppText.context,
          ),
        ),
      ],
      color: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.lightPrimary.withOpacity(0.5);
        }
        if (index.isEven) {
          return AppColors.lightPrimary.withOpacity(0.08);
        }
        return null;
      }),
    );
  }

  @override
  int get selectedRowCount => 0;

  @override
  Future<RemoteDataSourceDetails<AppProcess>> getNextPage(
      NextPageRequest pageRequest) async {
    return RemoteDataSourceDetails(
      processes.length,
      processes.skip(pageRequest.offset).take(pageRequest.pageSize).toList(),
    );
  }
}

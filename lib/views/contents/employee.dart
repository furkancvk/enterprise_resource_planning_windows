import 'package:erp_windows/models/employee.dart';
import 'package:erp_windows/services/employee_service.dart';
import 'package:erp_windows/views/modals/add_employee.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../design/app_colors.dart';
import '../../design/app_text.dart';
import '../../packages/edited_advanced_PDT.dart';
import '../../packages/edited_advanced_datatable_source.dart';
import '../../services/base_service.dart';
import '../../states/states.dart';
import '../../utils/helpers.dart';
import '../../widgets/app_alerts.dart';
import '../../widgets/app_form.dart';
import '../modals/export_data.dart';

class EmployeeManagement extends StatefulWidget {
  const EmployeeManagement({Key? key}) : super(key: key);

  @override
  State<EmployeeManagement> createState() => _EmployeeManagementState();
}

class _EmployeeManagementState extends State<EmployeeManagement> {
  int? sortColumnIndex;
  bool isAscending = false;
  var rowsPerPage = AdvancedPaginatedDataTable.defaultRowsPerPage;

  List<Employee> employees = [];
  bool isNotFound = false;
  bool isLoading = true;

  void getAllEmployee() {
    EmployeeService.getAllEmployee().then((value) => {
      if(value["success"]) {
        for(var data in value["data"]) {
          employees.add(Employee.fromJson(data)),
        },
        if(value["data"].isEmpty) isNotFound = true,
        isLoading = false,
        setState(() {}),
      }
    });
  }

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 1) {
      employees.sort((employee1, employee2) => compareString(ascending, employee1.firstName, employee2.firstName));
    } else if (columnIndex == 2) {
      employees.sort((employee1, employee2) => compareString(ascending, employee1.lastName, employee2.lastName));
    } else if (columnIndex == 3) {
      employees.sort((employee1, employee2) => compareString(ascending, employee1.departmentName, employee2.departmentName));
    }
    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) {
    return ascending ? value1.compareTo(value2) : value2.compareTo(value1);
  }

  void showExportDataModal(List<Employee> dataList) {
    const tableHeaders = ['İsim', 'Soyisim', 'Birim', 'Email', 'Telefon'];

    List<dynamic> buildRow(int index) {
      List<dynamic> row = [
        Helpers.titleCase(dataList[index].firstName),
        Helpers.titleCase(dataList[index].lastName),
        Helpers.titleCase(dataList[index].departmentName),
        dataList[index].email,
        dataList[index].phoneNumber,
      ];

      return row;
    }

    showDialog(
      context: context,
      builder: (context) {
        return ExportData(
          title: "Personel Tablosu",
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
    getAllEmployee();
  }

  @override
  Widget build(BuildContext context) {
    final source = EmployeeSource(context, employees);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(FluentIcons.people_team_24_regular),
        title: const Text("Personel"),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            child: ElevatedButton.icon(
              onPressed: () => showDialog(context: context, builder: (context) => const AddEmployee()),
              icon: const Icon(FluentIcons.add_24_regular),
              label: const Text("Personel Ekle"),
            ),
          ),
        ],
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
                              ], ///Toplu İşlemler Butonu İçeriği
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
                              ), ///Toplu İşlemler Butonu
                            ),
                          ), /// Toplu İşlemler
                          const SizedBox(width: 16),
                          OutlinedButton.icon(
                            onPressed: () {showExportDataModal(employees);},
                            icon: const Icon(FluentIcons.database_search_24_regular),
                            label: const Text("Dışa Aktar"),
                          ), ///Dışa Aktar Butonu
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
                          ), ///SearchBar
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
                          ), ///Filtreleme Butonu
                        ],
                      ),
                    ],
                  ),
                ), ///Tablonun üstündeki Butonlar
                const SizedBox(height: 16),
                if(isLoading) const Text("Yükleniyor"),
                if(isNotFound) AppAlerts.info("Herhangi bir kayıt bulunamadı."),
                if(employees.isNotEmpty) AdvancedPaginatedDataTable(
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
                    DataColumn(label: Text('İsim', style: AppText.contextSemiBoldBlue), onSort: onSort),
                    DataColumn(label: Text('Soyisim', style: AppText.contextSemiBoldBlue), onSort: onSort),
                    DataColumn(label: Text('Birim', style: AppText.contextSemiBoldBlue), onSort: onSort),
                    DataColumn(label: Text('Email', style: AppText.contextSemiBoldBlue)),
                    DataColumn(label: Text('Telefon', style: AppText.contextSemiBoldBlue)),
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

class EmployeeSource extends AdvancedDataTableSource<Employee> {
  EmployeeSource(this.context, this.employees);

  final List<Employee> employees;
  final BuildContext context;

  @override
  DataRow? getRow(int index) {
    Function setEmployeeSelectedRows = Provider.of<States>(context).setEmployeeSelectedRows;
    List<int> employeeSelectedRows = Provider.of<States>(context).employeeSelectedRows;

    final employee = employees[index];

    String imageUrl = "${BaseService.baseUrl}/api/v1/images/employees/${employee.employeeId}";

    return DataRow(
      selected: employeeSelectedRows.contains(employee.employeeId) ? true : false,
      onSelectChanged: (value) => setEmployeeSelectedRows(employee.employeeId),
      cells: [
        DataCell(
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: employee.imageUrl.isEmpty ?
              const DecorationImage(
                image: AssetImage("assets/images/placeholder-image.jpg"),
                fit: BoxFit.cover,
              ) :
              DecorationImage(
                image: NetworkImage(employee.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        DataCell(
          Text(
            Helpers.titleCase(employee.firstName),
            style: AppText.context,
          ),
        ),
        DataCell(
          Text(
            Helpers.titleCase(employee.lastName),
            style: AppText.context,
          ),
        ),
        DataCell(
          Text(
            Helpers.titleCase(employee.departmentName),
            style: AppText.context,
          ),
        ),
        DataCell(
          Text(employee.email, style: AppText.context),
        ),
        DataCell(
          Text(employee.phoneNumber, style: AppText.context),
        ),
        DataCell(Row(
          children: [
            IconButton(
              onPressed: () {print('edited');},
              icon: const Icon(FluentIcons.edit_16_regular, color: AppColors.lightPrimary),
              splashRadius: 20,
            ),
            IconButton(
              onPressed: () {print('deleted');},
              icon: const Icon(FluentIcons.delete_16_regular, color: AppColors.lightPrimary),
              splashRadius: 20,
            ),
          ],
        )),
        /// İşlem butonlarına popUpButtonları konucak
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
  Future<RemoteDataSourceDetails<Employee>> getNextPage(
      NextPageRequest pageRequest) async {
    return RemoteDataSourceDetails(
      employees.length,
      employees
          .skip(pageRequest.offset)
          .take(pageRequest.pageSize)
          .toList(),
    );
  }
}

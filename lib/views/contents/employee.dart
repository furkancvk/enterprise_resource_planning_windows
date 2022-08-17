import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:erp_windows/models/employee.dart';

import '../../design/app_colors.dart';
import '../../design/app_text.dart';
import '../../packages/edited_advanced_PDT.dart';
import '../../packages/edited_advanced_datatable_source.dart';
import '../../states/states.dart';
import '../../widgets/app_form.dart';

class EmployeeManagement extends StatefulWidget {
  const EmployeeManagement({Key? key}) : super(key: key);

  @override
  State<EmployeeManagement> createState() => _EmployeeManagementState();
}

class _EmployeeManagementState extends State<EmployeeManagement> {
  List<bool> selected = List<bool>.generate(10, (int index) => false);
  int? sortColumnIndex;
  bool isAscending = false;
  List<Employee> employee = [
    Employee(employeeId: 24, firstName: 'Abdulkadir', lastName: 'Eyigül', email: 'abdulkadir@gmail.com', phoneNumber: '5054718110', departmentName: 'Transfer', imageUrl: '', isAdmin: true, createdAt: '08/08/2022', updatedAt: ''),
    Employee(employeeId: 27, firstName: 'Furkan', lastName: 'Çevik', email: 'furkan@gmail.com', phoneNumber: '5054718140', departmentName: 'Depo', imageUrl: '', isAdmin: false, createdAt: '07/08/2022', updatedAt: ''),
    Employee(employeeId: 5, firstName: 'Ömer Faruk', lastName: 'Demirsoy', email: 'omer@gmail.com', phoneNumber: '5054718150', departmentName: 'Üretim', imageUrl: '', isAdmin: true, createdAt: '07/09/2022', updatedAt: ''),
    ];

  var rowsPerPage = AdvancedPaginatedDataTable.defaultRowsPerPage;

  @override
  Widget build(BuildContext context) {
    final source = ExampleSource(context, employee);

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(FluentIcons.people_team_24_regular),
        title: const Text("Personel"),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            child: ElevatedButton.icon(
              onPressed: () {},
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
                    DataColumn(label: Text('Resim', style: AppText.contextSemiBoldBlue)),
                    DataColumn(label: Text('İsim', style: AppText.contextSemiBoldBlue),onSort: onSort),
                    DataColumn(label: Text('Soyisim', style: AppText.contextSemiBoldBlue),onSort: onSort),
                    DataColumn(label: Text('Birim', style: AppText.contextSemiBoldBlue),onSort: onSort),
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
  ///Sorting Functions
  void onSort(int columnIndex, bool ascending) {
    if(columnIndex == 1){
      employee.sort((employee1, employee2) => compareString(ascending, employee1.firstName, employee2.firstName));
    }else if(columnIndex == 2){
      employee.sort((employee1, employee2) => compareString(ascending, employee1.lastName, employee2.lastName));
    }else if(columnIndex == 3){
      employee.sort((employee1, employee2) => compareString(ascending, employee1.departmentName, employee2.departmentName));
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
  final List<Employee> employee;

  ExampleSource(this.context, this.employee);

  final BuildContext context;

  @override
  DataRow? getRow(int index) {
    Function setProcessSelectedRows = Provider.of<States>(context).setEmployeeSelectedRows;
    List<int> processSelectedRows = Provider.of<States>(context).employeeSelectedRows;

    final currentRowData = employee[index];
    return DataRow(
      selected: processSelectedRows.contains(currentRowData.employeeId) ? true : false,
      onSelectChanged: (value) {
        setProcessSelectedRows(currentRowData.employeeId);
      },
      cells: [
        DataCell(
          Text(currentRowData.imageUrl, style: AppText.context),
        ),
        DataCell(
          Text(currentRowData.firstName , style: AppText.context),
        ),
        DataCell(
          Text(currentRowData.lastName, style: AppText.context),
        ),
        DataCell(
          Text(currentRowData.departmentName, style: AppText.context),
        ),
        DataCell(
          Text(currentRowData.email, style: AppText.context),
        ),
        DataCell(
          Text(currentRowData.phoneNumber, style: AppText.context),
        ),
        DataCell(
            Row(
              children: [
                IconButton(onPressed: (){print('edited');}, icon: const Icon(FluentIcons.edit_16_regular, color: AppColors.lightPrimary), splashRadius: 20),
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

  @override
  int get selectedRowCount => 0;

  @override
  Future<RemoteDataSourceDetails<RowData>> getNextPage(NextPageRequest pageRequest) async {
    return RemoteDataSourceDetails(
      employee.length,
      data
          .skip(pageRequest.offset)
          .take(pageRequest.pageSize)
          .toList(), //again in a real world example you would only get the right amount of rows
    );
  }
}
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../design/app_colors.dart';
import '../../design/app_text.dart';
import '../../widgets/app_cards.dart';
import '../../widgets/app_form.dart';

class Employee extends StatefulWidget {
  const Employee({Key? key}) : super(key: key);

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  List<bool> selected = List<bool>.generate(10, (int index) => false);
  var isAscending = true;
  var sortColumnIndex = 0;

  @override
  Widget build(BuildContext context) {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(FluentIcons.options_24_regular),
                          label: const Text("Toplu İşlemler"),
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
                          label: const Text("Filtrele"),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: FittedBox(
                    child: DataTable(
                      sortAscending: isAscending,
                      sortColumnIndex: sortColumnIndex,
                      columns: <DataColumn>[
                        DataColumn(
                            label: Text('Görsel', style: AppText.contextSemiBoldBlue),
                            onSort: (columnIndex, ascending) {
                              print("columnIndex:$columnIndex");
                              print("ascending:$ascending");
                              setState(() {
                                sortColumnIndex = columnIndex;
                                isAscending = ascending;
                              });
                            }),
                        DataColumn(
                            label: Text('İsim', style: AppText.contextSemiBoldBlue),
                            onSort: (columnIndex, ascending) {
                              print("columnIndex:$columnIndex");
                              print("ascending:$ascending");
                              setState(() {
                                sortColumnIndex = columnIndex;
                                isAscending = ascending;
                              });
                            }),
                        DataColumn(
                            label: Text('Soyisim', style: AppText.contextSemiBoldBlue),
                            onSort: (columnIndex, ascending) {
                              print("columnIndex:$columnIndex");
                              print("ascending:$ascending");
                              setState(() {
                                sortColumnIndex = columnIndex;
                                isAscending = ascending;
                              });
                            }),
                        DataColumn(
                            label: Text('Birim', style: AppText.contextSemiBoldBlue),
                            onSort: (columnIndex, ascending) {
                              print("columnIndex:$columnIndex");
                              print("ascending:$ascending");
                              setState(() {
                                sortColumnIndex = columnIndex;
                                isAscending = ascending;
                              });
                            }),
                        DataColumn(
                            label: Text('Email', style: AppText.contextSemiBoldBlue),
                            onSort: (columnIndex, ascending) {
                              print("columnIndex:$columnIndex");
                              print("ascending:$ascending");
                              setState(() {
                                sortColumnIndex = columnIndex;
                                isAscending = ascending;
                              });
                            }),
                        DataColumn(
                            label: Text('Telefon', style: AppText.contextSemiBoldBlue),
                            onSort: (columnIndex, ascending) {
                              print("columnIndex:$columnIndex");
                              print("ascending:$ascending");
                              setState(() {
                                sortColumnIndex = columnIndex;
                                isAscending = ascending;
                              });
                            }),
                        DataColumn(
                            label:
                            Text('İşlemler', style: AppText.contextSemiBoldBlue),

                            onSort: (columnIndex, ascending) {
                              print("columnIndex:$columnIndex");
                              print("ascending:$ascending");
                              setState(() {
                                sortColumnIndex = columnIndex;
                                isAscending = ascending;
                              });
                            }),
                      ],
                      rows: List<DataRow>.generate(
                        10,
                            (int index) => DataRow(
                          color: MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                // All rows will have the same selected color.
                                if (states.contains(MaterialState.selected)) {
                                  return AppColors.lightPrimary.withOpacity(0.2);
                                }
                                // Even rows will have a grey color.
                                if (index.isEven) {
                                  return AppColors.lightPrimary.withOpacity(0.04);
                                }
                                return null; // Use default value for other states and odd rows.
                              }),
                          cells: <DataCell>[
                            DataCell(Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                  color: AppColors.lightGrey,
                                  borderRadius: BorderRadius.circular(4),
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/avatar.png'),
                                      fit: BoxFit.cover)),
                            )),
                            DataCell(Text('İsim $index', style: AppText.context)),
                            DataCell(Text('Soyisim $index', style: AppText.context)),
                            DataCell(Text('Birim $index', style: AppText.context)),
                            DataCell(Text('Email $index', style: AppText.context)),
                            DataCell(Text('Telefon $index', style: AppText.context)),
                            DataCell(Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(FluentIcons.edit_24_regular),
                                  splashRadius: 20,
                                  color: AppColors.lightPrimary,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(FluentIcons.delete_24_regular),
                                  splashRadius: 20,
                                  color: AppColors.lightPrimary,
                                )
                              ],
                            )),

                          ],
                          selected: selected[index],
                          onSelectChanged: (bool? value) {
                            setState(() {
                              selected[index] = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

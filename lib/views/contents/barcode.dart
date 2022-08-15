import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../design/app_colors.dart';
import '../../design/app_text.dart';
import '../../widgets/app_form.dart';

class Barcode extends StatefulWidget {
  const Barcode({Key? key}) : super(key: key);

  @override
  State<Barcode> createState() => _BarcodeState();
}

class _BarcodeState extends State<Barcode> {
  List<bool> selected = List<bool>.generate(10, (int index) => false);
  var isAscending = true;
  var sortColumnIndex = 0;

  @override
  Widget build(BuildContext context) {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

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
                            label: Text('Etiket', style: AppText.contextSemiBoldBlue),
                            onSort: (columnIndex, ascending) {
                              print("columnIndex:$columnIndex");
                              print("ascending:$ascending");
                              setState(() {
                                sortColumnIndex = columnIndex;
                                isAscending = ascending;
                              });
                            }),
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
                            label: Text('Cins', style: AppText.contextSemiBoldBlue),
                            onSort: (columnIndex, ascending) {
                              print("columnIndex:$columnIndex");
                              print("ascending:$ascending");
                              setState(() {
                                sortColumnIndex = columnIndex;
                                isAscending = ascending;
                              });
                            }),
                        DataColumn(
                            label: Text('Renk', style: AppText.contextSemiBoldBlue),
                            onSort: (columnIndex, ascending) {
                              print("columnIndex:$columnIndex");
                              print("ascending:$ascending");
                              setState(() {
                                sortColumnIndex = columnIndex;
                                isAscending = ascending;
                              });
                            }),
                        DataColumn(
                            label: Text('Boyut', style: AppText.contextSemiBoldBlue),
                            onSort: (columnIndex, ascending) {
                              print("columnIndex:$columnIndex");
                              print("ascending:$ascending");
                              setState(() {
                                sortColumnIndex = columnIndex;
                                isAscending = ascending;
                              });
                            }),
                        DataColumn(
                            label: Text('Miktar', style: AppText.contextSemiBoldBlue),
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
                                  image: const DecorationImage(
                                      image: AssetImage('assets/images/avatar.png'),
                                      fit: BoxFit.cover)),
                            )),
                            DataCell(Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                  color: AppColors.lightGrey,
                                  borderRadius: BorderRadius.circular(4),
                                  image: const DecorationImage(
                                      image:  AssetImage('assets/images/avatar.png'),
                                      fit: BoxFit.cover)),
                            )),
                            DataCell(Text('İsim $index', style: AppText.context)),
                            DataCell(Text('Cins $index', style: AppText.context)),
                            DataCell(Text('Renk $index', style: AppText.context)),
                            DataCell(Text('Boyut $index', style: AppText.context)),
                            DataCell(IncDecInput(controller: TextEditingController())),
                            DataCell(Row(
                              children: [
                                OutlinedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(FluentIcons.print_24_regular),
                                  label: const Text("Yazdır"),
                                ),
                                const SizedBox(width: 8),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(FluentIcons.more_vertical_24_regular),
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

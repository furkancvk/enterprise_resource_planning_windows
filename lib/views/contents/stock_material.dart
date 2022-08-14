import 'package:erp_windows/widgets/app_cards.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../design/app_colors.dart';
import '../../design/app_text.dart';
import '../../widgets/app_form.dart';

class MaterialStock extends StatefulWidget {
  const MaterialStock({Key? key}) : super(key: key);
  static const int numItems = 10;
  @override
  State<MaterialStock> createState() => _MaterialStockState();
}

class _MaterialStockState extends State<MaterialStock> {
  List<bool> selected =
      List<bool>.generate(MaterialStock.numItems, (int index) => false);
  var isAscending = true;

  var sortColumnIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightSecondary,
        title: Row(children: [
          Icon(FluentIcons.box_toolbox_24_regular,color: AppColors.lightBlack,size: 16,),
          SizedBox(width: 12,),
          Text("Stok",style: AppText.titleSemiBold,),
          SizedBox(width: 24,),
          Icon(Icons.arrow_forward_ios,color: AppColors.lightBlack,size: 12,),
          SizedBox(width: 24,),
          Text("Hammadde",style: AppText.titleSemiBold,),
        ],),
      ),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: AppColors.lightSecondary,
                borderRadius: BorderRadius.circular(4)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      OutlinedButton(
                          onPressed: () {},
                          child: Row(
                            children: const [
                              Icon(FluentIcons.options_20_filled, size: 18),
                              SizedBox(width: 10),
                              Text(
                                "Toplu İşlemler",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.4,
                                  color: AppColors.lightPrimary,
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        width: 16,
                      ),
                      OutlinedButton(
                          onPressed: () {},
                          child: Row(
                            children: const [
                              Icon(FluentIcons.database_search_20_filled,
                                  size: 18),
                              SizedBox(width: 10),
                              Text(
                                "Dışa Aktar",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.4,
                                  color: AppColors.lightPrimary,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: 300,
                          height: 32,
                          child: AppForm.appAutoCompleteTextFormFieldForSearch(
                              hint: "Ara...",
                              controller: TextEditingController(),
                              key: GlobalKey(),
                              suggestions: ["suggestions"])),
                      OutlinedButton(
                          onPressed: () {},
                          child: Row(
                            children: const [
                              Icon(FluentIcons.filter_20_filled, size: 20),
                              SizedBox(width: 10),
                              Text(
                                "Filtrele",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.4,
                                  color: AppColors.lightPrimary,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          FittedBox(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: AppColors.lightSecondary,
                  borderRadius: BorderRadius.circular(4)),
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
                      label: Text('Stok Durumu',
                          style: AppText.contextSemiBoldBlue),

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
                  MaterialStock.numItems,
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
                      DataCell(Text('Cins $index', style: AppText.context)),
                      DataCell(Text('Renk $index', style: AppText.context)),
                      DataCell(Text('Boyut $index', style: AppText.context)),
                      DataCell(Text('Miktar $index', style: AppText.context)),
                      DataCell(Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppCards.stockSituationCard(color: AppColors.lightWarning,data: "Kritik"),
                      )),
                      DataCell(Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit_outlined),
                            splashRadius: 20,
                            color: AppColors.lightPrimary,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete_outline_rounded),
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
    );
  }
}

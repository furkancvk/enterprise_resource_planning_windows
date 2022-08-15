import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../../design/app_colors.dart';
import '../../../design/app_text.dart';
import '../../../widgets/app_cards.dart';
import '../../../widgets/app_form.dart';

class StockMaterial extends StatefulWidget {
  const StockMaterial({Key? key}) : super(key: key);

  @override
  State<StockMaterial> createState() => _StockMaterialState();
}

class _StockMaterialState extends State<StockMaterial> {
  List<bool> selected = List<bool>.generate(10, (int index) => false);
  var isAscending = true;
  var sortColumnIndex = 0;

  @override
  Widget build(BuildContext context) {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.lightSecondary,
                            border: Border.all(color: AppColors.lightPrimary),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: PopupMenuButton<int>(
                            tooltip: "",
                            padding: const EdgeInsets.all(8),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                onTap: () {},
                                value: 1,
                                child: Row(
                                  children: [
                                    const Icon(
                                      FluentIcons.edit_24_regular,
                                      color: AppColors.lightPrimary,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 10),
                                    const Text("Düzenle",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.4,
                                          color: AppColors.lightPrimary,
                                        )),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                onTap: () {},
                                value: 2,
                                child: Row(
                                  children: [
                                    const Icon(
                                      FluentIcons.delete_24_regular,
                                      color: AppColors.lightPrimary,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 10),
                                    const Text("Sil",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.4,
                                          color: AppColors.lightPrimary,
                                        )),
                                  ],
                                ),
                              ),

                            ],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: const BorderSide(color: AppColors.lightPrimary),
                            ),
                            splashRadius: 20,
                            offset: const Offset(47, 32),
                            color: AppColors.lightSecondary,
                            elevation: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(children: [
                                const Icon(FluentIcons.options_16_filled,color: AppColors.lightPrimary,size:16 ,),
                                const SizedBox(width: 12,),
                                const Text("Toplu işlemler",style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.4,
                                  color: AppColors.lightPrimary,
                                )),
                                const SizedBox(width: 12,),
                                const Icon(FluentIcons.chevron_down_16_filled,color: AppColors.lightPrimary,size:16 )
                              ],),
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
                                      image: const AssetImage('assets/images/avatar.png'),
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

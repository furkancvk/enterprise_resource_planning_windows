import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

import '../../design/app_colors.dart';
import '../../design/app_text.dart';
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
  var isAscending = true;
  var sortColumnIndex = 0;

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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
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
                              backgroundColor: indexTabBar == 0 ? AppColors.lightSecondary : Colors.transparent,
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
                              backgroundColor: indexTabBar == 1 ? AppColors.lightSecondary : Colors.transparent,
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
                              backgroundColor: indexTabBar == 2 ? AppColors.lightSecondary : Colors.transparent,
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
                                        style: TextStyle(
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
                            label: Text('İsim', style: AppText.contextSemiBoldBlue),
                            onSort: (columnIndex, ascending) {
                              print("columnIndex:$columnIndex");
                              print("ascending:$ascending");
                              setState(() {
                                sortColumnIndex = columnIndex;
                                isAscending = ascending;
                              });
                            }),
                        DataColumn(label: Text('Soyisim', style: AppText.contextSemiBoldBlue), onSort: (columnIndex, ascending) {
                          print("columnIndex:$columnIndex");
                          print("ascending:$ascending");
                          setState(() {
                            sortColumnIndex = columnIndex;
                            isAscending = ascending;
                          });
                        }),
                        DataColumn(label: Text('Birim', style: AppText.contextSemiBoldBlue), onSort: (columnIndex, ascending) {
                          print("columnIndex:$columnIndex");
                          print("ascending:$ascending");
                          setState(() {
                            sortColumnIndex = columnIndex;
                            isAscending = ascending;
                          });
                        }),
                        DataColumn(label: Text('Nesne', style: AppText.contextSemiBoldBlue), onSort: (columnIndex, ascending) {
                          print("columnIndex:$columnIndex");
                          print("ascending:$ascending");
                          setState(() {
                            sortColumnIndex = columnIndex;
                            isAscending = ascending;
                          });
                        }),
                        DataColumn(label: Text('Miktar', style: AppText.contextSemiBoldBlue), numeric: true, onSort: (columnIndex, ascending) {
                          print("columnIndex:$columnIndex");
                          print("ascending:$ascending");
                          setState(() {
                            sortColumnIndex = columnIndex;
                            isAscending = ascending;
                          });
                        }),
                        DataColumn(label: Text('İşlem Türü', style: AppText.contextSemiBoldBlue), onSort: (columnIndex, ascending) {
                          print("columnIndex:$columnIndex");
                          print("ascending:$ascending");
                          setState(() {
                            sortColumnIndex = columnIndex;
                            isAscending = ascending;
                          });
                        }),
                        DataColumn(label: Text('Tarih', style: AppText.contextSemiBoldBlue), numeric: true, onSort: (columnIndex, ascending) {
                          print("columnIndex:$columnIndex");
                          print("ascending:$ascending");
                          setState(() {
                            sortColumnIndex = columnIndex;
                            isAscending = ascending;
                          });
                        }),
                        DataColumn(label: Text('Saat', style: AppText.contextSemiBoldBlue), numeric: true, onSort: (columnIndex, ascending) {
                          print("columnIndex:$columnIndex");
                          print("ascending:$ascending");
                          setState(() {
                            sortColumnIndex = columnIndex;
                            isAscending = ascending;
                          });
                        }),
                      ],
                      rows: List<DataRow>.generate(10, (int index) => DataRow(
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
                          DataCell(Text('isim $index', style: AppText.context)),
                          DataCell(Text('Soyisim $index', style: AppText.context)),
                          DataCell(Text('Birim $index', style: AppText.context)),
                          DataCell(Text('Nesne $index', style: AppText.context)),
                          DataCell(Text('Miktar $index', style: AppText.context)),
                          DataCell(Text('İşlem Türü $index', style: AppText.context)),
                          DataCell(Text('Tarih $index', style: AppText.context)),
                          DataCell(Text('Saat $index', style: AppText.context)),
                        ],
                        selected: selected[index],
                        onSelectChanged: (bool? value) {
                          setState(() {
                            selected[index] = value!;
                          });
                        },
                      ),),
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

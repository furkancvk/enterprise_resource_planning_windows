import 'package:erp_windows/design/app_colors.dart';
import 'package:erp_windows/design/app_text.dart';
import 'package:erp_windows/widgets/app_cards.dart';
import 'package:erp_windows/widgets/app_form.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../states/states.dart';

class Panel extends StatefulWidget {
  const Panel({Key? key}) : super(key: key);

  static const int numItems = 10;

  @override
  State<Panel> createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  List<bool> selected = List<bool>.generate(Panel.numItems, (int index) => false);
  var isAscending = true;
  var sortColumnIndex = 0;

  @override
  Widget build(BuildContext context) {
    Function setIndexTabBar = Provider.of<States>(context).setIndexTabBar;
    int indexTabBar = Provider.of<States>(context).indexTabBar;


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.lightSecondary,
          title: Row(
            children: [
              const Icon(
                Icons.dashboard_outlined,
                color: AppColors.lightBlack,
              ),
              Text(
                "Panel",
                style: AppText.labelSemiBold,
              )
            ],
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppCards.panelDataCard(
                          icon: Icons.people_outline,
                          label: "Toplam Personel",
                          data: "5",
                          color: AppColors.lightBlack),
                      AppCards.panelDataCard(
                          icon: Icons.eject,
                          label: "Toplam Hammadde",
                          data: "3456",
                          color: AppColors.lightBlack),
                      AppCards.panelDataCard(
                          icon: Icons.crop_square,
                          label: "Toplam Bitmiş Ürün",
                          data: "217",
                          color: AppColors.lightBlack),
                      AppCards.panelDataCard(
                          icon: Icons.warning_amber_outlined,
                          label: "Yetersiz Stok",
                          data: "12",
                          color: AppColors.lightError),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 474,
                        decoration: BoxDecoration(
                            color: AppColors.lightSecondary,
                            borderRadius: BorderRadius.circular(4)),
                        child: TableCalendar(
                          focusedDay: DateTime.now(),
                          firstDay: DateTime.utc(
                            2010,
                            10,
                            16,
                          ),
                          lastDay: DateTime.utc(2030, 3, 14),
                          rowHeight: 40,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: indexTabBar == 0 ? AppColors.lightSecondary : AppColors.lightPrimary.withOpacity(0.04),
                                  borderRadius: const BorderRadius.only(topRight: Radius.circular(4),topLeft: Radius.circular(4))
                                ),
                                child: TextButton(
                                  onPressed: (){
                                    setIndexTabBar(0);
                                    print('IndexTabBar: $indexTabBar');
                                  },
                                  child: Text('Yapılacaklar', style: AppText.titleSemiBold),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: indexTabBar == 1 ? AppColors.lightSecondary : AppColors.lightPrimary.withOpacity(0.04),
                                    borderRadius: const BorderRadius.only(topRight: Radius.circular(4),topLeft: Radius.circular(4))
                                ),
                                child: TextButton(
                                  onPressed: (){
                                    setIndexTabBar(1);
                                    print('IndexTabBar: $indexTabBar');
                                  },
                                  child: Text('İşlemde', style: AppText.titleSemiBold),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: indexTabBar == 2 ? AppColors.lightSecondary : AppColors.lightPrimary.withOpacity(0.04),
                                    borderRadius: const BorderRadius.only(topRight: Radius.circular(4),topLeft: Radius.circular(4))
                                ),
                                child: TextButton(
                                  onPressed: (){
                                    setIndexTabBar(2);
                                    print('IndexTabBar: $indexTabBar');
                                  },
                                  child: Text('Tamamlandı', style: AppText.titleSemiBold),
                                ),
                              ),
                            ],
                          ),
                          indexTabBar == 0 ? Container(
                            decoration: BoxDecoration(
                                color: AppColors.lightSecondary,
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      OutlinedButton(
                                          onPressed: () {},
                                          child: Row(
                                            children: const [
                                              Icon(Icons.import_export),
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
                                      OutlinedButton(
                                          onPressed: () {},
                                          child: Row(
                                            children: const [
                                              Icon(Icons.add),
                                              Text(
                                                "Yeni Görev Ekle",
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
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  AppCards.taskCard(
                                      color: AppColors.lightError,
                                      title: "Yapılacaklar",
                                      task:
                                          "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. ",
                                      date: "03/08/2022",
                                      fullName: "Burak Yalnız"),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  AppCards.taskCard(
                                      color: AppColors.lightWarning,
                                      title: "Başlık",
                                      task:
                                          "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. ",
                                      date: "03/08/2022",
                                      fullName: "Burak Yalnız"),
                                ],
                              ),
                            ),
                          ) : (indexTabBar == 1 ? Container(
                            decoration: BoxDecoration(
                                color: AppColors.lightSecondary,
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      OutlinedButton(
                                          onPressed: () {},
                                          child: Row(
                                            children: const [
                                              Icon(Icons.import_export),
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
                                      OutlinedButton(
                                          onPressed: () {},
                                          child: Row(
                                            children: const [
                                              Icon(Icons.add),
                                              Text(
                                                "Yeni Görev Ekle",
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
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  AppCards.taskCard(
                                      color: AppColors.lightError,
                                      title: "İşlemde",
                                      task:
                                      "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. ",
                                      date: "03/08/2022",
                                      fullName: "Burak Yalnız"),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  AppCards.taskCard(
                                      color: AppColors.lightWarning,
                                      title: "Başlık",
                                      task:
                                      "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. ",
                                      date: "03/08/2022",
                                      fullName: "Burak Yalnız"),
                                ],
                              ),
                            ),
                          ) : Container(
                            decoration: BoxDecoration(
                                color: AppColors.lightSecondary,
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      OutlinedButton(
                                          onPressed: () {},
                                          child: Row(
                                            children: const [
                                              Icon(Icons.import_export),
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
                                      OutlinedButton(
                                          onPressed: () {},
                                          child: Row(
                                            children: const [
                                              Icon(Icons.add),
                                              Text(
                                                "Yeni Görev Ekle",
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
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  AppCards.taskCard(
                                      color: AppColors.lightError,
                                      title: "Tamamlanmış",
                                      task:
                                      "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. ",
                                      date: "03/08/2022",
                                      fullName: "Burak Yalnız"),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  AppCards.taskCard(
                                      color: AppColors.lightWarning,
                                      title: "Başlık",
                                      task:
                                      "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. ",
                                      date: "03/08/2022",
                                      fullName: "Burak Yalnız"),
                                ],
                              ),
                            ),
                          )),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
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
                                    Icon(FluentIcons.database_search_20_filled, size: 18),
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
                                child: AppForm
                                    .appAutoCompleteTextFormFieldForSearch(
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
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: AppColors.lightSecondary,
                        borderRadius: BorderRadius.circular(4)),
                    width: MediaQuery.of(context).size.width,
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
                      rows: List<DataRow>.generate(Panel.numItems, (int index) => DataRow(
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
            )
          ],
        ),
      ),
    );
  }
}

/*DataTable(columns: const [
                      DataColumn(label: Text('İsim')),
                      DataColumn(label: Text('Soyisim')),
                      DataColumn(label: Text('Birim')),
                      DataColumn(label: Text('Nesne')),
                      DataColumn(label: Text('Miktar')),
                      DataColumn(label: Text('İşlem Türü')),
                      DataColumn(label: Text('Tarih')),
                      DataColumn(label: Text('Saat')),
                    ], rows: const [
                      DataRow(cells: [
                        DataCell(Text("İsim")),
                        DataCell(Text("Soyisim")),
                        DataCell(Text("Birim")),
                        DataCell(Text("Nesne")),
                        DataCell(Text("Miktar")),
                        DataCell(Text("İşlem Türü")),
                        DataCell(Text("Tarih")),
                        DataCell(Text("Saat")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("İsim")),
                        DataCell(Text("Soyisim")),
                        DataCell(Text("Birim")),
                        DataCell(Text("Nesne")),
                        DataCell(Text("Miktar")),
                        DataCell(Text("İşlem Türü")),
                        DataCell(Text("Tarih")),
                        DataCell(Text("Saat")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("İsim")),
                        DataCell(Text("Soyisim")),
                        DataCell(Text("Birim")),
                        DataCell(Text("Nesne")),
                        DataCell(Text("Miktar")),
                        DataCell(Text("İşlem Türü")),
                        DataCell(Text("Tarih")),
                        DataCell(Text("Saat")),
                      ])
                    ]),*/
import 'package:erp_windows/design/app_colors.dart';
import 'package:erp_windows/design/app_text.dart';
import 'package:erp_windows/widgets/app_cards.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Panel extends StatelessWidget {
  const Panel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.lightSecondary,
          title: Row(children: [
            Icon(Icons.dashboard_outlined,color: AppColors.lightBlack,),
            Text("Panel",style: AppText.labelSemiBold,)
          ],),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                const SizedBox(
                  height: 64,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 400,
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
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.lightSecondary,
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
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
                                    title: "Başlık",
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
                        ))
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
                  child: Row(
                    children: [
                      Row(
                        children: [
                          OutlinedButton(
                              onPressed: () {},
                              child: Row(
                                children: const [
                                  Icon(Icons.shuffle),
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
                        ],
                      ),
                    ],
                  ),
                ),
                FittedBox(
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.lightSecondary,
                        borderRadius: BorderRadius.circular(4)),
                    width: MediaQuery.of(context).size.width,
                    child: DataTable(columns: const [
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
                      ]),DataRow(cells: [
                        DataCell(Text("İsim")),
                        DataCell(Text("Soyisim")),
                        DataCell(Text("Birim")),
                        DataCell(Text("Nesne")),
                        DataCell(Text("Miktar")),
                        DataCell(Text("İşlem Türü")),
                        DataCell(Text("Tarih")),
                        DataCell(Text("Saat")),
                      ])
                    ]),
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

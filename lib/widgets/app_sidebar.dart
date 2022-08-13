import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../design/app_colors.dart';
import '../states/states.dart';

const sidebarColor = AppColors.lightSecondary; // left bar color

class AppSidebar extends StatefulWidget {
  AppSidebar({Key? key}) : super(key: key);

  @override
  State<AppSidebar> createState() => _AppSidebarState();
}

class _AppSidebarState extends State<AppSidebar> {

  @override
  Widget build(BuildContext context) {
    Function setIndexSidebar = Provider.of<States>(context).setIndexSidebar;
    int indexSidebar = Provider.of<States>(context).indexSidebar;

    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.20,
        child: Container(
            color: sidebarColor,
            child: ListView(
              children: [
                Image.asset('assets/images/logo-black.png'),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      //PANEL
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: indexSidebar == 0 ? AppColors.lightPrimary.withOpacity(0.04): AppColors.lightSecondary,
                        ),
                        child: ListTile(
                          onTap: () {
                            setIndexSidebar(0);
                            print(indexSidebar);
                          },
                          textColor: indexSidebar == 0 ? AppColors.lightPrimary : AppColors.lightBlack,
                          leading: Icon(
                            Icons.dashboard_outlined,
                            color: indexSidebar == 0 ? AppColors.lightPrimary : AppColors.lightBlack,
                          ),
                          title: Text(
                            "Panel",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.4,
                              color: indexSidebar == 0 ? AppColors.lightPrimary : AppColors.lightBlack
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //STOK
                      ExpansionTile(
                        backgroundColor: AppColors.lightSecondary,
                        collapsedBackgroundColor: AppColors.lightSecondary,
                        textColor: AppColors.lightPrimary,
                        collapsedTextColor: AppColors.lightBlack,
                        iconColor: AppColors.lightPrimary,
                        collapsedIconColor: AppColors.lightBlack,
                        leading: Icon(
                          FluentIcons.box_toolbox_24_regular,
                          color: (indexSidebar == 1 || indexSidebar == 2) ? AppColors.lightPrimary : AppColors.lightBlack,
                        ),
                        title: const Text(
                          "Stok",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.4,
                          ),
                        ),
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: indexSidebar == 1 ? AppColors.lightPrimary.withOpacity(0.04): AppColors.lightSecondary,
                            ),
                            child: ListTile(
                              onTap: () {
                                setIndexSidebar(1);
                                print(indexSidebar);
                                },
                              /*selectedTileColor: indexSidebar == 1 ? Colors.amber : Colors.red,*/
                              textColor: indexSidebar == 1 ? AppColors.lightPrimary : AppColors.lightBlack,
                              leading: const Icon(
                                Icons.dashboard_outlined,
                                color: Colors.transparent,
                              ),
                              title: const Text(
                                "Hammadde",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: indexSidebar == 2 ? AppColors.lightPrimary.withOpacity(0.04): AppColors.lightSecondary,
                            ),
                            child: ListTile(
                              onTap: () {
                                setIndexSidebar(2);
                                print(indexSidebar);
                              },
                              /*selectedTileColor: indexSidebar == 2 ? Colors.amber : Colors.red,*/
                              textColor: indexSidebar == 2 ? AppColors.lightPrimary : AppColors.lightBlack,
                              leading: const Icon(
                                Icons.dashboard_outlined,
                                color: Colors.transparent,
                              ),
                              title: const Text(
                                  "Bitmiş Ürün",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //SİPARİŞ
                      ExpansionTile(
                        backgroundColor: AppColors.lightSecondary,
                        collapsedBackgroundColor: AppColors.lightSecondary,
                        textColor: AppColors.lightPrimary,
                        collapsedTextColor: AppColors.lightBlack,
                        iconColor: AppColors.lightPrimary,
                        collapsedIconColor: AppColors.lightBlack,
                        leading: Icon(
                          FluentIcons.book_24_regular,
                          color: (indexSidebar == 3 || indexSidebar == 4|| indexSidebar == 5) ? AppColors.lightPrimary : AppColors.lightBlack,
                        ),
                        title: const Text(
                          "Sipariş",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.4,
                          ),
                        ),
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: indexSidebar == 3 ? AppColors.lightPrimary.withOpacity(0.04): AppColors.lightSecondary,
                            ),
                            child: ListTile(
                              onTap: () {
                                setIndexSidebar(3);
                                print(indexSidebar);
                              },
                              /*selectedTileColor: indexSidebar == 3 ? Colors.amber : Colors.red,*/
                              textColor: indexSidebar == 3 ? AppColors.lightPrimary : AppColors.lightBlack,
                              leading: const Icon(
                                Icons.dashboard_outlined,
                                color: Colors.transparent,
                              ),
                              title: const Text(
                                "Gelen Sipariş",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: indexSidebar == 4 ? AppColors.lightPrimary.withOpacity(0.04): AppColors.lightSecondary,
                            ),
                            child: ListTile(
                              onTap: () {
                                setIndexSidebar(4);
                                print(indexSidebar);
                              },
                              /*selectedTileColor: indexSidebar == 4 ? Colors.amber : Colors.red,*/
                              textColor: indexSidebar == 4 ? AppColors.lightPrimary : AppColors.lightBlack,
                              leading: const Icon(
                                Icons.dashboard_outlined,
                                color: Colors.transparent,
                              ),
                              title: const Text(
                                "Hazırlanan Sipariş",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: indexSidebar == 5 ? AppColors.lightPrimary.withOpacity(0.04): AppColors.lightSecondary,
                            ),
                            child: ListTile(
                              onTap: () {
                                setIndexSidebar(5);
                                print(indexSidebar);
                              },
                              /*selectedTileColor: indexSidebar == 5 ? Colors.amber : Colors.red,*/
                              textColor: indexSidebar == 5 ? AppColors.lightPrimary : AppColors.lightBlack,
                              leading: const Icon(
                                Icons.dashboard_outlined,
                                color: Colors.transparent,
                              ),
                              title: const Text(
                                "Giden Sipariş",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //PERSONEL
                      Container(
                        color: indexSidebar == 6 ? AppColors.lightPrimary.withOpacity(0.04): AppColors.lightSecondary,
                        child: ListTile(
                          onTap: () {
                            setIndexSidebar(6);
                            print(indexSidebar);
                          },
                          textColor: indexSidebar == 6 ? AppColors.lightPrimary : AppColors.lightBlack,
                          leading: Icon(
                            FluentIcons.people_team_24_regular,
                            color: indexSidebar == 6 ? AppColors.lightPrimary : AppColors.lightBlack,
                          ),
                          title: Text(
                            "Personel",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.4,
                                color: indexSidebar == 6 ? AppColors.lightPrimary : AppColors.lightBlack
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //BİRİMLER
                      ExpansionTile(
                        backgroundColor: AppColors.lightSecondary,
                        collapsedBackgroundColor: AppColors.lightSecondary,
                        textColor: AppColors.lightPrimary,
                        collapsedTextColor: AppColors.lightBlack,
                        iconColor: AppColors.lightPrimary,
                        collapsedIconColor: AppColors.lightBlack,
                        leading: Icon(
                          FluentIcons.arrow_circle_down_split_24_regular,
                          color: (indexSidebar == 7 || indexSidebar == 8 || indexSidebar == 9 || indexSidebar == 10) ? AppColors.lightPrimary : AppColors.lightBlack,
                        ),
                        title: const Text(
                          "Birimler",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.4,
                          ),
                        ),
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: indexSidebar == 7 ? AppColors.lightPrimary.withOpacity(0.04): AppColors.lightSecondary,
                            ),
                            child: ListTile(
                              onTap: () {
                                setIndexSidebar(7);
                                print(indexSidebar);
                              },
                              /*selectedTileColor: indexSidebar == 7 ? Colors.amber : Colors.red,*/
                              textColor: indexSidebar == 7 ? AppColors.lightPrimary : AppColors.lightBlack,
                              leading: const Icon(
                                Icons.dashboard_outlined,
                                color: Colors.transparent,
                              ),
                              title: const Text(
                                "Üretim",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: indexSidebar == 8 ? AppColors.lightPrimary.withOpacity(0.04): AppColors.lightSecondary,
                            ),
                            child: ListTile(
                              onTap: () {
                                setIndexSidebar(8);
                                print(indexSidebar);
                              },
                              /*selectedTileColor: indexSidebar == 8 ? Colors.amber : Colors.red,*/
                              textColor: indexSidebar == 8 ? AppColors.lightPrimary : AppColors.lightBlack,
                              leading: const Icon(
                                Icons.dashboard_outlined,
                                color: Colors.transparent,
                              ),
                              title: const Text(
                                "Depo",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: indexSidebar == 9
                                  ? AppColors.lightPrimary.withOpacity(0.04): AppColors.lightSecondary,
                            ),
                            child: ListTile(
                              onTap: () {
                                setIndexSidebar(9);
                                print(indexSidebar);
                              },
                              /*selectedTileColor: indexSidebar == 9 ? Colors.amber : Colors.red,*/
                              textColor: indexSidebar == 9 ? AppColors.lightPrimary : AppColors.lightBlack,
                              leading: const Icon(
                                Icons.dashboard_outlined,
                                color: Colors.transparent,
                              ),
                              title: const Text(
                                "Transfer",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: indexSidebar == 10 ? AppColors.lightPrimary.withOpacity(0.04): AppColors.lightSecondary,
                            ),
                            child: ListTile(
                              onTap: () {
                                setIndexSidebar(10);
                                print(indexSidebar);
                              },
                              /*selectedTileColor: indexSidebar == 10 ? Colors.amber : Colors.red,*/
                              textColor: indexSidebar == 10 ? AppColors.lightPrimary : AppColors.lightBlack,
                              leading: const Icon(
                                Icons.dashboard_outlined,
                                color: Colors.transparent,
                              ),
                              title: const Text(
                                "İnsan Kaynakları",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //ETİKET
                      Container(
                        color: indexSidebar == 11 ? AppColors.lightPrimary.withOpacity(0.04): AppColors.lightSecondary,
                        child: ListTile(
                          onTap: () {
                            setIndexSidebar(11);
                            print(indexSidebar);
                          },
                          textColor: indexSidebar == 11 ? AppColors.lightPrimary : AppColors.lightBlack,
                          leading: Icon(
                            FluentIcons.barcode_scanner_24_regular,
                            color: indexSidebar == 11 ? AppColors.lightPrimary : AppColors.lightBlack,
                          ),
                          title: Text(
                            "Barkod",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.4,
                                color: indexSidebar == 11 ? AppColors.lightPrimary : AppColors.lightBlack
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //BELGELER
                      ExpansionTile(
                        backgroundColor: AppColors.lightSecondary,
                        collapsedBackgroundColor: AppColors.lightSecondary,
                        textColor: AppColors.lightPrimary,
                        collapsedTextColor: AppColors.lightBlack,
                        iconColor: AppColors.lightPrimary,
                        collapsedIconColor: AppColors.lightBlack,
                        leading: Icon(
                          FluentIcons.notepad_24_regular,
                          color: (indexSidebar == 12 || indexSidebar == 13) ? AppColors.lightPrimary : AppColors.lightBlack,
                        ),
                        title: const Text(
                          "Sipariş",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.4,
                          ),
                        ),
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: indexSidebar == 12 ? AppColors.lightPrimary.withOpacity(0.04): AppColors.lightSecondary,
                            ),
                            child: ListTile(
                              onTap: () {
                                setIndexSidebar(12);
                                print(indexSidebar);
                              },
                              /*selectedTileColor: indexSidebar == 12 ? Colors.amber : Colors.red,*/
                              textColor: indexSidebar == 12 ? AppColors.lightPrimary : AppColors.lightBlack,
                              leading: const Icon(
                                Icons.dashboard_outlined,
                                color: Colors.transparent,
                              ),
                              title: const Text(
                                "Belgeler",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: indexSidebar == 13 ? AppColors.lightPrimary.withOpacity(0.04): AppColors.lightSecondary,
                            ),
                            child: ListTile(
                              onTap: () {
                                setIndexSidebar(13);
                                print(indexSidebar);
                              },
                              /*selectedTileColor: indexSidebar == 13 ? Colors.amber : Colors.red,*/
                              textColor: indexSidebar == 13 ? AppColors.lightPrimary : AppColors.lightBlack,
                              leading: const Icon(
                                Icons.dashboard_outlined,
                                color: Colors.transparent,
                              ),
                              title: const Text(
                                "Raporlar",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
        ));
  }
}


import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../design/app_colors.dart';
import '../states/states.dart';

class AppSidebar extends StatefulWidget {
  const AppSidebar({Key? key}) : super(key: key);

  @override
  State<AppSidebar> createState() => _AppSidebarState();
}

class _AppSidebarState extends State<AppSidebar> {
  @override
  Widget build(BuildContext context) {
    Function setIndexContent = Provider.of<States>(context).setIndexContent;
    int indexContent = Provider.of<States>(context).indexContent;

    return Container(
      width: 240,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.lightSecondary,
        boxShadow: [
          BoxShadow(
            color: const Color(0xffE4E3E3).withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(4, 0),
          ),
        ],
      ),
      child: ListView(
        children: [
          Image.asset('assets/images/logo-black.png'),
          // Panel
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: indexContent == 0 ? AppColors.lightPrimary.withOpacity(0.04): Colors.transparent,
            ),
            child: ListTile(
              horizontalTitleGap: 16,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              onTap: () {setIndexContent(0);},
              textColor: indexContent == 0 ? AppColors.lightPrimary : AppColors.lightBlack,
              leading: Icon(
                FluentIcons.board_24_regular,
                color: indexContent == 0 ? AppColors.lightPrimary : AppColors.lightBlack,
              ),
              title: Text(
                "Panel",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.4,
                  color: indexContent == 0 ? AppColors.lightPrimary : AppColors.lightBlack,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Stok
          ExpansionTile(
            onExpansionChanged: (value) {
              if(value) setIndexContent(1);
            },
            tilePadding: const EdgeInsets.symmetric(horizontal: 8),
            childrenPadding: const EdgeInsets.only(left: 52, top: 8, bottom: 8),
            // backgroundColor: AppColors.lightSecondary,
            // collapsedBackgroundColor: AppColors.lightSecondary,
            textColor: AppColors.lightPrimary,
            collapsedTextColor: AppColors.lightBlack,
            iconColor: AppColors.lightPrimary,
            collapsedIconColor: AppColors.lightBlack,
            // backgroundColor: Colors.green,
            // collapsedBackgroundColor: Colors.red,
            leading: const Icon(
              FluentIcons.box_toolbox_24_regular,
              // color: (indexContent == 1 || indexContent == 2) ? AppColors.lightPrimary : AppColors.lightBlack,
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: indexContent == 1 ? AppColors.lightPrimary.withOpacity(0.04): Colors.transparent,
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  onTap: () {setIndexContent(1);},
                  textColor: indexContent == 1 ? AppColors.lightPrimary : AppColors.lightBlack,
                  title: Text(
                    "Hammadde",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4,
                      color: indexContent == 1 ? AppColors.lightPrimary : AppColors.lightBlack,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: indexContent == 2 ? AppColors.lightPrimary.withOpacity(0.04): Colors.transparent,
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  onTap: () {setIndexContent(2);},
                  textColor: indexContent == 2 ? AppColors.lightPrimary : AppColors.lightBlack,
                  title: Text(
                    "Bitmiş Ürün",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4,
                      color: indexContent == 2 ? AppColors.lightPrimary : AppColors.lightBlack,
                    ),
                  ),
                ),
              ),
            ],
            /*children: [
              Container(
                margin: const EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: indexContent == 1 ? AppColors.lightPrimary.withOpacity(0.04): AppColors.lightSecondary,
                ),
                child: ListTile(
                  onTap: () {
                    setIndexContent(1);
                    print(indexContent);
                  },
                  /*selectedTileColor: indexSidebar == 1 ? Colors.amber : Colors.red,*/
                  textColor: indexContent == 1 ? AppColors.lightPrimary : AppColors.lightBlack,
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
                  color: indexContent == 2 ? AppColors.lightPrimary.withOpacity(0.04): AppColors.lightSecondary,
                ),
                child: ListTile(
                  onTap: () {
                    setIndexContent(2);
                    print(indexContent);
                  },
                  /*selectedTileColor: indexSidebar == 2 ? Colors.amber : Colors.red,*/
                  textColor: indexContent == 2 ? AppColors.lightPrimary : AppColors.lightBlack,
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
            ],*/
          ),
          const SizedBox(height: 20),
          // Sipariş
          ExpansionTile(
            onExpansionChanged: (value) {if(value) setIndexContent(3);},
            tilePadding: const EdgeInsets.symmetric(horizontal: 8),
            childrenPadding: const EdgeInsets.only(left: 52, top: 8, bottom: 8),
            textColor: AppColors.lightPrimary,
            collapsedTextColor: AppColors.lightBlack,
            iconColor: AppColors.lightPrimary,
            collapsedIconColor: AppColors.lightBlack,
            leading: const Icon(FluentIcons.book_24_regular),
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: indexContent == 3 ? AppColors.lightPrimary.withOpacity(0.04): Colors.transparent,
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  onTap: () {setIndexContent(3);},
                  textColor: indexContent == 3 ? AppColors.lightPrimary : AppColors.lightBlack,
                  title: Text(
                    "Gelen",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4,
                      color: indexContent == 3 ? AppColors.lightPrimary : AppColors.lightBlack,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: indexContent == 4 ? AppColors.lightPrimary.withOpacity(0.04): Colors.transparent,
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  onTap: () {setIndexContent(4);},
                  textColor: indexContent == 4 ? AppColors.lightPrimary : AppColors.lightBlack,
                  title: Text(
                    "Hazırlanan",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4,
                      color: indexContent == 4 ? AppColors.lightPrimary : AppColors.lightBlack,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: indexContent == 5 ? AppColors.lightPrimary.withOpacity(0.04): Colors.transparent,
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  onTap: () {setIndexContent(5);},
                  textColor: indexContent == 5 ? AppColors.lightPrimary : AppColors.lightBlack,
                  title: Text(
                    "Giden",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4,
                      color: indexContent == 5 ? AppColors.lightPrimary : AppColors.lightBlack,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Personel
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: indexContent == 6 ? AppColors.lightPrimary.withOpacity(0.04): Colors.transparent,
            ),
            child: ListTile(
              horizontalTitleGap: 16,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              onTap: () {setIndexContent(6);},
              textColor: indexContent == 6 ? AppColors.lightPrimary : AppColors.lightBlack,
              leading: Icon(
                FluentIcons.people_team_24_regular,
                color: indexContent == 6 ? AppColors.lightPrimary : AppColors.lightBlack,
              ),
              title: Text(
                "Personel",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.4,
                  color: indexContent == 6 ? AppColors.lightPrimary : AppColors.lightBlack,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Birimler
          ExpansionTile(
            onExpansionChanged: (value) {if(value) setIndexContent(7);},
            tilePadding: const EdgeInsets.symmetric(horizontal: 8),
            childrenPadding: const EdgeInsets.only(left: 52, top: 8, bottom: 8),
            textColor: AppColors.lightPrimary,
            collapsedTextColor: AppColors.lightBlack,
            iconColor: AppColors.lightPrimary,
            collapsedIconColor: AppColors.lightBlack,
            leading: const Icon(FluentIcons.layer_24_regular),
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: indexContent == 7 ? AppColors.lightPrimary.withOpacity(0.04): Colors.transparent,
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  onTap: () {setIndexContent(7);},
                  textColor: indexContent == 7 ? AppColors.lightPrimary : AppColors.lightBlack,
                  title: Text(
                    "Üretim",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4,
                      color: indexContent == 7 ? AppColors.lightPrimary : AppColors.lightBlack,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: indexContent == 8 ? AppColors.lightPrimary.withOpacity(0.04): Colors.transparent,
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  onTap: () {setIndexContent(8);},
                  textColor: indexContent == 8 ? AppColors.lightPrimary : AppColors.lightBlack,
                  title: Text(
                    "Depo",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4,
                      color: indexContent == 8 ? AppColors.lightPrimary : AppColors.lightBlack,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: indexContent == 9 ? AppColors.lightPrimary.withOpacity(0.04): Colors.transparent,
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  onTap: () {setIndexContent(9);},
                  textColor: indexContent == 9 ? AppColors.lightPrimary : AppColors.lightBlack,
                  title: Text(
                    "Transfer",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4,
                      color: indexContent == 9 ? AppColors.lightPrimary : AppColors.lightBlack,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: indexContent == 10 ? AppColors.lightPrimary.withOpacity(0.04): Colors.transparent,
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  onTap: () {setIndexContent(10);},
                  textColor: indexContent == 10 ? AppColors.lightPrimary : AppColors.lightBlack,
                  title: Text(
                    "İnsan Kaynakları",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4,
                      color: indexContent == 10 ? AppColors.lightPrimary : AppColors.lightBlack,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Etiket
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: indexContent == 11 ? AppColors.lightPrimary.withOpacity(0.04): Colors.transparent,
            ),
            child: ListTile(
              horizontalTitleGap: 16,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              onTap: () {setIndexContent(11);},
              textColor: indexContent == 11 ? AppColors.lightPrimary : AppColors.lightBlack,
              leading: Icon(
                FluentIcons.barcode_scanner_24_regular,
                color: indexContent == 11 ? AppColors.lightPrimary : AppColors.lightBlack,
              ),
              title: Text(
                "Etiket",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.4,
                  color: indexContent == 11 ? AppColors.lightPrimary : AppColors.lightBlack,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Belgeler
          ExpansionTile(
            onExpansionChanged: (value) {if(value) setIndexContent(12);},
            tilePadding: const EdgeInsets.symmetric(horizontal: 8),
            childrenPadding: const EdgeInsets.only(left: 52, top: 8, bottom: 8),
            textColor: AppColors.lightPrimary,
            collapsedTextColor: AppColors.lightBlack,
            iconColor: AppColors.lightPrimary,
            collapsedIconColor: AppColors.lightBlack,
            leading: const Icon(FluentIcons.document_data_24_regular),
            title: const Text(
              "Belgeler",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.4,
              ),
            ),
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: indexContent == 12 ? AppColors.lightPrimary.withOpacity(0.04): Colors.transparent,
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  onTap: () {setIndexContent(12);},
                  textColor: indexContent == 12 ? AppColors.lightPrimary : AppColors.lightBlack,
                  title: Text(
                    "Raporlar",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4,
                      color: indexContent == 12 ? AppColors.lightPrimary : AppColors.lightBlack,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: indexContent == 13 ? AppColors.lightPrimary.withOpacity(0.04): Colors.transparent,
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  onTap: () {setIndexContent(13);},
                  textColor: indexContent == 13 ? AppColors.lightPrimary : AppColors.lightBlack,
                  title: Text(
                    "Faturalar",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4,
                      color: indexContent == 13 ? AppColors.lightPrimary : AppColors.lightBlack,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );

    /*return SizedBox(
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
        ));*/
  }
}


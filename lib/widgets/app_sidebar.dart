
import 'package:erp_windows/design/app_text.dart';
import 'package:flutter/material.dart';

import '../design/app_colors.dart';

const sidebarColor = AppColors.lightSecondary; // left bar color

class AppSidebar extends StatelessWidget {
  const AppSidebar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.20,
        child: Container(
            color: sidebarColor,
            child: ListView(
              children: [
                Image.asset('assets/images/logo-black.png'),
                Column(
                  children: [
                    //PANEL
                    ListTile(


                      leading: const Icon(
                        Icons.dashboard_outlined,
                        color: AppColors.lightBlack,
                      ),
                      title: Text(
                        "Panel",
                        style: AppText.contextSemiBold,
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //STOK
                    ExpansionTile(
                      collapsedTextColor: AppColors.lightBlack,
                      collapsedIconColor: AppColors.lightBlack,
                      collapsedBackgroundColor: AppColors.lightSecondary,
                      leading: const Icon(
                        Icons.storage_sharp,
                        color: AppColors.lightBlack,
                      ),
                      title: Text(
                        "Stok",
                        style: AppText.contextSemiBold,
                      ),
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.dashboard_outlined,
                            color: Colors.transparent,
                          ),
                          title: Text(
                            "Hammadde",
                            style: AppText.label,
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.dashboard_outlined,
                            color: Colors.transparent,
                          ),
                          title: Text(
                            "Bitmiş Ürün",
                            style: AppText.label,
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //SİPARİŞ
                    ExpansionTile(
                      collapsedTextColor: AppColors.lightBlack,
                      collapsedIconColor: AppColors.lightBlack,
                      collapsedBackgroundColor: AppColors.lightSecondary,
                      leading: const Icon(
                        Icons.text_snippet_outlined,
                        color: AppColors.lightBlack,
                      ),
                      title: Text(
                        "Sipariş",
                        style: AppText.contextSemiBold,
                      ),
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.text_snippet_outlined,
                            color: Colors.transparent,
                          ),
                          title: Text(
                            "Gelen Sipariş",
                            style: AppText.label,
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.dashboard_outlined,
                            color: Colors.transparent,
                          ),
                          title: Text(
                            "Hazırlanan Sipariş",
                            style: AppText.label,
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.dashboard_outlined,
                            color: Colors.transparent,
                          ),
                          title: Text(
                            "Giden Sipariş",
                            style: AppText.label,
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //PERSONEL
                    ListTile(
                      leading: const Icon(
                        Icons.people_outline,
                        color: AppColors.lightBlack,
                      ),
                      title: Text(
                        "Personel",
                        style: AppText.contextSemiBold,
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //BİRİMLER
                    ExpansionTile(
                      collapsedTextColor: AppColors.lightBlack,
                      collapsedIconColor: AppColors.lightBlack,
                      collapsedBackgroundColor: AppColors.lightSecondary,
                      leading: const Icon(
                        Icons.text_snippet_outlined,
                        color: AppColors.lightBlack,
                      ),
                      title: Text(
                        "Birimler",
                        style: AppText.contextSemiBold,
                      ),
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.text_snippet_outlined,
                            color: Colors.transparent,
                          ),
                          title: Text(
                            "Üretim",
                            style: AppText.label,
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.dashboard_outlined,
                            color: Colors.transparent,
                          ),
                          title: Text(
                            "Depo",
                            style: AppText.label,
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.dashboard_outlined,
                            color: Colors.transparent,
                          ),
                          title: Text(
                            "Transfer",
                            style: AppText.label,
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.dashboard_outlined,
                            color: Colors.transparent,
                          ),
                          title: Text(
                            "İnsan Kaynakları",
                            style: AppText.label,
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //ETİKET
                    ListTile(
                      leading: const Icon(
                        Icons.qr_code,
                        color: AppColors.lightBlack,
                      ),
                      title: Text(
                        "Etiket",
                        style: AppText.contextSemiBold,
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //BELGELER
                    ExpansionTile(
                      collapsedTextColor: AppColors.lightBlack,
                      collapsedIconColor: AppColors.lightBlack,
                      collapsedBackgroundColor: AppColors.lightSecondary,
                      leading: const Icon(
                        Icons.text_snippet_outlined,
                        color: AppColors.lightBlack,
                      ),
                      title: Text(
                        "Belgeler",
                        style: AppText.contextSemiBold,
                      ),
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.text_snippet_outlined,
                            color: Colors.transparent,
                          ),
                          title: Text(
                            "Raporlar",
                            style: AppText.label,
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.dashboard_outlined,
                            color: Colors.transparent,
                          ),
                          title: Text(
                            "Faturalar",
                            style: AppText.label,
                          ),
                          onTap: () {},
                        ),

                      ],
                    ),
                  ],
                )
              ],
            )));
  }
}

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:erp_windows/widgets/app_form.dart';
import 'package:erp_windows/widgets/app_sidebar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../design/app_colors.dart';

import '../design/app_text.dart';
import '../states/states.dart';
import '../views/contents/barcode.dart';
import 'package:erp_windows/views/contents/panel.dart';
import 'package:erp_windows/views/contents/stock_material.dart';
import 'package:erp_windows/views/contents/order_incoming.dart';
import 'package:erp_windows/views/contents/order_outgoing.dart';
import 'package:erp_windows/views/contents/order_prepared.dart';
import 'package:erp_windows/views/contents/staff.dart';
import 'package:erp_windows/views/contents/stock_product.dart';
import 'package:erp_windows/views/contents/department_human_resources.dart';
import 'package:erp_windows/views/contents/department_production.dart';
import 'package:erp_windows/views/contents/department_store.dart';
import 'package:erp_windows/views/contents/department_transfer.dart';
import 'package:erp_windows/views/contents/doc_bills.dart';
import 'package:erp_windows/views/contents/doc_reports.dart';

const borderColor = AppColors.lightSecondary;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

List<Widget> contents = const [
  Panel(), // 0
  MaterialStock(), // 1
  ProductStock(), // 2
  IncomingOrder(), // 3
  PreparedOrder(), // 4
  OutgoingOrder(), // 5
  Staff(), // 6
  ProductionDepartment(), // 7
  StoreDepartment(), // 8
  TransferDepartment(), // 9
  HumanResourcesDepartment(), //10
  Barcode(), //11
  Reports(), //12
  Bills(), //13
];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WindowBorder(
        color: borderColor,
        width: 1,
        child: Row(
          children: const [AppSidebar(), RightSide()],
        ),
      ),
    );
  }
}

class RightSide extends StatefulWidget {
  const RightSide({Key? key}) : super(key: key);

  @override
  State<RightSide> createState() => _RightSideState();
}

class _RightSideState extends State<RightSide> {
  @override
  Widget build(BuildContext context) {
    int indexSidebar = Provider.of<States>(context).indexSidebar;

    return Expanded(
      child: Container(
        decoration: const BoxDecoration(color: AppColors.lightGrey),
        child: Column(children: [
          Container(
            color: AppColors.lightSecondary,
            child: WindowTitleBarBox(
              child: Row(
                children: [
                  Expanded(child: MoveWindow()),
                  const WindowButtons()
                ],
              ),
            ),
          ),
          Container(
            color: AppColors.lightSecondary,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 1,
                          child: AppForm.appAutoCompleteTextFormFieldForSearch(
                              hint: 'Ara...',
                              controller: TextEditingController(),
                              key: GlobalKey(),
                              suggestions: []),
                        ),
                        const Expanded(flex: 1, child: SizedBox()),
                        Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        FluentIcons.alert_28_regular)),
                                const SizedBox(width: 30),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: AppColors.lightGrey,
                                    border: Border.all(
                                        color: AppColors.lightPrimary),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: PopupMenuButton<int>(
                                    tooltip: "Profil Menüsü",
                                    padding: const EdgeInsets.all(8),
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                        onTap: () {},
                                        value: 1,
                                        child: Row(
                                          children: [
                                            const Icon(
                                              FluentIcons.person_28_regular,
                                              color: AppColors.lightPrimary,
                                            ),
                                            const SizedBox(width: 10),
                                            Text("Profil",
                                                style: AppText.contextSemiBold),
                                          ],
                                        ),
                                      ),
                                      PopupMenuItem(
                                        onTap: () {},
                                        value: 2,
                                        child: Row(
                                          children: [
                                            const Icon(
                                              FluentIcons.settings_24_regular,
                                              color: AppColors.lightPrimary,
                                            ),
                                            const SizedBox(width: 10),
                                            Text("Ayarlar",
                                                style: AppText.contextSemiBold),
                                          ],
                                        ),
                                      ),
                                      PopupMenuItem(
                                        onTap: () {},
                                        value: 3,
                                        child: Row(
                                          children: [
                                            const Icon(
                                              FluentIcons.chat_help_24_regular,
                                              color: AppColors.lightPrimary,
                                            ),
                                            const SizedBox(width: 10),
                                            Text("Yardım",
                                                style: AppText.contextSemiBold),
                                          ],
                                        ),
                                      ),
                                      PopupMenuItem(
                                        onTap: () {},
                                        value: 4,
                                        child: Row(
                                          children: [
                                            const Icon(
                                              FluentIcons.arrow_exit_20_regular,
                                              color: AppColors.lightPrimary,
                                            ),
                                            const SizedBox(width: 10),
                                            Text("Çıkış Yap",
                                                style: AppText.contextSemiBold),
                                          ],
                                        ),
                                      )
                                    ],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      side: const BorderSide(
                                          color: AppColors.lightPrimary),
                                    ),
                                    splashRadius: 20,
                                    offset: const Offset(0, 44),
                                    color: AppColors.lightSecondary,
                                    elevation: 0,
                                    child: Row(
                                      children: [
                                        //Profildeki resmin verildiği kısım
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/avatar.png"),
                                                fit: BoxFit.fill),
                                          ),
                                          height: 28,
                                          width: 28,
                                        ),
                                        const SizedBox(width: 16),
                                        const Text('burak'),
                                        const SizedBox(width: 16),
                                        const Icon(
                                            FluentIcons.chevron_down_24_filled),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 30),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        FluentIcons.settings_24_regular))
                              ],
                            )),
                      ]),
                ),
              ],
            ),
          ),
          Expanded(
            child: contents[indexSidebar],
          ),
        ]),
      ),
    );
  }
}

/// KAPATMA ALTA ALMA VE TAM EKRAN YAPMA BUTONLARI BUNDAN SONRASI

final buttonColors = WindowButtonColors(
    iconNormal: AppColors.lightPrimary,
    mouseOver: AppColors.lightPrimary,
    mouseDown: AppColors.lightPrimary,
    iconMouseOver: AppColors.lightSecondary,
    iconMouseDown: AppColors.lightPrimary);

final closeButtonColors = WindowButtonColors(
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: const Color(0xFFB71C1C),
    iconNormal: AppColors.lightPrimary,
    iconMouseOver: Colors.white);

class WindowButtons extends StatefulWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  _WindowButtonsState createState() => _WindowButtonsState();
}

class _WindowButtonsState extends State<WindowButtons> {
  void maximizeOrRestore() {
    setState(() {
      appWindow.maximizeOrRestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        appWindow.isMaximized
            ? RestoreWindowButton(
                colors: buttonColors,
                onPressed: maximizeOrRestore,
              )
            : MaximizeWindowButton(
                colors: buttonColors,
                onPressed: maximizeOrRestore,
              ),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}

/*PopupMenuButton<int>(
                  tooltip: "Profil Menüsü",
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () {},
                      value: 1,
                      child: Row(
                        children: [
                          const Icon(
                            FluentIcons.person_28_regular,
                            color: AppColors.lightPrimary,
                          ),
                          const SizedBox(width: 10),
                          Text("Profil", style: AppText.contextSemiBold),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {},
                      value: 2,
                      child: Row(
                        children: [
                          const Icon(
                            FluentIcons.settings_24_regular,
                            color: AppColors.lightPrimary,
                          ),
                          const SizedBox(width: 10),
                          Text("Ayarlar", style: AppText.contextSemiBold),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {},
                      value: 3,
                      child: Row(
                        children: [
                          const Icon(
                            FluentIcons.chat_help_24_regular,
                            color: AppColors.lightPrimary,
                          ),
                          const SizedBox(width: 10),
                          Text("Yardım", style: AppText.contextSemiBold),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {},
                      value: 4,
                      child: Row(
                        children: [
                          const Icon(
                            FluentIcons.arrow_exit_20_regular,
                            color: AppColors.lightPrimary,
                          ),
                          const SizedBox(width: 10),
                          Text("Çıkış Yap", style: AppText.contextSemiBold),
                        ],
                      ),
                    )
                  ],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: const BorderSide(color: AppColors.lightPrimary),
                  ),
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.add,
                    color: Colors.transparent,
                  ),
                  offset: const Offset(0, 44),
                  color: AppColors.lightSecondary,
                  elevation: 0,
                ),*/

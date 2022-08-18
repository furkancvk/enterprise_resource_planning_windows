import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:erp_windows/views/contents/departments/department_human_resources.dart';
import 'package:erp_windows/views/contents/departments/department_inventory.dart';
import 'package:erp_windows/views/contents/departments/department_manufacturing.dart';
import 'package:erp_windows/views/contents/departments/department_transfer.dart';
import 'package:erp_windows/views/contents/documents/document_bills.dart';
import 'package:erp_windows/views/contents/documents/document_reports.dart';
import 'package:erp_windows/views/contents/employee.dart';
import 'package:erp_windows/views/contents/order/order_incoming.dart';
import 'package:erp_windows/views/contents/order/order_outgoing.dart';
import 'package:erp_windows/views/contents/order/order_preparing.dart';
import 'package:erp_windows/views/contents/stock/stock_material.dart';
import 'package:erp_windows/views/contents/stock/stock_product.dart';
import 'package:erp_windows/widgets/app_form.dart';
import 'package:erp_windows/widgets/app_sidebar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../design/app_colors.dart';

import '../design/app_text.dart';
import '../states/states.dart';
import '../storage/storage.dart';
import '../utils/helpers.dart';
import '../views/contents/barcode.dart';
import 'package:erp_windows/views/contents/dashboard.dart';

const borderColor = AppColors.lightSecondary;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();
  final SecureStorage secureStorage = SecureStorage();

  List<Widget> contents = const [
    Dashboard(), // 0
    StockMaterial(), // 1
    StockProduct(), // 2
    OrderIncoming(), // 3
    OrderPreparing(), // 4
    OrderOutgoing(), // 5
    EmployeeManagement(), // 6
    DepartmentManufacturing(), // 7
    DepartmentInventory(), // 8
    DepartmentTransfer(), // 9
    DepartmentHumanResources(), //10
    Barcode(), //11
    DocumentReports(), //12
    DocumentBills(), //13
  ];
  List<String> contentSuggestions = const [
    "Panel", // 0
    "Stok > Hammadde", // 1
    "Stok > Bitmiş Ürün", // 2
    // OrderIncoming(), // 3
    // OrderPreparing(), // 4
    // OrderOutgoing(), // 5
    "Personel", // 6
    // DepartmentManufacturing(), // 7
    // DepartmentInventory(), // 8
    // DepartmentTransfer(), // 9
    // DepartmentHumanResources(), //10
    "Etiket", //11
    // DocumentReports(), //12
    // DocumentBills(), //13
  ];
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    // int indexSidebar = Provider.of<States>(context).indexSidebar;
    int indexContent = Provider.of<States>(context).indexContent;

    return Scaffold(
      body: WindowBorder(
        color: borderColor,
        width: 1,
        child: Row(
          children: [
            const AppSidebar(),
            Expanded(
              child: Column(
                children: [
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
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    color: AppColors.lightSecondary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 300,
                          height: 44,
                          child: AppForm.appAutoCompleteTextFormFieldForSearch(
                            hint: 'Ara...',
                            controller: _searchController,
                            key: GlobalKey(),
                            suggestions: contentSuggestions,
                          ),
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: (){},
                              icon: const Icon(FluentIcons.alert_24_regular),
                            ),
                            const SizedBox(width: 24),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                border: Border.all(color: AppColors.lightPrimary),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: PopupMenuButton<int>(
                                onCanceled: (){
                                  _isSelected = false ;
                                },
                                onSelected: (value){
                                  _isSelected = true;
                                },
                                tooltip: "Profil Menüsü",
                                padding: const EdgeInsets.all(8),
                                itemBuilder: (context) => [

                                  PopupMenuItem(
                                    onTap: logOut,
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
                                  side: const BorderSide(color: AppColors.lightPrimary),
                                ),
                                splashRadius: 20,
                                offset: const Offset(9, 37),
                                color: AppColors.lightSecondary,
                                elevation: 0,
                                child: Row(
                                  children: [
                                    //Profildeki resmin verildiği kısım
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        image: const DecorationImage(
                                          image: AssetImage("assets/images/avatar.png"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      height: 28,
                                      width: 28,
                                    ),
                                    const SizedBox(width: 16),
                                    FutureBuilder(
                                      future: getFirstName(),
                                      builder: (context, snapshot) {
                                        return Text(
                                          Helpers.titleCase(snapshot.data.toString()),
                                          style: AppText.contextSemiBold,
                                        );
                                      },
                                    ),
                                    const SizedBox(width: 16),
                                    _isSelected == true ? const Icon(FluentIcons.chevron_down_12_regular, size: 20) : const Icon(FluentIcons.chevron_up_12_regular, size: 20),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 24),
                            IconButton(
                              onPressed: (){},
                              icon: const Icon(FluentIcons.settings_24_regular),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: contents[indexContent]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void logOut() async {
    await secureStorage.deleteAllSecureData().then((value) => {
      Navigator.pushReplacementNamed(context, 'login_view'),
    });
  }

  Future<String> getFirstName() async {
    return await secureStorage.readSecureData('firstName');
  }

}

/*class RightSide extends StatefulWidget {
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
            padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 24),
            color: AppColors.lightSecondary,
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
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){}, icon: const Icon(FluentIcons.alert_24_regular)),
                        const SizedBox(width: 30),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.lightGrey,
                            border: Border.all(color: AppColors.lightPrimary),
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
                                    borderRadius: BorderRadius.circular(4),
                                    image: const DecorationImage(image: AssetImage("assets/images/avatar.png"), fit: BoxFit.fill),
                                  ),
                                  height: 28,
                                  width: 28,
                                ),
                                const SizedBox(width: 16),
                                const Text('burak'),
                                const SizedBox(width: 16),
                                const Icon(FluentIcons
                                    .chevron_down_24_filled),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                        IconButton(onPressed: (){}, icon: const Icon(FluentIcons.settings_24_regular)),
                      ],
                    )
                  ),
                ]),
          ),
          Expanded(
            child: contents[indexSidebar],
          ),
        ]),
      ),
    );
  }
}*/

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

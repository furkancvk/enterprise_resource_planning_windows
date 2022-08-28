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

import 'login.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  List<Map<String, dynamic>> contentSuggestions = [
    {
      "contentName": "Panel",
      "index": 0,
    },
    {
      "contentName": "Stok > Hammadde",
      "index": 1,
    },
    {
      "contentName": "Stok > Bitmiş Ürün",
      "index": 2,
    },
     /*OrderIncoming(), // 3
     OrderPreparing(), // 4
     OrderOutgoing(), // 5*/
    {
      "contentName": "Personel",
      "index": 6,
    },
    /* DepartmentManufacturing(), // 7
     DepartmentInventory(), // 8
     DepartmentTransfer(), // 9
     DepartmentHumanResources(), //10*/
    {
      "contentName": "Etiket",
      "index": 11,
    },
   /*  DocumentReports(), //12
     DocumentBills(), //13*/
  ];

  String firstName = "";

  @override
  void initState() {
    super.initState();
    getFirstName();
  }

  @override
  Widget build(BuildContext context) {
    Function setIndexContent = Provider.of<States>(context).setIndexContent;
    int indexContent = Provider.of<States>(context).indexContent;

    getTokenExpireDate();
    getAuthInfo();

    return Scaffold(
      body: WindowBorder(
        color: AppColors.lightSecondary,
        width: 1,
        child: Row( /// Ekranı sol sağ ikiye bölüyor
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
                  ), /// Kapatma genişletme aşağı alma butonları
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    color: AppColors.lightSecondary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 300,
                          height: 44,
                          child: Autocomplete<Map<String, dynamic>>(
                            optionsBuilder: (TextEditingValue textEditingValue) {
                              return contentSuggestions
                                  .where((Map<String, dynamic> item) => item["contentName"].toLowerCase()
                                  .startsWith(textEditingValue.text.toLowerCase())
                              ).toList();
                            },
                            displayStringForOption: (Map<String, dynamic> item) => item["contentName"],
                            fieldViewBuilder: (
                                BuildContext context,
                                TextEditingController fieldTextEditingController,
                                FocusNode fieldFocusNode,
                                VoidCallback onFieldSubmitted
                                ) {
                              return TextFormField(
                                controller: fieldTextEditingController,
                                focusNode: fieldFocusNode,
                                decoration: const InputDecoration(
                                  suffixIcon: Icon(
                                    FluentIcons.search_24_filled,
                                    color: AppColors.lightPrimary,
                                  ),
                                  hintText: "Ara...",
                                ),
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              );
                            },
                            onSelected: (Map<String, dynamic> item) {
                              debugPrint('Selected: ${item["contentName"]}');
                              setIndexContent(item["index"]);
                            },
                            optionsViewBuilder: (
                                BuildContext context,
                                AutocompleteOnSelected<Map<String, dynamic>> onSelected,
                                Iterable<Map<String, dynamic>> options
                                ) {
                              return Align(
                                alignment: Alignment.topLeft,
                                child: Material(
                                  child: Container(
                                    width: 300,
                                    height: 300,
                                    color: AppColors.lightSecondary,
                                    child: ListView.builder(
                                      padding: const EdgeInsets.all(8),
                                      itemCount: options.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        final Map<String, dynamic> option = options.elementAt(index);
                                        return ListTile(
                                          onTap: () {onSelected(option);},
                                          title: Text(
                                            option["contentName"],
                                            style: AppText.contextSemiBold,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          ), /// HomePage SearchBar
                        ),
                        Row(
                          children: [
                            /// Bildirimler Butonu
                            /*IconButton(
                              onPressed: (){},
                              icon: const Icon(FluentIcons.alert_24_regular),
                            ),*/
                            const SizedBox(width: 24),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                border: Border.all(color: AppColors.lightPrimary),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                children: [
                                  /// Profildeki resmin verildiği kısım
                                  Container(
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: AppColors.lightGrey,
                                    ),
                                    child: Icon(
                                      FluentIcons.person_32_regular, color: AppColors.lightPrimary.withOpacity(0.4),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Text(
                                    Helpers.titleCase(firstName),
                                    style: AppText.contextSemiBold,
                                  ),
                                  const SizedBox(width: 16),
                                  /*const SizedBox(width: 16),
                                  _isSelected == true
                                      ? const Icon(
                                      FluentIcons.chevron_down_12_regular,
                                      size: 20)
                                      : const Icon(
                                      FluentIcons.chevron_down_12_regular,
                                      size: 20),*/
                                ],
                              ),
                              /*child: PopupMenuButton<int>(
                                onCanceled: () => _isSelected = false,
                                onSelected: (value) => _isSelected = true,
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
                                    /// Profildeki resmin verildiği kısım
                                    Container(
                                      width: 28,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: AppColors.lightGrey,
                                      ),
                                      child: Icon(
                                        FluentIcons.person_32_regular, color: AppColors.lightPrimary.withOpacity(0.4),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Text(
                                      Helpers.titleCase(firstName),
                                      style: AppText.contextSemiBold,
                                    ),
                                    const SizedBox(width: 16),
                                    _isSelected == true
                                        ? const Icon(
                                            FluentIcons.chevron_down_12_regular,
                                            size: 20)
                                        : const Icon(
                                        FluentIcons.chevron_down_12_regular,
                                            size: 20),
                                  ],
                                ),
                              ),*/
                            ), /// Profil Kısmı
                            const SizedBox(width: 24),
                            IconButton(
                              onPressed: logOut,
                              icon: const Icon(FluentIcons.arrow_exit_20_regular,color: AppColors.lightPrimary,),
                            ),  /// Ayarlar Butonu
                          ],
                        ),
                      ],
                    ),
                  ), /// SearchBar + Profil butonu
                  Expanded(child: contents[indexContent]), /// Sayfalarımız
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getFirstName() async {
    secureStorage.readSecureData('firstName').then((value) {
      setState(() {
        firstName = value;
      });
    });
  }

  void getTokenExpireDate() async {
    secureStorage.readSecureData('tokenExpireDate').then((value) {
      debugPrint(DateTime.parse(value).isBefore(DateTime.now()).toString());
      if(DateTime.parse(value).isBefore(DateTime.now())) showMessage();
    });
  }

  void getAuthInfo() async {
    secureStorage.readSecureData('isAuthenticated').then((value) {
      debugPrint("isAuthenticated Home : $value");
      if(value == 'false') showMessage();
    });
  }

  void showMessage() async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Token Süresi Dolmuştur", textAlign: TextAlign.center, style: AppText.titleSemiBold,),
          content: const Text("Hesabınızla ilişkilendirilen token süresi\ndolmuştur. İşlemlerinize devam etmek için\nlütfen tekrar giriş yapınız.", textAlign: TextAlign.center),
          actionsAlignment: MainAxisAlignment.end,
          actionsPadding: const EdgeInsets.only(bottom: 24, right: 24),
          actions: [
            ElevatedButton(
              onPressed: logOut,
              child: const Text("Giriş Yap"),
            ),
          ],
        );
      },
    );
  }

  void logOut() async {

    await secureStorage.deleteSecureData('tokenExpireDate');
    await secureStorage.deleteSecureData('isAuthenticated');
    await secureStorage.deleteSecureData('firstName');
    await secureStorage.deleteSecureData('lastName');
    await secureStorage.deleteSecureData('email');
    await secureStorage.deleteSecureData('phoneNumber');
    await secureStorage.deleteSecureData('userId');
    await secureStorage.deleteSecureData('token').then((value) => Navigator.pushReplacementNamed(context, 'login_view'));

  }

}

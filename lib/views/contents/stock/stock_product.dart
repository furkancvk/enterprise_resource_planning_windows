import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../../design/app_colors.dart';
import '../../../design/app_text.dart';

class StockProduct extends StatelessWidget {
  const StockProduct({Key? key}) : super(key: key);

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
            Text("Bitmiş Ürün", style: AppText.titleSemiBold),
          ],
        ),
      ),
    );
  }
}

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../design/app_colors.dart';
import '../design/app_text.dart';

class AppCards {
  static Widget taskCard({
    required Color color,
    required String title,
    required String task,
    required String date,
    required String fullName,
  }) {
    return Container(
        padding: const EdgeInsets.only(left: 16, top: 4, bottom: 16),
        decoration: BoxDecoration(
          color: AppColors.lightPrimary.withOpacity(0.04),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(backgroundColor: color, radius: 9),
                    const SizedBox(width: 12),
                    Text(title, style: AppText.contextSemiBold)
                  ],
                ),
                PopupMenuButton<int>(
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () {},
                      value: 1,
                      child: Row(
                        children: [
                          const Icon(
                            FluentIcons.arrow_sync_24_regular,
                            color: AppColors.lightPrimary,
                          ),
                          const SizedBox(width: 10),
                          Text("İşleme Al", style: AppText.contextSemiBold),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {},
                      value: 2,
                      child: Row(
                        children: [
                          const Icon(
                            FluentIcons.clock_alarm_24_regular,
                            color: AppColors.lightPrimary,
                          ),
                          const SizedBox(width: 10),
                          Text("Alarm Ekle", style: AppText.contextSemiBold),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {},
                      value: 3,
                      child: Row(
                        children: [
                          const Icon(
                            FluentIcons.error_circle_20_regular,
                            color: AppColors.lightPrimary,
                          ),
                          const SizedBox(width: 10),
                          Text("Hata Bildir", style: AppText.contextSemiBold),
                        ],
                      ),
                    ),
                  ],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: const BorderSide(color: AppColors.lightPrimary),
                  ),
                  splashRadius: 20,
                  icon: const Icon(
                    FluentIcons.more_vertical_24_regular,
                    color: AppColors.lightBlack,
                  ),
                  offset: const Offset(0, 44),
                  color: AppColors.lightSecondary,
                  elevation: 0,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.only(right: 16),
              child: Text(task, style: AppText.context),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.lightPrimary.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        FluentIcons.calendar_ltr_24_regular,
                        color: AppColors.lightBlack,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        date,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.4,
                          color: AppColors.lightBlack,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.lightPrimary.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        FluentIcons.person_24_regular,
                        color: AppColors.lightBlack,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        fullName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.4,
                          color: AppColors.lightBlack,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }

  static Widget processCard({
    required IconData icon,
    required String text,
    required void Function() onTap,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Material(
        color: AppColors.lightGrey,
        shadowColor: AppColors.lightBlack,
        child: InkWell(
          onTap: onTap,
          child: Card(
            color: AppColors.lightGrey,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              width: 90,
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 24, color: AppColors.lightPrimary),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Text(
                      text,
                      style: const TextStyle(
                          color: AppColors.lightPrimary,
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget addImgCard({required void Function() onTap}) {
    return InkWell(
      onTap: (){},
      child: Container(
        height: 156,
        decoration: BoxDecoration(
          color: AppColors.lightPrimary.withOpacity(0.04),
          border: Border.all(
            color: AppColors.lightPrimary,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              FluentIcons.image_24_regular,
              size: 53,
              color: AppColors.lightPrimary,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  FluentIcons.add_24_regular,
                  size: 28,
                  color: AppColors.lightPrimary,
                ),
                Text('Görsel Ekle', style: AppText.contextSemiBold),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget panelDataCard({
    required IconData icon,
    required String label,
    required String data,
    required Color color,
    onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.lightSecondary,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 40),
            const SizedBox(width: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.4,
                    color: color,
                  ),
                ),
                Text(
                  data,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.4,
                    color: color,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  static Widget stockSituationCard(
      {required Color color, required String data}) {
    return Container(
      height: 44,
      width: 85,
      decoration: BoxDecoration(
        border: Border.all(color: color),
        color: color.withOpacity(0.16),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          data,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.4,
            color: color,
          ),
        ),
      ),
    );
  }
}
/*
class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({Key? key}) : super(key: key);

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Resim yükleme başarısız oldu: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const Icon(
                    FluentIcons.content_view_gallery_24_regular,
                    color: AppColors.lightPrimary,
                  ),
                  title: Text('Galeriden fotoğraf seç',
                      style: AppText.context),
                  onTap: () {
                    pickImage(ImageSource.gallery);
                  },
                  tileColor: AppColors.lightSecondary,
                ),
                ListTile(
                  leading: const Icon(
                    FluentIcons.camera_24_regular,
                    color: AppColors.lightPrimary,
                  ),
                  title: Text('Kamera ile fotoğraf çek',
                      style: AppText.context),
                  onTap: () {
                    pickImage(ImageSource.camera);
                  },
                  tileColor: AppColors.lightSecondary,
                ),
              ],
            ));
      },
      child: image != null
          ? Container(
        width: 171,
        height: 156,
        decoration: BoxDecoration(
          color: AppColors.lightPrimary.withOpacity(0.04),
          border: Border.all(
            color: AppColors.lightPrimary,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Image.file(image!, fit: BoxFit.cover),
      )
          : Container(
        height: 156,
        decoration: BoxDecoration(
          color: AppColors.lightPrimary.withOpacity(0.04),
          border: Border.all(
            color: AppColors.lightPrimary,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              FluentIcons.image_24_regular,
              size: 53,
              color: AppColors.lightPrimary,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  FluentIcons.add_24_regular,
                  size: 28,
                  color: AppColors.lightPrimary,
                ),
                Text('Görsel Ekle', style: AppText.contextSemiBold),
              ],
            ),
          ],
        ),
      ),
    );
  }
}*/

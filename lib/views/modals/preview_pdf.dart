import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;


import '../../design/app_colors.dart';
import '../../models/app_material.dart';

class PreviewPdf extends StatelessWidget {
  const PreviewPdf({Key? key, required this.material, required this.amount}) : super(key: key);
  final AppMaterial material;
  final int amount;

  Future<Uint8List> _generatePdf(PdfPageFormat format, AppMaterial material) async {
    final font = await rootBundle.load("assets/fonts/SourceSansPro-SemiBold.ttf");
    final ttf = pw.Font.ttf(font);
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final resultData = List.generate(amount >= 4000 ? 4000: amount, (index) {
      return pw.BarcodeWidget(
        color: PdfColor.fromHex("#000000"),
        barcode: pw.Barcode.qrCode(),
        data: material.referenceNumber.toString(),
      );
    });

    pdf.addPage(
      pw.MultiPage(
        maxPages: 60,
        header: (context) {
          return pw.Column(
              children: [
                pw.Text("${material.materialName} | ${material.typeName} | ${material.colorName}", style: pw.TextStyle(
                  color: PdfColors.black,
                  fontWeight: pw.FontWeight.bold,
                  font: ttf,
                ),),
                pw.SizedBox(height: 30),
              ]
          );

        },

        margin: const pw.EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        pageFormat: format,
        build: (context) {
          return [
            pw.GridView(
              crossAxisCount: 8,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              childAspectRatio: 1,
              children: resultData,
            ),
          ];
        },
      ),
    );
    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.lightGrey,
      title: const Text(
        "QR Kodu Yazdır",
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.lightPrimary),
      ),
      content: SizedBox(
        width: 450,
        child: PdfPreview(
          build: (format) => _generatePdf(format, material),
        ),
      ),
    );
  }
}
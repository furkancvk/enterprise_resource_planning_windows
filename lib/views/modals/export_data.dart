import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;


import '../../design/app_colors.dart';
import '../../models/app_material.dart';
import '../../utils/helpers.dart';

class ExportData extends StatelessWidget {
  const ExportData({
    Key? key,
    required this.title,
    required this.dataList,
    required this.tableHeaders,
    required this.buildRow,
  }) : super(key: key);

  final String title;
  final List<dynamic> dataList;
  final List<String> tableHeaders;
  final List<dynamic> Function(int index) buildRow;

  Future<Uint8List> _generatePdf(PdfPageFormat format, List<dynamic> list) async {
    final font = await rootBundle.load("assets/fonts/SourceSansPro-SemiBold.ttf");
    final ttf = pw.Font.ttf(font);
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);

    final logo = pw.MemoryImage((await rootBundle.load('assets/images/logo-blue.png')).buffer.asUint8List());

    String currentFullDate = DateTime.parse(DateTime.now().toString()).toLocal().toString();
    String currentDate = currentFullDate.substring(0, currentFullDate.indexOf(" "));
    String currentTime = currentFullDate.substring(currentFullDate.indexOf(" "), currentFullDate.length - 7);

    final table = pw.Table.fromTextArray(
      border: null,
      headers: tableHeaders,
      data: List<List<dynamic>>.generate(dataList.length, (index) => buildRow(index)),
      headerStyle: pw.TextStyle(
        color: PdfColors.white,
        fontWeight: pw.FontWeight.bold,
        font: ttf,
      ),
      cellStyle: pw.TextStyle(
        font: ttf,
      ),
      headerDecoration: const pw.BoxDecoration(
        color: PdfColors.blue700,
      ),
      rowDecoration: const pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(
            color: PdfColors.blue700,
            width: .5,
          ),
        ),
      ),
      cellAlignment: pw.Alignment.center,
      cellAlignments: {0: pw.Alignment.centerLeft},
    );

    pdf.addPage(
      pw.MultiPage(
        header: (context) {
          return pw.Column(
              children: [
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text("$currentDate $currentTime"),
                        pw.SizedBox(height: 12),
                        pw.Text(title, style: pw.TextStyle(font: ttf, fontSize: 20)),
                      ],
                    ),
                    pw.Image(logo),
                  ],
                ),
                pw.SizedBox(height: 20),
              ]
          );
        },
        margin: const pw.EdgeInsets.all(15),
        pageFormat: format,
        build: (context) {
          return [table];
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
        "Dışa Aktar",
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.lightPrimary),
      ),
      content: SizedBox(
        width: 450,
        child: PdfPreview(
          build: (format) => _generatePdf(format, dataList),
        ),
      ),
    );
  }
}
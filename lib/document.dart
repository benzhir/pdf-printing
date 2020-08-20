/*
 * Copyright (C) 2017, David PHAM-VAN <dev.nfet.net@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// ignore_for_file: always_specify_types

import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:pdf_printer/data.dart';

Future<Uint8List> generateDocument(PdfPageFormat format) async {
  final pw.Document doc = pw.Document();
  final font = await rootBundle.load("assets/OpenSans-Bold.ttf");
  final ttf = Font.ttf(font);

  doc.addPage(pw.MultiPage(
      pageFormat:
          PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      footer: (pw.Context context) {
        return pw.Container(
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: pw.Text(
                'Page ${context.pageNumber} of ${context.pagesCount}',
                style:
                    TextStyle(font: ttf, fontSize: 18, color: PdfColors.grey)));
      },
      build: (pw.Context context) => <pw.Widget>[
            pw.Paragraph(text: 'Nom : \t \t ' + Data.lastName),
            pw.Paragraph(text: 'Prénom : \t \t ' + Data.firstName),
            pw.Paragraph(text: 'Adresse : \t \t ' + Data.address),
            pw.Paragraph(text: 'Tél.Portable : \t \t ' + Data.phoneNumber),
            pw.Padding(padding: const pw.EdgeInsets.all(50)),
            pw.Table.fromTextArray(
                context: context,
                data: <List<String>>[
                  <String>['Avant le diagnostic', 'Aprés le diagnostic'],
                  <String>[Data.beforeDiagnostic, Data.afterDiagnostic],
                ],
                cellPadding: EdgeInsets.all(16),
                cellAlignment: Alignment.center),
            pw.Padding(padding: const pw.EdgeInsets.all(30)),
            pw.Table.fromTextArray(
                context: context,
                data: const <List<String>>[
                  <String>['BON POUR ACCORD SIGNATURE', 'OBSERVATIONS'],
                  <String>['', ''],
                ],
                cellPadding: EdgeInsets.all(50),
                cellAlignment: Alignment.center),
          ]));

  return doc.save();
}

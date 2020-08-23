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

import 'package:diagnostic_app/constants.dart';
import 'package:diagnostic_app/main.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:diagnostic_app/data.dart';

Future<Uint8List> generateDocument(PdfPageFormat format) async {
  final pw.Document doc = pw.Document();
  final font = await rootBundle.load("assets/OpenSans-Bold.ttf");
  final ttf = Font.ttf(font);

  doc.addPage(pw.MultiPage(
      pageFormat:
          PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      build: (pw.Context context) => <pw.Widget>[
            pw.Text('suivi par : \t \t ' + Data.lastName),
            pw.Row(children: <Widget>[
              pw.Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: pw.Text(
                      'Cachet du réparateure',
                    ),
                  )),
              pw.Expanded(
                flex: 1,
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: <Widget>[
                      pw.Paragraph(
                          text: 'Nom : \t \t ' + MyAppState.client.lastName),
                      pw.Paragraph(
                          text:
                              'Prénom : \t \t ' + MyAppState.client.firstName),
                      pw.Paragraph(
                          text:
                              'Adresse : \t \t ' + MyAppState.client.lastName),
                      pw.Paragraph(
                          text: 'Tél.Portable : \t \t ' +
                              MyAppState.client.phoneNumber),
                      pw.Paragraph(
                          text: 'Mail : \t \t ' + MyAppState.client.email),
                    ]),
              )
            ]),
            pw.Text('IDENTIFICATION DU VEHICULE : \t \t ' + Data.lastName,
                style: TextStyle(
                  font: ttf,
                  fontSize: 16,
                )),
            pw.Padding(padding: const pw.EdgeInsets.all(8)),
            pw.Column(children: <Widget>[
              pw.Row(children: <Widget>[
                pw.Expanded(
                  flex: 1,
                  child: pw.Text('MARQUE:' + Data.lastName,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.Text(
                    MyAppState.client.car.maque,
                  ),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.Text('MODELE:' + Data.lastName,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.Text(
                    MyAppState.client.car.modele,
                  ),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.Text('VERSION:' + Data.lastName,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.Text(
                    MyAppState.client.car.version,
                  ),
                )
              ]),
              pw.Divider(color: PdfColors.black, thickness: 1.0),
              pw.Row(children: <Widget>[
                pw.Expanded(
                  flex: 1,
                  child: pw.Text('N° DE SERIE:' + Data.lastName,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.Text(
                    MyAppState.client.car.serie,
                  ),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.Text('IMMATRICULATION:' + Data.lastName,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.Text(
                    MyAppState.client.car.immatriculation,
                  ),
                ),
              ]),
              pw.Divider(color: PdfColors.black, thickness: 1.0),
              pw.Row(children: <Widget>[
                pw.Expanded(
                  flex: 1,
                  child: pw.Text('DATE DE 1er MISE EN CIRCULATION:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.Text(
                    MyAppState.client.car.dateMiseEnCirculation,
                  ),
                )
              ]),
              pw.Divider(color: PdfColors.black, thickness: 1.0),
              pw.Row(children: <Widget>[
                pw.Expanded(
                  flex: 2,
                  child: pw.Text('ANTIVOL DE ROUES:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.Text(
                    MyAppState.client.car.antivol,
                  ),
                ),
                pw.Expanded(
                  flex: 2,
                  child: pw.Text('CODE MOTEUR:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.Text(
                    MyAppState.client.car.codeMoteur,
                  ),
                ),
              ]),
              pw.Divider(color: PdfColors.black, thickness: 1.0),
            ]),
            pw.Padding(padding: const pw.EdgeInsets.all(8)),
            pw.Table.fromTextArray(
                context: context,
                data: <List<String>>[
                  <String>[
                    vMoteur,
                    MyAppState.client.prestation.vMoteur ? 'X' : '    ',
                    fHabitacle,
                    MyAppState.client.prestation.fHabitacle ? 'X' : '    ',
                    reporogrammation,
                    MyAppState.client.prestation.reporogrammation ? 'X' : '   ',
                  ],
                  <String>[
                    vboite,
                    MyAppState.client.prestation.vPoint ? 'X' : '   ',
                    lFrien,
                    MyAppState.client.prestation.lFrien ? 'X' : '   ',
                    diagnostic,
                    MyAppState.client.prestation.diagnostic ? 'X' : '   ',
                  ],
                  <String>[
                    vPoint,
                    MyAppState.client.prestation.vPoint ? 'X' : '   ',
                    lRefroidisement,
                    MyAppState.client.prestation.lRefroidisement ? 'X' : '   ',
                    balais,
                    MyAppState.client.prestation.balais ? 'X' : '   ',
                  ],
                  <String>[
                    fAir,
                    MyAppState.client.prestation.fAir ? 'X' : '   ',
                    eRoues,
                    MyAppState.client.prestation.eRoues ? 'X' : '   ',
                    eclairage,
                    MyAppState.client.prestation.eclairage ? 'X' : '   ',
                  ],
                  <String>[
                    fHuile,
                    MyAppState.client.prestation.fHuile ? 'X' : '   ',
                    pneus,
                    MyAppState.client.prestation.pneus ? 'X' : '   ',
                    obd,
                    MyAppState.client.prestation.obd ? 'X' : '   ',
                  ],
                  <String>[
                    fCarburant,
                    MyAppState.client.prestation.fCarburant ? 'X' : '   ',
                    climatisation,
                    MyAppState.client.prestation.climatisation ? 'X' : '   ',
                    bougies,
                    MyAppState.client.prestation.bougies ? 'X' : '   ',
                  ],
                ],
                cellAlignment: Alignment.topLeft,
                headerAlignment: pw.Alignment.topLeft),
            pw.Padding(padding: const pw.EdgeInsets.all(8)),
            pw.Table.fromTextArray(
                context: context,
                data: <List<String>>[
                  <String>['Avant le diagnostic', 'Aprés le diagnostic'],
                  <String>[Data.beforeDiagnostic, Data.afterDiagnostic],
                ],
                cellPadding: EdgeInsets.all(16),
                cellAlignment: Alignment.center),
            pw.Padding(padding: const pw.EdgeInsets.all(16)),
            pw.Table.fromTextArray(
                context: context,
                data: const <List<String>>[
                  <String>['BON POUR ACCORD SIGNATURE', 'OBSERVATIONS'],
                  <String>['', ''],
                ],
                cellPadding: EdgeInsets.all(16),
                cellAlignment: Alignment.center),
          ]));

  return doc.save();
}

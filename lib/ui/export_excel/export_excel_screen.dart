// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as excel;

class ExportExcelScreen extends StatefulWidget {
  const ExportExcelScreen({Key? key}) : super(key: key);

  @override
  State<ExportExcelScreen> createState() => _ExportExcelScreenState();
}

class _ExportExcelScreenState extends State<ExportExcelScreen> {
  List dataContentCreator = [
    {"title": "Cewe Ngoding", "desc": "Membahas perihal ngoding"},
    {"title": "Cewe Ngoding2", "desc": "Membahas perihal ngoding2"},
    {"title": "Cewe Ngoding3", "desc": "Membahas perihal ngoding3"},
    {"title": "Cewe Ngoding4", "desc": "Membahas perihal ngoding4"},
    {"title": "Cewe Ngoding5", "desc": "Membahas perihal ngoding5"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Export Excel"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    final excel.Workbook workbook = excel.Workbook();
                    final excel.Worksheet sheet = workbook.worksheets[0];
                    sheet.getRangeByName('A1').setText('Nama Content Creator');
                    sheet
                        .getRangeByName('B1')
                        .setText('Deskripsi Content Creator');
                    for (int i = 2; i < dataContentCreator.length + 2; i++) {
                      sheet
                          .getRangeByName('A$i')
                          .setText(dataContentCreator[i - 2]['title']);
                      sheet
                          .getRangeByName('B$i')
                          .setText(dataContentCreator[i - 2]['desc']);
                    }
                    final List<int> bytes = workbook.saveAsStream();
                    var path =
                        await ExternalPath.getExternalStoragePublicDirectory(
                            ExternalPath.DIRECTORY_DOWNLOADS);
                    File('$path/CreateExcel3.xlsx').writeAsBytes(bytes);
                  },
                  child: const Text('Export Excel'))
            ],
          ),
        ),
      ),
    );
  }
}

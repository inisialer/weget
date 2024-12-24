// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as excel;
import 'package:weget/helper/save_file.dart';

class HomeAudioPlayers extends StatefulWidget {
  const HomeAudioPlayers({Key? key}) : super(key: key);

  @override
  State<HomeAudioPlayers> createState() => _HomeAudioPlayersState();
}

class _HomeAudioPlayersState extends State<HomeAudioPlayers> {
  final player = AudioPlayer();
  PlayerState? _playerState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () async {
                        final excel.Workbook workbook = excel.Workbook();
                        final excel.Worksheet sheet = workbook.worksheets[0];
                        sheet.showGridlines = false;

                        // Enable calculation for worksheet.
                        sheet.enableSheetCalculations();

                        //Set data in the worksheet.
                        sheet.getRangeByName('A1').columnWidth = 4.82;
                        sheet.getRangeByName('B1:C1').columnWidth = 13.82;
                        sheet.getRangeByName('D1').columnWidth = 13.20;
                        sheet.getRangeByName('E1').columnWidth = 7.50;
                        sheet.getRangeByName('F1').columnWidth = 9.73;
                        sheet.getRangeByName('G1').columnWidth = 8.82;
                        sheet.getRangeByName('H1').columnWidth = 4.46;

                        sheet.getRangeByName('B4').setText('FFT');
                        sheet.getRangeByName('B4').cellStyle.fontSize = 12;

                        final excel.Range range6 =
                            sheet.getRangeByName('B7:D7');
                        range6.cellStyle.fontSize = 14;
                        range6.cellStyle.fontColor = '#FFFFFF';
                        range6.cellStyle.bold = true;
                        range6.cellStyle.backColor = '#24478B';

                        sheet.getRangeByIndex(7, 2).setText('Freq');

                        for (int i = 8; i < 10 + 8; i++) {
                          sheet.getRangeByIndex(i, 2).setText('haii');
                        }

                        //Save and launch the excel.
                        final List<int> bytes = workbook.saveAsStream();

                        // workbook.dispose();
                        await saveAndLaunchFile(bytes, 'FFT.xlsx');

                        // if (_playerState == PlayerState.paused) {
                        //   await player.resume();
                        // } else {
                        //   await player.play(UrlSource(
                        //       'https://www2.cs.uic.edu/~i101/SoundFiles/BabyElephantWalk60.wav'));
                        // }
                      },
                      icon: const Icon(Icons.play_arrow)),
                  IconButton(
                      onPressed: () async {
                        await player.pause();
                        setState(() {
                          _playerState = PlayerState.paused;
                        });
                      },
                      icon: const Icon(Icons.pause)),
                  IconButton(
                      onPressed: () async {
                        await player.stop();
                      },
                      icon: const Icon(Icons.stop)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

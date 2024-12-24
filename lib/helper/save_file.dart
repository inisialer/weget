import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:open_file/open_file.dart' as open_file;

Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
  String? path = await ExternalPath.getExternalStoragePublicDirectory(
      ExternalPath.DIRECTORY_DOWNLOADS);
  final File file = File('$path/$fileName');
  await file.writeAsBytes(bytes, flush: true);
  await open_file.OpenFile.open(file.path);
}

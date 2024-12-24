import 'package:call_log/call_log.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weget/bloc/form/form_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weget/helper/router.dart';
import 'package:workmanager/workmanager.dart';

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    print('Background Services are Working!');
    try {
      Iterable<CallLogEntry> cLog = await CallLog.get();
      print('Queried call log entries');
      for (CallLogEntry entry in cLog) {
        print('-------------------------------------');
        print('F. NUMBER  : ${entry.formattedNumber}');
        print('C.M. NUMBER: ${entry.cachedMatchedNumber}');
        print('NUMBER     : ${entry.number}');
        print('NAME       : ${entry.name}');
        print('TYPE       : ${entry.callType}');
        print(
            'DATE       : ${DateTime.fromMillisecondsSinceEpoch(entry.timestamp ?? 0)}');
        print('DURATION   : ${entry.duration}');
        print('ACCOUNT ID : ${entry.phoneAccountId}');
        print('SIM NAME   : ${entry.simDisplayName}');
        print('-------------------------------------');
      }
      return true;
    } on PlatformException catch (e, s) {
      print(e);
      print(s);
      return true;
    }
  });
}

void main() {
  runApp(DevicePreview(builder: (context) => const MyApp()));
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: BlocProvider(
        create: (context) => FormBloc(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          routerConfig: router,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              buttonTheme: const ButtonThemeData(buttonColor: Colors.amber)),
        ),
      ),
    );
  }
}

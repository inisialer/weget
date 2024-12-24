import 'dart:developer';

import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:workmanager/workmanager.dart';

///TOP-LEVEL FUNCTION PROVIDED FOR WORK MANAGER AS CALLBACK

/// example widget for call log plugin
class CallLogScreen extends StatefulWidget {
  const CallLogScreen({super.key});

  @override
  _CallLogScreenState createState() => _CallLogScreenState();
}

class _CallLogScreenState extends State<CallLogScreen> {
  Iterable<CallLogEntry> _callLogEntries = <CallLogEntry>[];
  bool permissionDenied = false;
  List<Contact> contacts = [];

  void fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      permissionDenied = true;
    } else {
      try {
        final contact = await FlutterContacts.getContacts(
          withAccounts: true,
          withProperties: true,
          withPhoto: true,
          withThumbnail: true,
        );

        setState(() {
          contacts.addAll(contact);
          for (var element in contacts) {
            String phoneNumber =
                element.phones.isNotEmpty ? element.phones.first.number : "";
          }
          log(contacts.toString());
        });
      } finally {}
    }
  }

  getLog() async {
    final Iterable<CallLogEntry> result = await CallLog.query();
    setState(() {
      _callLogEntries = result;
    });
    fetchContacts();
  }

  @override
  void initState() {
    getLog();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle mono = TextStyle(fontFamily: 'monospace');
    final List<Widget> children = <Widget>[];
    for (CallLogEntry entry in _callLogEntries) {
      children.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Divider(),
            Text('F. NUMBER  : ${entry.formattedNumber}', style: mono),
            Text('C.M. NUMBER: ${entry.cachedMatchedNumber}', style: mono),
            Text('NUMBER     : ${entry.number}', style: mono),
            Text('NAME       : ${entry.name}', style: mono),
            Text('TYPE       : ${entry.callType}', style: mono),
            Text(
                'DATE       : ${DateTime.fromMillisecondsSinceEpoch(entry.timestamp ?? 0)}',
                style: mono),
            Text('DURATION   : ${entry.duration}', style: mono),
            Text('ACCOUNT ID : ${entry.phoneAccountId}', style: mono),
            Text('SIM NAME   : ${entry.simDisplayName}', style: mono),
          ],
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('call_log example')),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      // setState(() {
                      fetchContacts();
                      // });
                    },
                    child: const Text('Get all'),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Workmanager().registerOneOffTask(
                        DateTime.now().millisecondsSinceEpoch.toString(),
                        'simpleTask',
                        existingWorkPolicy: ExistingWorkPolicy.replace,
                      );
                    },
                    child: const Text('Get all in background'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: children),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketIoExample extends StatefulWidget {
  const SocketIoExample({super.key});

  @override
  _SocketIoExampleState createState() => _SocketIoExampleState();
}

class _SocketIoExampleState extends State<SocketIoExample> {
  late IO.Socket socket;

  @override
  void initState() {
    super.initState();
    initializeSocket();
    // sendRequestDevice();
  }

  void initializeSocket() {
    // Initialize the socket connection
    socket = IO.io('http://45.77.248.203:8000/wokay', <String, dynamic>{
      "transports": ["websocket"],
      "query": {"userId": "123321"},
      "autoConnect": true,
      "debug": true, // Tambahkan ini
    });

    // Connect to the socket
    socket.onConnect((_) {
      log(socket.connected.toString());

      log('Connected to socket');
      addListeners();
      // sendRequestDevice();
    });

    // Listen for estimate:get:price event

    // Handle errors
    socket.onConnectError((data) {
      log('Connection Error: $data');
    });

    socket.onError((data) {
      log('Error: $data');
    });
    socket.onDisconnect((data) {
      log('Disconnect: $data');
    });
  }

  void addListeners() {
    // Listener spesifik
    socket.on('estimate:status', (data) {
      try {
        log('Data received from estimate:status: $data');
        log('Data type: ${data.runtimeType}');
      } catch (e) {
        log('Error handling estimate:status: $e');
      }
    });

    socket.on('estimate:join:room', (data) {
      log('Received price data room: $data');
    });

    socket.on('estimate:get:price:response', (data) {
      log('Received price data price: $data');
    });
  }

  void sendRequestDevice() {
    final requestDeviceMessage = {
      "idempotentKey": "123123",
      "provider": "gojek",
    };

    socket.emit('estimate:request:device', requestDeviceMessage);
    log('Sent request: estimate:request:device');
  }

  void sendGetPrice() {
    final getPriceMessage = {
      "room": "test00001",
      "device": "gojek001",
      "provider": "gojek",
      "pickup": {
        "longitude": "103.8493095",
        "latitude": "103.8493095",
        "address": "10 Eunos Road 8, Singapore 408600"
      },
      "dropoff": {
        "longitude": "103.8493095",
        "latitude": "103.8493095",
        "address": "970 Toa Payoh North, Singapore 318992"
      }
    };
    socket.emit('estimate:get:price', getPriceMessage);

    log('Sent request: estimate:get:price');
  }

  @override
  void dispose() {
    socket.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Socket.IO Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: sendRequestDevice,
              child: const Text('Send Request Device'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: sendGetPrice,
              child: const Text('Send Get Price'),
            ),
          ],
        ),
      ),
    );
  }
}

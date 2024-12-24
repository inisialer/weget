// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:url_launcher/url_launcher.dart';

// class MapScreen extends StatefulWidget {
//   static const String route = '/';

//   const MapScreen({super.key});

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   final mapController = MapController();
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(children: [
//       FlutterMap(
//         mapController: mapController,
//         options: const MapOptions(
//           initialCenter: LatLng(-6.8594509609224055, 109.03291691590226),
//           initialZoom: 15,
//         ),
//         children: [
//           TileLayer(
//             urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//             userAgentPackageName: 'com.example.app',
//           ),
//           const MarkerLayer(
//             markers: [
//               Marker(
//                   width: 80.0,
//                   height: 80.0,
//                   point: LatLng(-6.8594509609224055, 109.03291691590226),
//                   child: Icon(
//                     Icons.location_on,
//                     color: Colors.red,
//                     size: 50,
//                   )),
//               Marker(
//                   width: 80.0,
//                   height: 80.0,
//                   point: LatLng(-6.883924981080053, 109.0785762561333),
//                   child: Icon(
//                     Icons.location_on,
//                     color: Colors.blue,
//                     size: 50,
//                   )),
//             ],
//           ),
//           PolylineLayer(
//             polylines: [
//               Polyline(
//                 points: [
//                   const LatLng(-6.8594509609224055, 109.03291691590226),
//                   const LatLng(-6.883924981080053, 109.0785762561333),
//                 ],
//                 strokeWidth: 3,
//                 color: Colors.blue,
//               ),
//             ],
//           ),
//           RichAttributionWidget(
//             attributions: [
//               TextSourceAttribution(
//                 'OpenStreetMap contributors',
//                 onTap: () =>
//                     launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
//               ),
//             ],
//           ),
//         ],
//       )
//     ]));
//   }
// }

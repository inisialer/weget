// // ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

// class HomeRideCompareScreen extends StatefulWidget {
//   const HomeRideCompareScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeRideCompareScreen> createState() => _HomeRideCompareScreenState();
// }

// class _HomeRideCompareScreenState extends State<HomeRideCompareScreen> {
//   MapController? _mapController;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SizedBox(
//       width: double.infinity,
//       height: double.infinity,
//       child: Stack(
//         children: [
//           FlutterMap(
//             mapController: _mapController,
//             options: MapOptions(
//               initialCenter: const LatLng(1.3521, 103.8198),
//               initialZoom: 15.0,
//               onMapReady: () {},
//               onPositionChanged: (position, hasGesture) {},
//             ),
//             children: [
//               TileLayer(
//                 urlTemplate:
//                     'https://www.onemap.gov.sg/maps/tiles/Night/{z}/{x}/{y}.png',
//                 subdomains: const ['maps'],
//               ),
//             ],
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       width: 30,
//                       height: 30,
//                       decoration: const BoxDecoration(
//                           shape: BoxShape.circle, color: Colors.black),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 12, vertical: 4),
//                       decoration: const BoxDecoration(
//                         color: Colors.black,
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(16.0),
//                         ),
//                       ),
//                       child: const Text(
//                         'Alamatttttt',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(4),
//                       decoration: const BoxDecoration(
//                           shape: BoxShape.circle, color: Colors.black),
//                       child: const Icon(
//                         Icons.abc,
//                         color: Colors.white,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 16),
//                       child: SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         controller: ScrollController(),
//                         child: Row(
//                           children: List.generate(
//                             10,
//                             (index) {
//                               return Container(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 12.0,
//                                   vertical: 8.0,
//                                 ),
//                                 margin: const EdgeInsets.only(right: 10.0),
//                                 decoration: const BoxDecoration(
//                                   color: Colors.black,
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(12.0),
//                                   ),
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     const Icon(
//                                       Icons.home,
//                                       color: Colors.grey,
//                                       size: 20,
//                                     ),
//                                     const SizedBox(
//                                       width: 8.0,
//                                     ),
//                                     Text(
//                                       "Menu ${index + 1}",
//                                       style: const TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 11.0,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 16.0,
//                     ),
//                     Container(
//                         decoration: const BoxDecoration(
//                             color: Colors.black,
//                             borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(16),
//                                 topRight: Radius.circular(16))),
//                         padding: const EdgeInsets.all(16),
//                         child: Column(
//                           children: [
//                             Container(
//                               width: double.infinity,
//                               height: 50,
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 16,
//                               ),
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12),
//                                   border: Border.all(
//                                       color: Colors.white.withOpacity(.3))),
//                               child: const Row(
//                                 children: [
//                                   Icon(
//                                     Icons.location_on,
//                                     color: Colors.red,
//                                   ),
//                                   SizedBox(
//                                     width: 16.0,
//                                   ),
//                                   Text('Where to?',
//                                       style: TextStyle(color: Colors.white))
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 16.0,
//                             ),
//                             SizedBox(
//                               width: double.infinity,
//                               height: 50,
//                               child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                       backgroundColor: Colors.white),
//                                   onPressed: () {},
//                                   child: const Text(
//                                     'Continue',
//                                     style: TextStyle(color: Colors.black),
//                                   )),
//                             )
//                           ],
//                         ))
//                   ],
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     ));
//   }
// }

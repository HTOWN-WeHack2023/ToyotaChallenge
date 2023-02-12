// // ignore_for_file: curly_braces_in_flow_control_structures, unused_field, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_final_fields

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import 'package:flutter_mapbox_navigation/library.dart';

// class NavigationStarter extends StatefulWidget {
//   @override
//   _NavigationStarterState createState() => _NavigationStarterState();
// }

// class _NavigationStarterState extends State<NavigationStarter> {
//   String _platformVersion = 'Unknown';
//   String _instruction = "";

//   final _home = WayPoint(
//       name: "Home",
//       latitude: 37.77440680146262,
//       longitude: -122.43539772352648);

//   final _store = WayPoint(
//       name: "Store",
//       latitude: 37.76556957793795,
//       longitude: -122.42409811526268);

//   late MapBoxNavigation _directions;
//   late MapBoxOptions _options;

//   bool _isMultipleStop = false;
//   late double _distanceRemaining, _durationRemaining;
//   late MapBoxNavigationViewController _controller;
//   bool _routeBuilt = false;
//   bool _isNavigating = false;

//   @override
//   void initState() {
//     super.initState();
//     initialize();
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initialize() async {
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;

//     _directions = MapBoxNavigation(onRouteEvent: _onEmbeddedRouteEvent);
//     _options = MapBoxOptions(
//         //initialLatitude: 36.1175275,
//         //initialLongitude: -115.1839524,
//         zoom: 15.0,
//         tilt: 0.0,
//         bearing: 0.0,
//         enableRefresh: false,
//         alternatives: true,
//         voiceInstructionsEnabled: true,
//         bannerInstructionsEnabled: true,
//         allowsUTurnAtWayPoints: true,
//         mode: MapBoxNavigationMode.drivingWithTraffic,
//         units: VoiceUnits.imperial,
//         // Route: true,
//         animateBuildRoute: true,
//         longPressDestinationEnabled: true,
//         language: "en");

//     String platformVersion;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       platformVersion = await _directions.platformVersion;
//     } on PlatformException {
//       platformVersion = 'Failed to get platform version.';
//     }

//     setState(() {
//       _platformVersion = platformVersion;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       child: const Text("Start A to B"),
//       onPressed: () async {
//         var wayPoints = <WayPoint>[];
//         wayPoints.add(_home);
//         wayPoints.add(_store);

//         await _directions.startNavigation(
//             wayPoints: wayPoints,
//             options: MapBoxOptions(
//                 mode: MapBoxNavigationMode.drivingWithTraffic,
//                 // Route: false,
//                 language: "en",
//                 units: VoiceUnits.metric));
//       },
//     );
//   }

//   Future<void> _onEmbeddedRouteEvent(e) async {
//     _distanceRemaining = await _directions.distanceRemaining;
//     _durationRemaining = await _directions.durationRemaining;

//     switch (e.eventType) {
//       case MapBoxEvent.progress_change:
//         var progressEvent = e.data as RouteProgressEvent;
//         if (progressEvent.currentStepInstruction != null)
//           _instruction = progressEvent.currentStepInstruction!;
//         break;
//       case MapBoxEvent.route_building:
//       case MapBoxEvent.route_built:
//         setState(() {
//           _routeBuilt = true;
//         });
//         break;
//       case MapBoxEvent.route_build_failed:
//         setState(() {
//           _routeBuilt = false;
//         });
//         break;
//       case MapBoxEvent.navigation_running:
//         setState(() {
//           _isNavigating = true;
//         });
//         break;
//       case MapBoxEvent.on_arrival:
//         if (!_isMultipleStop) {
//           await Future.delayed(const Duration(seconds: 3));
//           await _controller.finishNavigation();
//         } else {}
//         break;
//       case MapBoxEvent.navigation_finished:
//       case MapBoxEvent.navigation_cancelled:
//         setState(() {
//           _routeBuilt = false;
//           _isNavigating = false;
//         });
//         break;
//       default:
//         break;
//     }
//     setState(() {});
//   }
// }

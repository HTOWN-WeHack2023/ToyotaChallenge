// ignore_for_file: depend_on_referenced_packages, unused_import, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, avoid_print, import_of_legacy_library_into_null_safe
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/providers/MapControlProvider.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:flutter_map/plugin_api.dart';
import './zoomButton.dart';
import 'package:positioned_tap_detector_2/positioned_tap_detector_2.dart';

class MapView extends StatefulWidget {
  MapView({this.mapProvider, Key key}) : super(key: key);
  final mapProvider;

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
//     __                 __  _
//    / /  ___  _______ _/ /_(_)__  ___
//   / /__/ _ \/ __/ _ `/ __/ / _ \/ _ \
//  /____/\___/\__/\_,_/\__/_/\___/_//_/

  MapController _mapController;
  final pointSize = 40.0;
  final pointY = 100.0;

  var interActiveFlags = InteractiveFlag.pinchZoom |
      InteractiveFlag.doubleTapZoom |
      InteractiveFlag.drag;
  StreamSubscription<MapEvent> mapEventSubscription;

  final Location _locationService = Location();
  LatLng latLng;
  LocationData _currentLocation;
  bool _permission = false;
  bool _liveUpdate = false;
  String _serviceError = '';
  var circleMarkers = <CircleMarker>[];

  void _handleTap(LatLng latlng) {
    setState(
      () {
        final crcMarker = CircleMarker(
            point: latlng,
            color: Colors.blue.withOpacity(0.2),
            borderColor: Colors.blueGrey.withOpacity(0.2),
            borderStrokeWidth: 2,
            useRadiusInMeter: true,
            radius: 30 // 2000 meters | 2 km
            );
        circleMarkers.isEmpty
            ? circleMarkers.add(crcMarker)
            : circleMarkers[0] = crcMarker;
      },
    );
  }

  void initLocationService() async {
    await _locationService.changeSettings(
      accuracy: LocationAccuracy.high,
      interval: 1000,
    );

    LocationData location;
    bool serviceEnabled;
    bool serviceRequestResult;

    try {
      serviceEnabled = await _locationService.serviceEnabled();

      if (serviceEnabled) {
        final permission = await _locationService.requestPermission();
        _permission = permission == PermissionStatus.granted;

        if (_permission) {
          location = await _locationService.getLocation();
          _currentLocation = location;
          _locationService.onLocationChanged
              .listen((LocationData result) async {
            if (mounted) {
              setState(
                () {
                  _currentLocation = result;

                  // If Live Update is enabled, move map center
                  if (_liveUpdate) {
                    _mapController.move(
                        LatLng(_currentLocation.latitude,
                            _currentLocation.longitude),
                        _mapController.zoom);
                  }
                },
              );
            }
          });
        }
      } else {
        serviceRequestResult = await _locationService.requestService();
        if (serviceRequestResult) {
          initLocationService();
          return;
        }
      }
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      if (e.code == 'PERMISSION_DENIED') {
        _serviceError = e.message;
      } else if (e.code == 'SERVICE_STATUS_ERROR') {
        _serviceError = e.message;
      }
      location = null;
    }
  }

  void onMapEvent(MapEvent mapEvent, BuildContext context) {
    _updatePointLatLng(context);
  }

  void _updatePointLatLng(BuildContext context) {
    final pointX = _getPointX(context);

    final latLng = _mapController.pointToLatLng(CustomPoint(pointX, pointY));

    setState(() {
      this.latLng = latLng;
    });
  }

  void redirectView(BuildContext context, Map point) {
    print('######################################################');

    _mapController.move(LatLng(point['x'], point['y']), _mapController.zoom);
    setState(() {
      // this.latLng = latLng!;
    });
  }

  double _getPointX(BuildContext context) {
    return MediaQuery.of(context).size.width / 3;
  }

//     _      _ __
//    (_)__  (_) /_
//   / / _ \/ / __/
//  /_/_//_/_/\__/
//

  @override
  void initState() {
    _mapController = MapController();
    super.initState();

    mapEventSubscription = _mapController.mapEventStream
        .listen((mapEvent) => onMapEvent(mapEvent, context));

    Future.delayed(Duration.zero, () {
      _mapController.onReady.then((_) => _updatePointLatLng(context));
    });

    initLocationService();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // animationController.dispose() instead of your controller.dispose
    _mapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LatLng currentLatLng;
    // Until currentLocation is initially updated, Widget can locate to 0, 0
    // by default or store previous location value to show.
    if (_currentLocation != null) {
      currentLatLng =
          LatLng(_currentLocation.latitude, _currentLocation.longitude);
    } else {
      currentLatLng = LatLng(32.98553539125427, -96.75051562289052);
    }

    final markers = <Marker>[
      Marker(
        width: 80,
        height: 80,
        point: currentLatLng,
        builder: (ctx) => const Icon(
          Icons.location_on,
          color: Colors.white,
        ),
      ),
    ];

    // widget.locationProperty['point'] = circleMarkers;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .6,
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                center: LatLng(currentLatLng.latitude, currentLatLng.longitude),
                zoom: 15,
                interactiveFlags: interActiveFlags,
                plugins: [
                  ZoomButtonsPlugin(),
                ],
              ),
              layers: [
                MarkerLayerOptions(markers: markers),
                CircleLayerOptions(circles: circleMarkers),
                ZoomButtonsPluginOption(
                  minZoom: 4,
                  maxZoom: 19,
                  mini: true,
                  padding: 10,
                  alignment: Alignment.topRight,
                )
              ],
              children: <Widget>[
                TileLayerWidget(
                  options: TileLayerOptions(
                    urlTemplate:
                        "https://api.mapbox.com/styles/v1/seb4594/cle0p4nms000501ofw048wjj8/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2ViNDU5NCIsImEiOiJja2g0aDM4cm8wZW81MzBvYWFtNWN6Y3NiIn0.Ypx1jCDBMkEFj1iZ0CSLIg",
                    // urlTemplate:
                    //     "https://api.mapbox.com/styles/v1/seb4594/cl8g1d4vd001615s3jv8xv9a5/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2ViNDU5NCIsImEiOiJja2g0aDM4cm8wZW81MzBvYWFtNWN6Y3NiIn0.Ypx1jCDBMkEFj1iZ0CSLIg",
                    additionalOptions: {
                      "access_token":
                          "pk.eyJ1Ijoic2ViNDU5NCIsImEiOiJja2g0aDM4cm8wZW81MzBvYWFtNWN6Y3NiIn0.Ypx1jCDBMkEFj1iZ0CSLIg"
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: FloatingActionButton(
            heroTag: 'zoomOutButton',
            mini: true,
            backgroundColor: Colors.white,
            onPressed: () {
              _liveUpdate = !_liveUpdate;

              if (_liveUpdate) {
                interActiveFlags =
                    InteractiveFlag.pinchZoom | InteractiveFlag.doubleTapZoom;

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        'In live update mode only zoom and rotation are enable'),
                  ),
                );
              } else {
                interActiveFlags = InteractiveFlag.pinchZoom |
                    InteractiveFlag.doubleTapZoom |
                    InteractiveFlag.drag;
              }
            },
            child: _liveUpdate
                ? const Icon(
                    Icons.location_on,
                    color: Colors.black,
                  )
                : const Icon(
                    Icons.location_off,
                    color: Colors.black,
                  ),
          ),
        )
      ],
    );
  }
}

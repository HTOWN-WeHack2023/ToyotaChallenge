import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';

class ZoomButtonsPluginOption extends LayerOptions {
  final double minZoom;
  final double maxZoom;
  final bool mini;
  final double padding;
  final Alignment alignment;
  final Color zoomInColor;
  final Color zoomInColorIcon;
  final Color zoomOutColor;
  final Color zoomOutColorIcon;
  final IconData zoomInIcon;
  final IconData zoomOutIcon;
  int interactiveFlags;

  ZoomButtonsPluginOption({
    Key key,
    this.minZoom = 1,
    this.maxZoom = 18,
    this.mini = true,
    this.padding = 2.0,
    this.alignment = Alignment.topRight,
    this.zoomInColor,
    this.zoomInColorIcon,
    this.zoomInIcon = Icons.zoom_in,
    this.zoomOutColor,
    this.zoomOutColorIcon,
    this.zoomOutIcon = Icons.zoom_out,
    this.interactiveFlags,
    Stream<void> rebuild,
  }) : super(key: key, rebuild: rebuild);
}

class ZoomButtonsPlugin implements MapPlugin {
  @override
  Widget createLayer(
      LayerOptions options, MapState mapState, Stream<void> stream) {
    if (options is ZoomButtonsPluginOption) {
      return ZoomButtons(options, mapState, stream);
    }
    throw Exception('Unknown options type for ZoomButtonsPlugin: $options');
  }

  @override
  bool supportsLayer(LayerOptions options) {
    return options is ZoomButtonsPluginOption;
  }
}

class ZoomButtons extends StatefulWidget {
  final ZoomButtonsPluginOption zoomButtonsOpts;
  final MapState map;
  final Stream<void> stream;

  ZoomButtons(this.zoomButtonsOpts, this.map, this.stream)
      : super(key: zoomButtonsOpts.key);

  @override
  State<ZoomButtons> createState() => _ZoomButtonsState();
}

class _ZoomButtonsState extends State<ZoomButtons> {
  bool _liveUpdate = true;
  final FitBoundsOptions options =
      const FitBoundsOptions(padding: EdgeInsets.all(12.0));

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.zoomButtonsOpts.alignment,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: widget.zoomButtonsOpts.padding,
                top: widget.zoomButtonsOpts.padding,
                right: widget.zoomButtonsOpts.padding),
            child: FloatingActionButton(
              heroTag: 'zoomInButton',
              mini: widget.zoomButtonsOpts.mini,
              backgroundColor: Colors.white,
              onPressed: () {
                var bounds = widget.map.getBounds();
                var centerZoom =
                    widget.map.getBoundsCenterZoom(bounds, options);
                var zoom = centerZoom.zoom + 1;
                if (zoom > widget.zoomButtonsOpts.maxZoom) {
                  zoom = widget.zoomButtonsOpts.maxZoom;
                }
                widget.map.move(centerZoom.center, zoom,
                    source: MapEventSource.custom);
              },
              child: Icon(widget.zoomButtonsOpts.zoomInIcon,
                  color: widget.zoomButtonsOpts.zoomInColorIcon ??
                      IconTheme.of(context).color),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(widget.zoomButtonsOpts.padding),
            child: FloatingActionButton(
              heroTag: 'zoomOutButton',
              mini: widget.zoomButtonsOpts.mini,
              backgroundColor: Colors.white,
              onPressed: () {
                var bounds = widget.map.getBounds();
                var centerZoom =
                    widget.map.getBoundsCenterZoom(bounds, options);
                var zoom = centerZoom.zoom - 1;
                if (zoom < widget.zoomButtonsOpts.minZoom) {
                  zoom = widget.zoomButtonsOpts.minZoom;
                }
                widget.map.move(centerZoom.center, zoom,
                    source: MapEventSource.custom);
              },
              child: Icon(widget.zoomButtonsOpts.zoomOutIcon,
                  color: widget.zoomButtonsOpts.zoomOutColorIcon ??
                      IconTheme.of(context).color),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.all(widget.zoomButtonsOpts.padding),
          //   child: FloatingActionButton(
          //     heroTag: 'zoomOutButton',
          //     mini: widget.zoomButtonsOpts.mini,
          //     backgroundColor: Colors.white,
          //     onPressed: () {
          //       _liveUpdate = !_liveUpdate;

          //       if (_liveUpdate) {
          //         widget.zoomButtonsOpts.interactiveFlags =
          //             InteractiveFlag.rotate |
          //                 InteractiveFlag.pinchZoom |
          //                 InteractiveFlag.doubleTapZoom;

          //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //           content: Text(
          //               'In live update mode only zoom and rotation are enable'),
          //         ));
          //       } else {
          //         widget.zoomButtonsOpts.interactiveFlags = InteractiveFlag.all;
          //       }
          //     },
          //     child: _liveUpdate
          //         ? const Icon(
          //             Icons.location_on,
          //             color: Colors.black,
          //           )
          //         : const Icon(
          //             Icons.location_off,
          //             color: Colors.black,
          //           ),
          //   ),
          // )
        ],
      ),
    );
  }
}

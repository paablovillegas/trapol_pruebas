import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';

class MapaScreen extends StatefulWidget {
  MapaScreen({Key key}) : super(key: key);

  @override
  _mapaScreenState createState() => _mapaScreenState();
}

class _mapaScreenState extends State<MapaScreen> {
  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    markers.addAll(
      [
        Marker(
          GeoCoord(20.5, -100.3),
          label: 'A',
        ),
        Marker(
          GeoCoord(20.3, -100.5),
          label: 'B',
        ),
        Marker(
          GeoCoord(20, -100),
          label: 'C',
        ),
        Marker(
          GeoCoord(21, -101),
          label: 'D',
        ),
      ],
    );

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mapa del embarque'),
        ),
        body: GoogleMap(
          mapType: MapType.roadmap,
          initialPosition: GeoCoord(20, -100),
          markers: markers,
          initialZoom: 7,
        ),
      ),
    );
  }
}

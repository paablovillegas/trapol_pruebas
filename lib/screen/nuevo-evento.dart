import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:trapol_mobile/models/evento.dart';

class NuevoEvento extends StatefulWidget {
  NuevoEvento({Key key}) : super(key: key);

  @override
  _NuevoEventoState createState() => _NuevoEventoState();
}

class _NuevoEventoState extends State<NuevoEvento> {
  LocationData _currentPosition;
  Location location = Location();

  Evento evento = Evento();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo evento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Titulo',
                ),
                onChanged: (text) => evento.titulo = text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Descripción',
                ),
                onChanged: (text) => evento.descripcion = text,
              ),
            ),
            ElevatedButton(
              child: Text('Registrar'),
              onPressed: registrar,
            ),
          ],
        ),
      ),
    );
  }

  void registrar() async {
    var datos = await getLoc();
    if (datos != null) {
      evento.lat = datos[0];
      evento.lon = datos[1];
    }
    evento.fechaEvento = DateTime.now();
    Navigator.pop(context, evento);
  }

  Future<List> getLoc() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (_serviceEnabled) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return [];
      }
    }
    _currentPosition = await location.getLocation();
    return [_currentPosition.latitude, _currentPosition.longitude];
  }
}

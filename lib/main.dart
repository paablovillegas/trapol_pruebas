import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:trapol_mobile/screen/embarque-inicio.dart';
import 'package:trapol_mobile/screen/embarque-screen.dart';
import 'package:trapol_mobile/screen/nuevo-evento.dart';

void main() {
  GoogleMap.init('AIzaSyB6VYVn_7FQ-GJQgpgHCpHq97ZZKohGcAU');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => EmbarqueInicio(),
        '/nuevo': (context) => NuevoEvento(),
        '/mapa': (context) => MapaScreen(),
      },
    );
  }
}

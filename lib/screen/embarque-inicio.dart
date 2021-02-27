import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trapol_mobile/models/evento.dart';

class EmbarqueInicio extends StatefulWidget {
  EmbarqueInicio({Key key}) : super(key: key);

  @override
  _EmbarqueInicioState createState() => _EmbarqueInicioState();
}

class _EmbarqueInicioState extends State<EmbarqueInicio> {
  DateFormat format = DateFormat('HH:mm');
  List<Evento> eventos = [
    Evento(
      lat: 20.56,
      lon: -100.36,
      costo: 0,
      descripcion: 'Desc 1',
      titulo: 'Titulo 1',
      fechaEvento: new DateTime.now().subtract(Duration(hours: 3, minutes: 29)),
      image: 'https://picsum.photos/250?image=8',
    ),
    Evento(
      lat: 20.46,
      lon: -100.26,
      costo: 0,
      descripcion: 'Desc 2',
      titulo: 'Titulo 2',
      fechaEvento: new DateTime.now().subtract(Duration(hours: 2, minutes: 24)),
      image: 'https://picsum.photos/250?image=9',
    ),
    Evento(
      lat: 20.13,
      lon: -100,
      costo: 0,
      descripcion: 'Desc 3',
      titulo: 'Titulo 3',
      fechaEvento: new DateTime.now().subtract(Duration(hours: 1, minutes: 10)),
      image: 'https://picsum.photos/250?image=7',
    ),
    Evento(
      lat: 20.25,
      lon: -100.43,
      costo: 0,
      descripcion: 'Desc 4',
      titulo: 'Titulo 4',
      fechaEvento: new DateTime.now().subtract(Duration(hours: 1)),
      image: 'https://picsum.photos/250?image=3',
    ),
    Evento(
      lat: 20.12,
      lon: -100.93,
      costo: 0,
      descripcion: 'Desc 5',
      fechaEvento: new DateTime.now(),
      titulo: 'Titulo 5',
      image: 'https://picsum.photos/250?image=5',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Embarque #1234'),
              stretchModes: [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
              ],
              background: Image(
                image: AssetImage('assets/london.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            expandedHeight: 300.0,
            floating: true,
            pinned: true,
            snap: false,
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              switch (index) {
                case 0:
                  return infoEmbarque(
                    'Origen',
                    'AICM',
                    Icons.radio_button_unchecked,
                  );
                  break;
                case 1:
                  return infoEmbarque(
                    'Destino',
                    'Ford',
                    Icons.location_on_rounded,
                  );
                  break;
                case 2:
                  return infoEmbarque(
                    'Mapa',
                    'Eventos',
                    Icons.map,
                    onTap: () => navigate(),
                  );
                  break;
              }
              return itemEvento(eventos[index - 3]);
            },
            childCount: eventos.length + 3,
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: addEvent,
      ),
    );
  }

  void addEvent() async {
    var result = await Navigator.pushNamed(context, '/nuevo');
    Evento evento = result;
    if (evento != null)
      setState(() {
        eventos.add(evento);
      });
    /*
    setState(() {
      getLoc().then((value) => print(value));
      eventos.add(
        new Evento(
          costo: 0,
          descripcion: 'Descripcion añadida',
          fechaEvento: DateTime.now(),
          titulo: 'Titulo añadido',
        ),
      );
    });*/
  }

  Widget infoEmbarque(String title, String subtitle, IconData leading,
      {Function onTap}) {
    return Container(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(leading),
        onTap: onTap,
      ),
    );
  }

  Widget itemEvento(Evento evento) {
    return ExpansionTile(
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: Text(
              format.format(evento.fechaEvento),
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          Text(
            evento.titulo,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
      children: [
        if (evento.image != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(evento.image),
          ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            evento.descripcion,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ],
    );
  }

  void navigate() {
    Navigator.pushNamed(context, '/mapa');
  }
}

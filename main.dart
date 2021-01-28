import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Video();
  }
}

class Bienvenida extends StatefulWidget {
  @override
  _BienvenidaState createState() => _BienvenidaState();
}

class _BienvenidaState extends State<Bienvenida> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(16.0, 17.0, 0.0, 35.0),
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.red,
                      size: 45.0,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SizedBox(
                  child: Image(
                    height: 250.0,
                    width: 250.0,
                    image: Svg(
                      'images/Grupo 17.svg',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 70.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 50.0),
                child: Column(
                  children: [
                    Text(
                      '¡BIENVENIDO!',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                        'QUEREMOS QUE ENCUENTRES CLIENTES DE LA MANERA MÁS RÁPIDA Y FÁCIL',
                        style: TextStyle(
                            fontSize: 11.0,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.2,
                            fontFamily: 'Montserrat'),
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: RaisedButton(
                  color: Colors.blueAccent,
                  elevation: 7.0,
                  padding: EdgeInsets.symmetric(horizontal: 46.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(17.0))),
                  child: Text(
                    '¿CÓMO SER SOCIO YOIN!?',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  VideoPlayerController controller;
  Future<void> futurecontroller;

  @override
  void initState() {
    // TODO: implement initState
    controller = VideoPlayerController.network('http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4');
    futurecontroller = controller.initialize();
    controller.setLooping(true);
    controller.setVolume(35.0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(16.0, 17.0, 0.0, 35.0),
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.red,
                      size: 45.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 50.0),
                child: Column(
                  children: [
                    Text(
                        'MIRA EL VIDEO QUE EXPLICARÁ PASO A PASO CÓMO PUEDES SER SOCIO "YOIN!"',
                        style: TextStyle(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Montserrat',
                        ),
                        textAlign: TextAlign.center),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 40.0,
                      ),
                      child: Column(
                        children: [
                          FutureBuilder(
                            future: futurecontroller,
                            builder: (BuildContext context,
                                AsyncSnapshot<void> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return AspectRatio(
                                  aspectRatio: controller.value.aspectRatio,
                                  child: VideoPlayer(controller),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                          RaisedButton(
                            onPressed: () {
                              setState(() {
                                if (controller.value.isPlaying) {
                                  controller.pause();
                                } else {
                                  controller.play();
                                }
                              });
                            },
                            child: Icon(controller.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow),
                          )
                        ],
                      ),
                    ),
                    Text('¿ESTÁS LISTO PARA SER SOCIO?',
                        style: TextStyle(
                            fontSize: 11.0,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.2,
                            fontFamily: 'Montserrat'),
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 110.0),
                child: RaisedButton(
                  color: Colors.blueAccent,
                  padding: EdgeInsets.fromLTRB(123.0, 30.0, 123.0, 61.9),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(60.0))),
                  child: Text(
                    '¡ESTOY LISTO!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w900),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}

class Preguntas extends StatefulWidget {
  @override
  _PreguntasState createState() => _PreguntasState();
}

class _PreguntasState extends State<Preguntas> {
  showSimpleAlert() {
    Alert(
      context: context,
      title: '¿CÓMO PUEDO PAGAR?',
      content: Container(
        child: Image(
          image: Svg('images/Grupo 489.svg'),
        ),
      ),
      desc:
          '¡Solo tienes que pagar cuando quieras contactar a un nuevo cliente! En Yoin! no tienes que pagar cuotas mensuales, lo único que compras es un paquetede billetes.  El paquete de billetes los puedes comprar con tarjeta de crédito, en OXXO o aquí, en la misma aplicación.  ¿Cómo funciona? Yoin! Te envía un mensaje cuando una persona está buscando un servicio , cuando veas el mensaje, únicamente tienes que liberarlo para que Yoin! te muestre sus datos para contactarlo.   Para poder ver los datos de tu prospecto cliente, solo tienes que pagar 15 pesos con tu billetera para que Yoin! Te de el nombre, teléfono, correo electrónico de tu cliente y listo!    Contáctalo!',
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(16.0, 17.0, 0.0, 8.0),
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.red,
                      size: 45.0,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(243.0, 8.0, 0.0, 0.0),
                    child: Icon(
                      Icons.help,
                      color: Colors.black,
                      size: 36.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                child: Image(
                  height: 250.0,
                  width: 250.0,
                  image: Svg(
                    'images/Grupo 481.svg',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 40.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 13.0),
                      child: Text(
                        'REVISA LA SIGUIENTE INFORMACIÓN.                 TE AYUDARÁ A TENER MAYOR ÉXITO                   EN TUS CONTRATACIONES',
                        style: TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Montserrat',
                            letterSpacing: 0.3),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: RaisedButton(
                        color: Colors.white,
                        elevation: 10.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13.0, horizontal: 69.0),
                          child: Text(
                            '¿CÓMO PUEDO PAGAR?',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Montserrat',
                                fontSize: 12.0),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: RaisedButton(
                        color: Colors.white,
                        elevation: 10.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 10.0),
                          child: Text(
                            '¿OTROS SOCIOS PUEDEN LIBERAR EL MISMO SERVICIO?',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Montserrat',
                                fontSize: 12.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    RaisedButton(
                      color: Colors.white,
                      elevation: 10.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 13.0, horizontal: 69.0),
                        child: Text(
                          '¿QUÉ ES LO QUE PAGO?',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Montserrat',
                              fontSize: 12.0),
                        ),
                      ),
                      onPressed: () {
                        showSimpleAlert();
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: RaisedButton(
                  color: Colors.blueAccent,
                  elevation: 7.0,
                  padding: EdgeInsets.symmetric(horizontal: 46.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(17.0))),
                  child: Text(
                    'VER LISTA DE SOLICITUDES',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Pedidos extends StatefulWidget {
  @override
  _PedidosState createState() => _PedidosState();
}

class _PedidosState extends State<Pedidos> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('PEDIDOS'),
          flexibleSpace: Image(
            image: AssetImage('assets/image.png'),
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}

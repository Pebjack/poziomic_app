import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sensors/sensors.dart';
import 'dart:math' as math;

class Poziom extends StatefulWidget {
  @override
  _PoziomState createState() => _PoziomState();
}

class _PoziomState extends State<Poziom> {

  double x = 0.0; // zmienna odpowiadająca za odczyt osi x akcelerometru
  double y = 0.0; // zmienna odpowiadająca za odczyt osi y akcelerometru
  StreamSubscription<dynamic> gyro; // strumień odczytu wartości akcelerometru
  String text; // wartość tekstowa wyswietlana na środku ekranu

  @override
  void initState(){ //przy inicjowaniu ekranu uruchamiamy strumień, od tego momentu x i y przyjmują wartości ze strumienia
    gyro = accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        x = event.x;
        y = event.y;
      });
    });
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (x > -0.1 && x < 0.1) || (x > 9.805 || x < -9.805) ? Colors.green[500] : Colors.red[600], // zakresy wartości w których ekran jest zielony i czerwony
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.rotate(
                  angle: y >= 0.0 ? ((x/0.109) * math.pi)/180 : ((180 -(x/0.109)) * math.pi)/180, /* obrót napisu wokół jego środka w zależności od wartości x,
                  w zależności od wartości pobranej z osi y następuje dalszy obrót napisu.
                  */
                  child: Text((x > -0.1 && x < 0.1) || (x > 9.805 || x < -9.805) ? text = "PROSTO" : text = "KRZYWO", // w zalezności od wartości napis to PROSTO lub KRZYWO
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontStyle: text == "KRZYWO" ? FontStyle.italic : FontStyle.normal, // napis KRZYWO jest przekrzywiony :)
                  )),
                  ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      )
    );
  }

  @override
  void dispose() { // przy porzuceniu ekranu, cofnięciu do poprzedniego nastepuje zamknięcie strumienia z akcelerometru.
    super.dispose();
    try{
      gyro.cancel();
    }
    catch(e){
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:sensors/sensors.dart';
import 'dart:math' as math;

class Poziom extends StatefulWidget {
  @override
  _PoziomState createState() => _PoziomState();
}

class _PoziomState extends State<Poziom> {

  double x = 0.0;
  double y = 0.0;
  StreamSubscription<dynamic> gyro;
  String text;

  @override
  void initState(){
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
      backgroundColor: (x > -0.1 && x < 0.1) || (x > 9.81 || x < -9.81) ? Colors.green[500] : Colors.red[600],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.rotate(
                  angle: y >= 0.0 ? ((x/0.109) * math.pi)/180 : ((180 -(x/0.109)) * math.pi)/180, //x /180 * math.pi * 9.16),
                  child: Text((x > -0.1 && x < 0.1) || (x > 9.81 || x < -9.81) ? text = "PROSTO" : text = "KRZYWO",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontStyle: this.text == "KRZYWO" ? FontStyle.italic : FontStyle.normal,
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
  void dispose() {
    super.dispose();
    try{
      gyro.cancel();
    }
    catch(e){
    }
  }
}

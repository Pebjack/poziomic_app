import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([ // przy uruchomieniu ekranu startowego następuje zablokowanie orientacji urzadzenia.
      DeviceOrientation.portraitUp,
    ]);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'poziomicApp',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          backgroundColor: Colors.lightBlue[650],
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton( // przycisk przenoszący do strony poziomicy
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue[600],
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/poziom');
                  },
                  child: Text(
                    'POZIOMUJ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton( // przycisk do sekcji o autorze
                  style: ElevatedButton.styleFrom(
                      primary: Colors.yellow[600],
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar( // sekcja o autorze w postaci snackbara na tym samym ekranie
                      content: Text(
                        '@Paweł Jackowski, 2021',
                        style: TextStyle(
                          color: Colors.lightBlue[600],
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      backgroundColor: Colors.yellow[600],
                    ),
                    );
                  },
                  child: Text(
                    'AUTOR',
                    style: TextStyle(
                      color: Colors.lightBlue[600],
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ],
            )
          ],
        )
    );
  }

  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}

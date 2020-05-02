import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = '';
  var Colorsval = Colors.white;

  @override
  void initState() {
    CheckStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorsval,
      body: Container(
        alignment: Alignment.center,
        child: Text(
          result != null ? result : 'Unknown',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 25),
        ),
      ),
    );
  }

  void CheckStatus() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        ChangeValues("Connected", Colors.green[900]);
      } else {
        ChangeValues("No Internet", Colors.red[900]);
      }
    });
  }

  void ChangeValues(String resultval, Color colorval) {
    setState(() {
      result = resultval;
      Colorsval = colorval;
    });
  }
}

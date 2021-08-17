import 'package:flutter/material.dart';
import 'package:flutter_star_prnt_example/impresora.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextButton(
                onPressed: () async {
                  await Impresora.imprimir();
                  await Impresora.imprimir(reimpresion: true);
                },
                child: Text('Print from text'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyaAppHomePage(title: 'Agenda'),
    );
  }
}

class MyaAppHomePage extends StatefulWidget {
  MyaAppHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyAppHomePage createState() => _MyAppHomePage();
}

class _MyAppHomePage extends State<MyaAppHomePage> {
  _displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(content: Text('Are you talkin\' to me?'));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SnackBar Playground'),
        ),
        body: Builder(
          builder: (context) => Center(
            child: RaisedButton(
              color: Colors.pink,
              textColor: Colors.white,
              onPressed: () => _displaySnackBar(context),
              child: Text('Display SnackBar'),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _displaySnackBar(context),
          tooltip: 'Incluir contato',
          child: Icon(Icons.add),
        ));
  }
}

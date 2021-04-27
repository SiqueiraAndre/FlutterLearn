import 'package:agenda_flutter/contactCard.dart';
import 'package:agenda_flutter/repository/ScheduleRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:agenda_flutter/contactViewPage.dart';
import 'package:agenda_flutter/components/contact.dart';
import 'package:agenda_flutter/contactEditingPage.dart';

void main() {
  runApp(ScheduleApp());
}

class ScheduleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ScheduleHomePage(title: 'Agenda'),
    );
  }
}

class ScheduleHomePage extends StatefulWidget {
  ScheduleHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ScheduleHomePage createState() => _ScheduleHomePage();
}

class _ScheduleHomePage extends State<ScheduleHomePage> {
  // _openEditContact(BuildContext context, Contact contact) async {
  //   final resultContact = await Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => ContactEditingPage(contact, 1)));
  //   if (resultContact != null) {
  //     setState(() {});
  //   }
  // }

  void _openViewContact(Contact contact, int index) async {
    final resultContact = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ContactViewPage(contact)));
    if (resultContact != null) {
      setState(() {});
    }
  }

  _openAddContact(BuildContext context) async {
    final resultContact = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ContactEditingPage(null, 0)));
    if (resultContact != null) {
      setState(() {});
    }
  }

  _treatDismiss(
      BuildContext context, DismissDirection direction, Contact contact) {
    ScheduleRepository.delete(contact);
    setState(() {});
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text("Contato apagado")));
  }

  Container _treatBackground(
      Color color, String caption, IconData icon, MainAxisAlignment alignment) {
    return Container(
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(mainAxisAlignment: alignment, children: [
            Icon(icon, color: Colors.white),
            Text(caption, style: TextStyle(color: Colors.white))
          ]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(fontFamily: 'Roboto'),
          ),
        ),
        body: Builder(
            builder: (context) => Container(
                child: FutureBuilder(
                    future: ScheduleRepository.list(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Erro: ${snapshot.error}');
                      } else if (!snapshot.hasData) {
                        return Center(child: Text('Agenda vazia'));
                      } else {
                        return ListView.separated(
                            itemCount: snapshot.data.length,
                            separatorBuilder: (context, index) => Divider(
                                  color: Colors.grey,
                                ),
                            itemBuilder: (context, index) {
                              Contact item = snapshot.data[index];
                              return Dismissible(
                                  key: UniqueKey(),
                                  child: InkWell(
                                      onTap: () =>
                                          _openViewContact(item, index),
                                      child: ContactCard(item)),
                                  onDismissed: (direction) =>
                                      _treatDismiss(context, direction, item),
                                  background: _treatBackground(
                                      Colors.red,
                                      'Apagar',
                                      Icons.delete,
                                      MainAxisAlignment.start),
                                  secondaryBackground: _treatBackground(
                                      Colors.red,
                                      'Apagar',
                                      Icons.delete,
                                      MainAxisAlignment.end));
                            });
                      }
                    }))),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _openAddContact(context),
          tooltip: 'Incluir contato',
          child: Icon(Icons.add),
        ));
  }
}

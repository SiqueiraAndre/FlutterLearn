import 'package:agenda_flutter/components/contact.dart';
import 'package:agenda_flutter/repository/ScheduleRepository.dart';
import 'package:flutter/material.dart';

class ContactEditingPage extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  Contact contact;
  final int mode;
  int id = 0;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  String title = "Novo Contato";

  ContactEditingPage(this.contact, this.mode) {
    if (mode == 1) {
      title = "Editar Contato";
      if (contact != null) {
        nameController.text = contact.name;
        phoneController.text = contact.phoneNumber.toString();
        id = contact.id;
      }
    }
  }

  void _save(BuildContext context) {
    final contact =
        Contact(nameController.text, int.parse(phoneController.text), id);
    if (mode == 0) {
      ScheduleRepository.insert(contact);
    } else {
      ScheduleRepository.update(contact);
    }
    Navigator.pop(context, contact);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        hintText: 'Nome')),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: TextField(
                    controller: phoneController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: false),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        hintText: 'Telefone')),
              ),
              Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color(0xff01A0C7),
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () => _save(context),
                      child: Text("Salvar",
                          textAlign: TextAlign.center,
                          style: style.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  )),
            ],
          ),
        ));
  }
}

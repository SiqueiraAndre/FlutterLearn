import 'package:agenda_flutter/components/contact.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;

  ContactCard(this.contact);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(Icons.person, size: 50),
        title: Text(this.contact.name,
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.normal,
                fontSize: 25)),
        subtitle: Text(
          this.contact.phoneNumber.toString(),
          style: TextStyle(fontFamily: 'Roboto', fontSize: 16),
        ));
  }
}

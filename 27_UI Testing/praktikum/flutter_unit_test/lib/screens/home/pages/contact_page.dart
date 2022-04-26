import 'package:flutter_unit_test/screens/detail/detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '/screens/home/pages/contact_provider.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactProvider>(
      builder: (context, value, _) => ListView.builder(
        itemCount: value.dataContact.length,
        itemBuilder: (context, index) {
          return ListTile(
            key: Key('listTile'),
            title: Text(value.dataContact[index].name!),
            subtitle: Text(value.dataContact[index].phone!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => DetailScreen(
                        titleData: value.dataContact[index].name!,
                        subTitleData: value.dataContact[index].phone!,
                      )),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

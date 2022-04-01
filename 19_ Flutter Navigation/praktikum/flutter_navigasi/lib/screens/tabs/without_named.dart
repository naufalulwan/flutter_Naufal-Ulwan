import 'package:flutter/material.dart';
import '/models/data.dart';

class WithoutNamed extends StatefulWidget {
  const WithoutNamed({Key? key}) : super(key: key);

  @override
  State<WithoutNamed> createState() => _WithoutNamedState();
}

class _WithoutNamedState extends State<WithoutNamed> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listUser.length,
      itemBuilder: (BuildContext context, int index) {
        final User user = listUser[index];
        return GestureDetector(
          // ignore: avoid_returning_null_for_void
          onTap: () => null,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 2,
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 23,
                child: Text(
                  user.name.substring(0, 1),
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              title: Text(user.name),
              subtitle: Text(
                user.telp.toString().replaceRange(0, 0, '+62 '),
              ),
            ),
          ),
        );
      },
    );
  }
}

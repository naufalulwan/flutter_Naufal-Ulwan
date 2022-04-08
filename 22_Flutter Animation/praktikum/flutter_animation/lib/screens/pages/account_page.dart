import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/themes/theme_bloc.dart';

class Accoount extends StatefulWidget {
  const Accoount({Key? key}) : super(key: key);

  @override
  State<Accoount> createState() => _AccoountState();
}

class _AccoountState extends State<Accoount> {
  bool isBig = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      child: Column(
        children: [
          GestureDetector(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: isBig ? 500 : 150,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/chaeyoung.jpg'),
                    fit: BoxFit.contain,
                  ),
                  shape: isBig ? BoxShape.rectangle : BoxShape.circle),
            ),
            onTap: () {
              setState(() {
                isBig = !isBig;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          isBig
              ? const SizedBox(
                  height: 5,
                )
              : const Text(
                  'Chaeyoung',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    letterSpacing: 2,
                  ),
                ),
          const SizedBox(
            height: 5,
          ),
          isBig
              ? const SizedBox(
                  height: 5,
                )
              : BlocBuilder<ThemeBloc, bool>(
                  builder: (context, state) => Text(
                    'Son Chae Young (손채영)',
                    style: TextStyle(
                        color: state != true ? Colors.black54 : Colors.white54),
                  ),
                )
        ],
      ),
    );
  }
}

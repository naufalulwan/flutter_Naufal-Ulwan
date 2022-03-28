import 'package:flutter/material.dart';
import 'package:flutter_dialogbottomsheet/themes/color.dart';
import 'package:flutter_dialogbottomsheet/models/data_twice.dart';
import 'dialog.dart';
import 'bottomsheet.dart';

class Grid extends StatefulWidget {
  const Grid({Key? key}) : super(key: key);

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: member.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 3,
      ),
      itemBuilder: (context, index) {
        final Twice callTwice = member[index];
        return Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
            left: 5,
            right: 5,
          ),
          child: Stack(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: AssetImage(callTwice.imgUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                    highlightColor:
                        coloring(Palette.secondary).withOpacity(0.2),
                    splashColor: coloring(Palette.primary).withOpacity(0.35),
                    onTap: () {
                      showDialogFun(
                        context,
                        callTwice.name,
                        callTwice.imgUrl,
                        callTwice.fullName,
                      );
                    },
                    onLongPress: () {
                      showBottomSheetFun(
                        context,
                        callTwice.name,
                        callTwice.imgUrl,
                        callTwice.fullName,
                      );
                    },
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: 100,
                height: 25,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.bottomLeft,
                    colors: <Color>[
                      coloring(Palette.secondary).withOpacity(0),
                      coloring(Palette.primary)
                    ],
                  ),
                ),
                child: Text(
                  callTwice.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    color: coloring(Palette.whiteCloud),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

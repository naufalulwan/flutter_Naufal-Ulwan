import 'package:flutter/material.dart';
import 'package:flutter_dialogbottomsheet/themes/color.dart';

showDialogFun(context, name, imgUrl, fullName) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              width: 300,
              height: 235,
              padding: const EdgeInsets.only(top: 100),
              margin: const EdgeInsets.only(top: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                border:
                    Border.all(color: coloring(Palette.primary), width: 4.0),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: coloring(Palette.aspalt),
                    blurRadius: 15.0,
                    offset: Offset(10.0, 10.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // To make the card compact
                children: <Widget>[
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    fullName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 15.0),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(top: 1),
                      width: 310,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: coloring(Palette.primary), width: 5.0),
                        shape: BoxShape.rectangle,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                        color: coloring(Palette.primary),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'View Photos',
                            style: TextStyle(
                              color: coloring(Palette.secondary),
                            ),
                          ),
                          Icon(
                            Icons.arrow_right,
                            color: coloring(Palette.secondary),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(imgUrl), fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      );
    },
  );
}

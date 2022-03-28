import 'package:flutter/material.dart';
import 'package:flutter_dialogbottomsheet/themes/color.dart';

Future showBottomSheetFun(context, name, imgUrl, fullName) {
  bool allowBackNavigation = true;
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
    isDismissible: allowBackNavigation,
    builder: (context) => WillPopScope(
      onWillPop: () async => allowBackNavigation,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imgUrl), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 5),
            Text(
              fullName,
              textAlign: TextAlign.left,
              style:
                  Theme.of(context).textTheme.bodyText2?.copyWith(height: 1.5),
            ),
          ],
        ),
      ),
    ),
  );
}

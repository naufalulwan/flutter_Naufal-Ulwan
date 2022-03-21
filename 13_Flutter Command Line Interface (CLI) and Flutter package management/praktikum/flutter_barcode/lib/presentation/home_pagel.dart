import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:from_css_color/from_css_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownvalue = 'Barcode';

  _type() {
    if (dropdownvalue == items[0]) {
      return Barcode.code128();
    } else if (dropdownvalue == items[1]) {
      return Barcode.qrCode();
    }
  }

  // List of items in our dropdown menu
  var items = [
    'Barcode',
    'QR Code',
  ];
  void sendTextFieldValue(String value) {
    setState(() {
      text = value;
    });
  }

  void textResult() {
    setState(() {
      result = text;
    });
  }

  var text = '';
  var result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode Create'),
      ),
      body: Container(
        color: fromCssColor('#ecf0f1'),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Card(
              shadowColor: fromCssColor('#bdc3c7'),
              elevation: 4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        BarcodeWidget(
                          barcode: _type(),
                          padding: EdgeInsets.only(left: 10, right: 10),
                          data: result,
                          errorBuilder: (context, error) => Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Text(error),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            DropdownButton(
              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Column(
                children: [
                  TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Type your text',
                      hintStyle: TextStyle(
                          fontSize: 16.0, color: fromCssColor('#95a5a6')),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    onChanged: (String value) {
                      sendTextFieldValue(value);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    child: Text('Submit'),
                    onPressed: () => textResult(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

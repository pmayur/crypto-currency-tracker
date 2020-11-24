import 'package:flutter/material.dart';
import 'package:wallet/flutterfire/flutterfire.dart';

class AddView extends StatefulWidget {
  AddView({Key key}) : super(key: key);

  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  List<String> coins = [
    "bitcoin",
    "tether",
    "ethereum",
  ];

  String dropdownValue = "bitcoin";
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Portfolio"),
      ),
      body: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Container(
              width: 200,
              height: 40,
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton(
                isDense: false,
                underline: SizedBox(),
                iconSize: 24,
                value: dropdownValue,
                elevation: 1,
                isExpanded: true,
                onChanged: (String value) {
                  setState(() {
                    dropdownValue = value;
                  });
                },
                items: coins.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  String _addAmountToDisplay = "0.0";
  TextEditingController _amountController = TextEditingController(text: "0.0");

  _printLatestValue() {
    setState(() {
      _addAmountToDisplay = _amountController.text.toString();
    });
  }

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    _amountController.addListener(_printLatestValue);
  }

  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _amountController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    double _heightOfHeader = MediaQuery.of(context).size.height * 0.4;

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: _heightOfHeader,
              padding: EdgeInsets.only(top: 55, left: 20, right: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF095759),
                    const Color(0xFF4f97af),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Spacer(),
                      Text(
                        "ADD CURRENCY",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(
                        flex: 2,
                      )
                    ],
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Spacer(),
                          Text(
                            r" $" + _addAmountToDisplay,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                          ),
                          Text(
                            r"Current: + $3,157.67 (23%)",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Spacer(
                            flex: 2,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            // crypto selection
            Container(
              padding: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width / 1.3,
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton(
                    isDense: false,
                    underline: Container(),
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
                        child:
                            Text(value[0].toUpperCase() + value.substring(1)),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),

            // amount input
            Container(
              padding: EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
                ], // Only numbers can be entered
                controller: _amountController,
                decoration: InputDecoration(
                  labelText: "Coin Amount",
                ),
              ),
            ),

            ButtonTheme(
              height: 50,
              minWidth: 300,
              child: RaisedButton(
                onPressed: () {
                  // onButtonPressed();
                },
                textColor: Colors.white54,
                color: Color(0xff0a4457),
                child: Text("ADD"),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

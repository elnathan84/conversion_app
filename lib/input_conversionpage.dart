import 'dart:convert';
import 'package:conversion_app/ui_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'constants.dart';

const Color cardColor = Colors.white;
const Color cardInputColor = Color(0XFFFFAB00);
int check;
List<double> val = [];
final constant = [];
double amount;
String reset;

class MainPage extends StatefulWidget {
  final String title = 'Money Conversion App';
  final String data;
  MainPage(this.data);

  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  String currencyData;
  String newCurrency;

  @override
  void initState() {
    if (val.isNotEmpty) {
      val = [];
    }

    // TODO: implement initState
    super.initState();
    currencyData = widget.data;
    updateCurrency();
    //print(converted);
  }

  void ResetData() {
    val.clear();
    currencyData = widget.data;
    updateCurrency();
  }

  void updateCurrency() {
    setState(() {
      val.add(jsonDecode(currencyData)['rates']['AUD']);
      val.add(jsonDecode(currencyData)['rates']['BGN']);
      val.add(jsonDecode(currencyData)['rates']['BRL']);
      val.add(jsonDecode(currencyData)['rates']['CAD']);
      val.add(jsonDecode(currencyData)['rates']['CHF']);
      val.add(jsonDecode(currencyData)['rates']['CNY']);
      val.add(jsonDecode(currencyData)['rates']['CZK']);
      val.add(jsonDecode(currencyData)['rates']['DKK']);
      val.add(jsonDecode(currencyData)['rates']['EUR']);
      val.add(jsonDecode(currencyData)['rates']['GBP']);
      val.add(jsonDecode(currencyData)['rates']['HKD']);
      val.add(jsonDecode(currencyData)['rates']['HRK']);
      val.add(jsonDecode(currencyData)['rates']['HUF']);
      val.add(jsonDecode(currencyData)['rates']['IDR']);
      val.add(jsonDecode(currencyData)['rates']['ILS']);
      val.add(jsonDecode(currencyData)['rates']['INR']);
      val.add(jsonDecode(currencyData)['rates']['ISK']);
      val.add(jsonDecode(currencyData)['rates']['JPY']);
      val.add(jsonDecode(currencyData)['rates']['KRW']);
      val.add(jsonDecode(currencyData)['rates']['MXN']);
      val.add(jsonDecode(currencyData)['rates']['MYR']);
      val.add(jsonDecode(currencyData)['rates']['NOK']);
      val.add(jsonDecode(currencyData)['rates']['NZD']);
      val.add(jsonDecode(currencyData)['rates']['PHP']);
      val.add(jsonDecode(currencyData)['rates']['PLN']);
      val.add(jsonDecode(currencyData)['rates']['RON']);
      val.add(jsonDecode(currencyData)['rates']['RUB']);
      val.add(jsonDecode(currencyData)['rates']['SEK']);
      val.add(jsonDecode(currencyData)['rates']['SGD']);
      val.add(jsonDecode(currencyData)['rates']['THB']);
      val.add(jsonDecode(currencyData)['rates']['TRY']);
      val.add(jsonDecode(currencyData)['rates']['USD']);
      val.add(jsonDecode(currencyData)['rates']['ZAR']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title,
            style: titleStyle,
          ),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Container(
          child: Stack(
            children: <Widget>[
              CardInputWidget(
                cardInputColor: cardInputColor,
                cardInputChild: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ComboBox(),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 50,
                      width: 220,
                      child: TextField(
                        onChanged: (value) {
                          amount = double.parse(value);
                        },
                        decoration: new InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            filled: true,
                            labelText: "Enter amount",
                            labelStyle: titleStyle),
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ],
                ),
              ),
              Positioned.fill(
                top: 100,
                child: CardWidget(
                  cardColor: cardColor,
                  cardChild: Container(
                    margin: EdgeInsets.only(top: 3, left: 9),
                    child: CurrencyList(
                      value: val,
                    ),
                  ),
                ),
              )
            ],
            overflow: Overflow.clip,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ResetData();
          for (var i = 0; i < 33; i++) {
            val[i] = val[i] * amount;
          }
          updateCurrency();

          //converted = val;
        },
        label: Text('Convert'),
        icon: Icon(Icons.sync),
        backgroundColor: cardInputColor,
      ),
    );
  }
}

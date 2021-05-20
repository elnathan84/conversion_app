import 'package:conversion_app/loading%20page.dart';
import 'package:conversion_app/constants.dart';
import 'package:conversion_app/currency_API.dart';
import 'package:flutter/material.dart';

List<Map> _myJson = [
  {"id": '1', "image": "images/AUD.png", "name": "AUD"},
  {"id": '2', "image": "images/BGN.png", "name": "BGN"},
  {"id": '3', "image": "images/BRL.png", "name": "BRL"},
  {"id": '4', "image": "images/CAD.png", "name": "CAD"},
  {"id": '5', "image": "images/CHF.png", "name": "CHF"},
  {"id": '6', "image": "images/CNY.png", "name": "CNY"},
  {"id": '7', "image": "images/CZK.png", "name": "CZK"},
  {"id": '8', "image": "images/DKK.png", "name": "DKK"},
  {"id": '9', "image": "images/EUR.png", "name": "EUR"},
  {"id": '10', "image": "images/GBP.png", "name": "GBP"},
  {"id": '11', "image": "images/HKD.png", "name": "HKD"},
  {"id": '12', "image": "images/HRK.png", "name": "HRK"},
  {"id": '13', "image": "images/HUF.png", "name": "HUF"},
  {"id": '14', "image": "images/IDR.png", "name": "IDR"},
  {"id": '15', "image": "images/ILS.png", "name": "ILS"},
  {"id": '16', "image": "images/INR.png", "name": "INR"},
  {"id": '17', "image": "images/ISK.png", "name": "ISK"},
  {"id": '18', "image": "images/JPY.png", "name": "JPY"},
  {"id": '19', "image": "images/KRW.png", "name": "KRW"},
  {"id": '20', "image": "images/MXN.png", "name": "MXN"},
  {"id": '21', "image": "images/MYR.png", "name": "MYR"},
  {"id": '22', "image": "images/NOK.png", "name": "NOK"},
  {"id": '23', "image": "images/NZD.png", "name": "NZD"},
  {"id": '24', "image": "images/PHP.png", "name": "PHP"},
  {"id": '25', "image": "images/PLN.png", "name": "PLN"},
  {"id": '26', "image": "images/RON.png", "name": "RON"},
  {"id": '27', "image": "images/RUB.png", "name": "RUB"},
  {"id": '28', "image": "images/SEK.png", "name": "SEK"},
  {"id": '29', "image": "images/SGD.png", "name": "SGD"},
  {"id": '30', "image": "images/THB.png", "name": "THB"},
  {"id": '31', "image": "images/TRY.png", "name": "TRY"},
  {"id": '32', "image": "images/USD.png", "name": "USD"},
  {"id": '33', "image": "images/ZAR.png", "name": "ZAR"},
];

final ratesList = [
  'AUD',
  'BGN',
  'BRL',
  'CAD',
  'CHF',
  'CNY',
  'CZK',
  'DKK',
  'EUR',
  'GBP',
  'HKD',
  'HRK',
  'HUF',
  'IDR',
  'ILS',
  'INR',
  'ISK',
  'JPY',
  'KRW',
  'MXN',
  'MYR',
  'NOK',
  'NZD',
  'PHP',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'THB',
  'TRY',
  'USD',
  'ZAR',
];

List<String> imageList = [
  'images/AUD.png',
  'images/BGN.png',
  'images/BRL.png',
  'images/CAD.png',
  'images/CHF.png',
  'images/CNY.png',
  'images/CZK.png',
  'images/DKK.png',
  'images/EUR.png',
  'images/GBP.png',
  'images/HKD.png',
  'images/HRK.png',
  'images/HUF.png',
  'images/IDR.png',
  'images/ILS.png',
  'images/INR.png',
  'images/ISK.png',
  'images/JPY.png',
  'images/KRW.png',
  'images/MXN.png',
  'images/MYR.png',
  'images/NOK.png',
  'images/NZD.png',
  'images/PHP.png',
  'images/PLN.png',
  'images/RON.png',
  'images/RUB.png',
  'images/SEK.png',
  'images/SGD.png',
  'images/THB.png',
  'images/TRY.png',
  'images/USD.png',
  'images/ZAR.png',
];

String _selected = "PHP";

class CardWidget extends StatelessWidget {
  final Color cardColor;
  final Widget cardChild;

  CardWidget({@required this.cardColor, @required this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0)),
        color: cardColor,
      ),
    );
  }
}

class CardInputWidget extends StatelessWidget {
  final Color cardInputColor;
  final Widget cardInputChild;
  CardInputWidget(
      {@required this.cardInputColor, @required this.cardInputChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: cardInputChild,
      //margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(50.0), topLeft: Radius.circular(50.0)),
        color: cardInputColor,
      ),
    );
  }
}

class ComboBox extends StatefulWidget {
  @override
  _ComboBoxState createState() => _ComboBoxState();
}

class _ComboBoxState extends State<ComboBox> {
  Networking networking = new Networking();

  @override
  Widget build(BuildContext context) {
    Networking networking = new Networking();
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            dropdownColor: Color(0XFFFFAB00),
            isDense: false,
            hint: new Text(
              "Select Currency",
              style: labelStyle,
            ),
            value: _selected,
            onChanged: (String newValue) async {
              setState(() {
                _selected = newValue;
              });
              String B = await networking.getSpecificData(_selected);
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return LoadingScreen(_selected);
                },
              ));
              //print(_selected);
            },
            items: _myJson.map((Map map) {
              return new DropdownMenuItem<String>(
                value: map["name"].toString(),
                // value: _mySelection,
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      map["image"],
                      width: 25,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          map["name"],
                          style: numberStyle,
                        )),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class CurrencyList extends StatefulWidget {
  final List<double> value;
  //final List<String> value;
  CurrencyList({@required this.value});

  @override
  _CurrencyListState createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {
  @override
  Widget build(BuildContext context) {
    // backing data

    return ListView.builder(
      itemCount: imageList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('${imageList[index]}'),
          ),
          title: Text(
            ('${widget.value[index]}'),
            style: currencyStyle,
          ),
          subtitle: Text(
            '${ratesList[index]}',
            style: subcurrencyStyle,
          ),
          selected: true,
        );
      },
    );
  }
}

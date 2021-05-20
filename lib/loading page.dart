import 'package:conversion_app/constants.dart';
import 'package:conversion_app/currency_API.dart';
import 'package:conversion_app/input_conversionpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  final String renew;
  LoadingScreen(this.renew);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String check;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check = widget.renew;
    if (check.isEmpty) {
      displayCurrencyData();
    } else {
      displaySpecificData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpinKitWave(
              size: 70,
              color: Colors.white,
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                'Created by: Elnathan Salavarria',
                style: titleStyle,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }

  void displayCurrencyData() async {
    Networking networking = new Networking();
    String B = await networking.getCurrencyData();
    //print(jsonDecode(B)['rates']['AUD']);
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return MainPage(B);
      },
    ));
  }

  void displaySpecificData() async {
    Networking networking = new Networking();
    String C = await networking.getSpecificData(check);
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return MainPage(C);
      },
    ));
  }
}

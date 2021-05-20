import 'package:http/http.dart';
import 'dart:async';

class Networking {
  String data;
  String base;

  Future getSpecificData(base) async {
    Response response =
        await get('https://api.exchangeratesapi.io/latest?base=$base');
    if (response.statusCode == 200) {
      data = response.body;
      return data;
    } else
      print(response.statusCode);
  }

  Future getCurrencyData() async {
    Response response =
        await get('https://api.exchangeratesapi.io/latest?base=USD');
    if (response.statusCode == 200) {
      data = response.body;
      return data;
    } else
      print(response.statusCode);
  }
}

class Job {
  final int id;
  final String position;
  final String company;
  final String description;

  Job({this.id, this.position, this.company, this.description});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      position: json['position'],
      company: json['company'],
      description: json['description'],
    );
  }
}

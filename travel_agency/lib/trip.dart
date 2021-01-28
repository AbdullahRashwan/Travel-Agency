import 'package:intl/intl.dart';
class Trip {
  int _id;
  String _location;
  int _passenger_limit;
  var  _date;
  double _price;

  //constructor
  Trip(int id, String location, int passenger_limit, String date, double price) {
    this._id = id;
    this._location = location;
    this._passenger_limit = passenger_limit;
    this._date = DateFormat('d/M/yy').parse(date);
    this._price = price;
  }
  //getter
  int get id => _id;
  String get location => _location;
  int get passenger_limit => _passenger_limit;
  double get price => _price;
  get date => _date;

   //setter
  set id(int value) {
    _id = value;
  }
  set price(double value) {
    _price = value;
  }

  set location(String value) {
    _location = value;
  }

  set date(value) {
    _date = DateFormat('d/M/yy').parse(value);
  }

  set passenger_limit(int value) {
    _passenger_limit = value;
  }

}
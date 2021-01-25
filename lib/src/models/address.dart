import 'geo.dart';

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address.fromJson(Map<String, dynamic> parsedJson)
      : street = parsedJson['street'],
        suite = parsedJson['suite'],
        city = parsedJson['city'],
        zipcode = parsedJson['zipcode'],
        geo = Geo.fromJson(parsedJson['geo']);
}

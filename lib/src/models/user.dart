import 'address.dart';
import 'company.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final Address address;
  final Company company;

  User.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        name = parsedJson['name'],
        username = parsedJson['username'],
        email = parsedJson['email'],
        phone = parsedJson['phone'],
        website = parsedJson['website'],
        address = Address.fromJson(parsedJson['address']),
        company = Company.fromJson(parsedJson['company']);
}

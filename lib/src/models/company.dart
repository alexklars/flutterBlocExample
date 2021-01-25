class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company.fromJson(Map<String, dynamic> parsedJson)
      : name = parsedJson['name'],
        catchPhrase = parsedJson['catchPhrase'],
        bs = parsedJson['bs'];
}

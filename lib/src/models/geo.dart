class Geo {
  final double lat;
  final double lng;

  Geo.fromJson(Map<String, dynamic> parsedJson)
      : lat = double.parse(parsedJson['lat'] ?? '0'),
        lng = double.parse(parsedJson['lng'] ?? '0');
}

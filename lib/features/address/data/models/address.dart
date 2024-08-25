class Address {
  final String country;
  final String state;
  final String city;
  final String region;
  final String street;
  final String alley;
  final String plaque;
  final String description;
  final double lat;
  final double lng;

  Address({
    required this.country,
    required this.state,
    required this.city,
    required this.region,
    required this.street,
    required this.alley,
    required this.plaque,
    required this.description,
    required this.lat,
    required this.lng,
  });

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'state': state,
      'city': city,
      'region': region,
      'street': street,
      'alley': alley,
      'plaque': plaque,
      'description': description,
      'lat': lat,
      'lng': lng,
    };
  }
}

class LocationModel {
  final String name;
  final String country;

  LocationModel({
    required this.name,
    required this.country,
  });

  factory LocationModel.fromJson(
      Map<String, dynamic> locationData,
      ) {
    return LocationModel(
      name: locationData['location']["name"],
      country: locationData['location']["country"],
    );
  }
}

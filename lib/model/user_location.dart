class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCoordinate coordinates;
  final LocationTimezone timezone;

  UserLocation({
    required this.city,
    required this.coordinates,
    required this.country,
    required this.postcode,
    required this.state,
    required this.street,
    required this.timezone,
  });
  factory UserLocation.fromMap(Map<String, dynamic> user) {
    final coordinates = LocationCoordinate.fromMap(user['coordinates']);
    final street = LocationStreet.fromMap(user['street']);
    final timezone = LocationTimezone.fromMap(user['timezone']);
    return UserLocation(
      city: user['city'],
      coordinates: coordinates,
      country: user['country'],
      postcode: user['postcode'].toString(),
      state: user['state'],
      street: street,
      timezone: timezone,
    );
  }
}

class LocationStreet {
  final int number;
  final String name;

  LocationStreet({
    required this.name,
    required this.number,
  });

  factory LocationStreet.fromMap(Map<String, dynamic> user) {
    return LocationStreet(
      name: user['name'],
      number: user['number'],
    );
  }
}

class LocationCoordinate {
  final String longitude;
  final String latitude;

  LocationCoordinate({
    required this.latitude,
    required this.longitude,
  });

  factory LocationCoordinate.fromMap(Map<String, dynamic> user) {
    return LocationCoordinate(
      latitude: user['latitude'],
      longitude: user['longitude'],
    );
  }
}

class LocationTimezone {
  final String offset;
  final String description;

  LocationTimezone({
    required this.description,
    required this.offset,
  });
  factory LocationTimezone.fromMap(Map<String, dynamic> user) {
    return LocationTimezone(
      description: user['description'],
      offset: user['offset'],
    );
  }
}

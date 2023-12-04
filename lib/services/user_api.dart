import 'package:api/model/user.dart';
import 'package:api/model/user_dob.dart';
import 'package:api/model/user_location.dart';
import 'package:http/http.dart' as http;
import 'package:api/model/user_name.dart';
import 'dart:convert';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    print('fetchUsers called');
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((user) {
      final name = Username(
        first: user['name']['first'],
        title: user['name']['title'],
        last: user['name']['last'],
      );
      final date = user['dob']['date'];
      final dob = UserDob(
        age: user['dob']['age'],
        date: DateTime.parse(date),
      );
      final coordinates = LocationCoordinate(
          latitude: user['location']['coordinates']['latitude'],
          longitude: user['location']['coordinates']['longitude']);
      final street = LocationStreet(
        name: user['location'][' street']['name'],
        number: user['location'][' street']['number'],
      );
      final timezone = LocationTimezoneCoordinate(
        description: user['location']['timezone']['description'],
        offset: user['location']['timezone']['offset'],
      );
      final location = UserLocation(
        city: user['location'][' city'],
        coordinates: coordinates,
        country: user['location']['country'],
        postcode: user['location'][' postcode'].toString(),
        state: user['location']['state'],
        street: street,
        timezone: timezone,
      );
      return User(
        cell: user['cell'],
        email: user['email'],
        gender: user['gender'],
        phone: user['phone'],
        nat: user['nat'],
        name: name,
        dob: dob,
        location: location,
      );
    }).toList();
    print("fetchUsers completed");
    return users;
  }
}

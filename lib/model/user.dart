import 'package:api/model/user_dob.dart';
import 'package:api/model/user_location.dart';
import 'package:api/model/user_name.dart';
import 'package:api/model/user_picture.dart';
import 'package:flutter/foundation.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final Username name;
  final UserDob dob;
  final UserLocation location;
  final UserPicture picture;
  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,
    required this.picture,
  });

  factory User.fromMap(Map<String, dynamic> user) {
    final name = Username.fromMap(user['name']);
    final dob = UserDob.fromMap(user['dob']);
    final location = UserLocation.fromMap(user['location']);
    final picture = UserPicture.fromMap(user['picture']);
    return User(
      cell: user['cell'],
      email: user['email'],
      gender: user['gender'],
      phone: user['phone'],
      nat: user['nat'],
      name: name,
      dob: dob,
      location: location,
      picture: picture,
    );
  }
  String get fullName {
    return ' ${name.title} ${name.first} ${name.last}';
  }
}

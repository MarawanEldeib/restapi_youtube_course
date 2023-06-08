import 'package:restapi_courseapicall/model/user_dob.dart';
import 'package:restapi_courseapicall/model/user_location.dart';
import 'package:restapi_courseapicall/model/user_name.dart';
import 'package:restapi_courseapicall/model/user_picture.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
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

  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName.fromMap(e['name']);
    final dob = UserDob.fromMap(e['dob']);
    final location = UserLocation.fromMap(e['location']);
    final picture = UserPicture.fromMap(e['picture']);

    return User(
      cell: e['cell'],
      email: e['email'],
      gender: e['gender'],
      nat: e['nat'],
      phone: e['phone'],
      name: name,
      dob: dob,
      location: location,
      picture: picture,
    );
  }

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }

  String get fullcoordinates {
    return '${location.coordinates.latitude.toString()}, ${location.coordinates.longitude.toString()}';
  }

  String get fullstreet {
    return '${location.street.number} ${location.street.name}';
  }

  String get fulltimezone {
    return '${location.timezone.offset} ${location.timezone.description}';
  }
}

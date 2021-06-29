import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart' show DateFormat;

enum UserState { available, away, busy }

class User {
  String id = UniqueKey().toString();
  String name;
  String email;
  String gender;
  DateTime dateOfBirth;
  String avatar;
  String address;
  UserState userState;

  User.init();

  User.basic({this.name, this.avatar, this.userState});

  User.advanced(
      {this.name,
      this.email,
      this.gender,
      this.dateOfBirth,
      this.avatar,
      this.address,
      this.userState});

  User getCurrentUser() {
    return User.advanced(
        name: 'Andrew R. Whitesides',
        email: 'andrew@gmail.com',
        gender: 'Male',
        dateOfBirth: DateTime(1993, 12, 31),
        avatar: 'img/user2.jpg',
        address: '4600 Isaacs Creek Road Golden, IL 62339',
        userState: UserState.available);
  }

  getDateOfBirth() {
    return DateFormat('yyyy-MM-dd').format(this.dateOfBirth);
  }
}

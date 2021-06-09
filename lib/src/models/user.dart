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

  User.basic(this.name, this.avatar, this.userState);

  User.advanced(this.name, this.email, this.gender, this.dateOfBirth,
      this.avatar, this.address, this.userState);

  User getCurrentUser() {
    return User.advanced(
        'Rahul Dev Kureel',
        'rahul@gmail.com',
        'Male',
        DateTime(1999, 12, 31),
        'img/user3.jpg',
        'House Number 4600, Sector 11, Dwarka, Delhi 62339',
        UserState.available);
  }

  getDateOfBirth() {
    return DateFormat('yyyy-MM-dd').format(this.dateOfBirth);
  }
}

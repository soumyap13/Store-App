import 'package:flutter/foundation.dart';
//import 'package:store_app/src/models/address.dart';

class Address with ChangeNotifier {
  final String id;
  final String fullName;
  final double phone;
  final String streetAddress1;
  final String streetAddress2;
  final String city;
  final String state;
  final double postalcode;
  final String imageUrl;
  bool isDefault;

  Address({
    @required this.id,
    @required this.fullName,
    @required this.phone,
    @required this.streetAddress1,
    @required this.streetAddress2,
    @required this.city,
    @required this.state,
    @required this.postalcode,
    this.imageUrl,
    this.isDefault = false,
  });
  void toggleFavoriteStatus() {
    isDefault = !isDefault;
    notifyListeners();
  }
}

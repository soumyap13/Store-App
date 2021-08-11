import 'package:flutter/cupertino.dart';
import 'package:store_app/src/models/address.dart';

class AddressProvider with ChangeNotifier {
  List<Address> _items = [
    Address(
      id: '1',
      fullName: 'Naraka  Parmar',
      phone: 8767546789,
      streetAddress1: 'Tilak Rd, Opp Mahad Coop Bank',
      streetAddress2: ' Panvel, Navi Mumbai',
      city: 'Mumbai',
      state: 'Maharashtra',
      postalcode: 401206,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Address(
      id: '2',
      fullName: 'Apala  Nagy',
      phone: 87657657654,
      streetAddress1: '1452 /, Wazir Nagar,',
      streetAddress2: ' Kotla Mubarakpur',
      city: 'Delhi',
      state: 'delhi',
      postalcode: 110003,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
  ];

  List<Address> get items {
    return [..._items];
  }

  List<Address> get favoriteItems {
    return _items.where((prodItem) => prodItem.isDefault).toList();
  }

  Address findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addAddress(Address address) {
    final newAddress = Address(
      fullName: address.fullName,
      phone: address.phone,
      streetAddress1: address.streetAddress1,
      streetAddress2: address.streetAddress2,
      city: address.city,
      state: address.state,
      postalcode: address.postalcode,
      id: DateTime.now().toString(),
    );
    _items.add(newAddress);
    // _items.add(value);
    notifyListeners();
  }

  void updateAddress(String id, Address newAddress) {
    final addrIndex = _items.indexWhere((addr) => addr.id == id);
    if (addrIndex >= 0) {
      _items[addrIndex] = newAddress;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteAddress(String id) {
    _items.removeWhere((addr) => addr.id == id);
    notifyListeners();
  }
}

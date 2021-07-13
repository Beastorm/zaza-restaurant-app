import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:zaza/models/address.dart';
import 'package:zaza/models/address_model.dart';

Future<Address> getAddressName(LocationData location, String apiKey) async {
  String city, state, country, zipCode;
  try {
    var endPoint =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${location?.latitude},${location?.longitude}&key=$apiKey';
    // var response = jsonDecode((await http.post(
    //   endPoint,
    // ))
    //     .body);

    var response = await http.post(endPoint);

    AddressModel addressModel = addressModelFromJson(response.body);

    List<AddressComponent> addressComponents =
        addressModel.results[0].addressComponents;

    for (var i in addressComponents) {
      for (var j in i.types) {
        if (j == "country") {
          country = i.longName;
        }

        if (j == "administrative_area_level_1") {
          state = i.longName;
        }

        if (j == "locality") {
          city = i.longName;
        }

        if (j == "postal_code") {
          city = i.longName;
        }
      }
    }

    var address = Address(
        cityName: city,
        stateName: state,
        fullAddress: addressModel.results[0].formattedAddress,
        zipCode: zipCode,
        countryName: country);

    return address;
  } catch (e) {
    print(e);
    return null;
  }
}

Future<Locatione> getLatLng(String address) async {
   final String key = '${GlobalConfiguration().getValue('api_key')}';
  String endPoint =
      "https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=$key";

  var response = await http.post(endPoint);

  if (response.statusCode == 200) {
    AddressModel addressModel = addressModelFromJson(response.body);
    return addressModel.results[0].geometry.location;
  }

  return null;
}

Future<Address> getUserCurrentAddress() async {
  final String key = '${GlobalConfiguration().getValue('api_key')}';
  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return null;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return null;
    }
  }

  _locationData = await location.getLocation();
  return getAddressName(_locationData, key);
}

String getPostalCode(String address) {
  var list = address.split(", ");
  var pinInfo = list.elementAt(list.length - 2);

  print(pinInfo.split(" ").last);

  return pinInfo.split(" ").last;
}

getCityName(String address) {
  var list = address.split(", ");
  var cityInfo = list.elementAt(list.length - 2);
}

getCountryName(String address) {
  return address.split(",").toList().last;
}

getStateName(String address) {}

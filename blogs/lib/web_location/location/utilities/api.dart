// ignore_for_file: argument_type_not_assignable

import 'dart:convert';

import 'package:blogs/web_location/location/model/location.dart';
import 'package:http/http.dart' as http;

const _url = 'https://geolocation-db.com/json/';

class LocationAPI {
  LocationAPI();

  Future<String> fetchData() async {
    var _city = '';
    final resp = await http.get(Uri.parse(_url));

    if (resp.statusCode == 200) {
      final _data = LocationModel.fromJson(json.decode(resp.body));

      _city = _data.city ?? '';
    }

    return _city;
  }
}

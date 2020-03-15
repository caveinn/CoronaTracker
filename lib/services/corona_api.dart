import 'dart:convert';

import 'package:corona_tracker/models/countrydata.dart';
import 'package:corona_tracker/models/worlddata.dart';
import 'package:http/http.dart' as http;

Future<WorldData> getWorldWideData() async {
  http.Response response = await http.get(
      'https://corona-virus-stats.herokuapp.com/api/v1/cases/general-stats');
  var json = jsonDecode(response.body);
  var worldData = WorldData(
      cases: json['data']['total_cases'],
      deaths: json['data']['death_cases'],
      recoveries: json['data']['recovery_cases']);
  return worldData;
}

Future<List<CountryData>> getCountryList({String search}) async {
  http.Response response = await http.get(
      'https://corona-virus-stats.herokuapp.com/api/v1/cases/countries-search?limit=300&search=$search');
  var json = jsonDecode(response.body);
  var rows = json['data']['rows'];
  List<CountryData> countries = [];
  for (var row in rows) {
    CountryData country = CountryData(
        cases: row['total_cases'],
        deaths: row['total_deaths'],
        recoveries: row['total_recovered'],
        countryName: row['country']);
    countries.add(country);
  }
  return countries;
}

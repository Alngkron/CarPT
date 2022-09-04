import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:carpt/models/car.dart';

class CarApi {
  final String url = "http://localhost:3000";

  List<Car> parseCar(String responseBody) {
    final parsedData = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsedData
        .map<Car>(
          (json) => Car.fromJson(json),
        )
        .toList();
  }

  Future<List<Car>?> fetchCars() async {
    var uri = Uri.parse(url + "/cars");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return parseCar(response.body);
    } else {
      return [];
    }
  }
}

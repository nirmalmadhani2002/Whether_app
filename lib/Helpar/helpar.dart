import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modal/modal.dart';

class ApiHelpers {
  ApiHelpers._();

  static final ApiHelpers apiHelpers = ApiHelpers._();

  String apiKey = "60d714681ae2476f22d6e1bec404838e";

  Future<Weather?> getData({required String city, required String code}) async {

    String api =
        "https://api.openweathermap.org/data/2.5/weather?q=$city,$code&appid=60d714681ae2476f22d6e1bec404838e";

    http.Response data = await http.get(Uri.parse(api));

    if (data.statusCode == 200) {
      Map decodeData = jsonDecode(data.body);

      Weather allData = Weather.fromMap(data: decodeData);

      return allData;
    }
    return null;
  }
}

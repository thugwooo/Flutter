import 'dart:convert';

import 'package:http/http.dart';

class Network {
  final String url;
  final String urlAir;
  Network(this.url, this.urlAir);

  Future<dynamic> getJsonData() async {
    var url2 = Uri.parse(url);
    Response response = await get(url2);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }

  Future<dynamic> getAirData() async {
    var url2 = Uri.parse(urlAir);
    Response response = await get(url2);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }
}

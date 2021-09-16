import 'dart:convert';
import 'package:http/http.dart';

class Network {
  final String url;
  Network(this.url);

  Future<dynamic> getJsonData() async {
    var url2 = Uri.parse(url);
    Response response = await get(url2);
    if (response.statusCode == 200) {
      var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
      return parsingData;
    }
  }

  Future<dynamic> postJsonData(dynamic data) async {
    var list;
    try {
      var url2 = Uri.parse(url);
      var response = await post(url2, body: data);

      print('post status: ${response.statusCode}');

      var responseBody = utf8.decode(response.bodyBytes);
      print("body: $responseBody");
      list = jsonDecode(responseBody);
      print(list.length);
    } catch (e) {
      print(e);
    }
    return list;
  }
}

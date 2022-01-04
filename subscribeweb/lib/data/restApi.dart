import 'package:get/get.dart';

class UserProvider extends GetConnect {
  // Get request
  Future<dynamic> getUser() => get('http://127.0.0.1:8000/userdata/get/');
  // Post request
  Future<dynamic> postUser(var data) => httpClient
      .post('http://127.0.0.1:8000/userdata/get/', body: {'hi': 'hi'});

  GetSocket userMessages() {
    return socket('http://127.0.0.1:8000/userdata/get/');
  }
}

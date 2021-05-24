import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class BaseApi {
  final String serverUrl = "192.168.1.46";
  int id;
  String token;

  final Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  var client = http.Client();

  Future<String> getAuthToken(
      String user, String password, String serverUrl) async {
    var body = json.encode({
      'jsonrpc': '2.0',
      'method': 'user.login',
      'params': {'user': user, 'password': password},
      'id': 1,
      'auth': null
    });

    var uriResponse = await client.post(
        Uri.parse('http://$serverUrl/api_jsonrpc.php'),
        body: body,
        headers: headers);

    if (uriResponse.statusCode == 200) {
      Map<String, Object> response = jsonDecode(uriResponse.body);

      token = response['result'];
      log(token);

      return token;
    } else {
      String code = uriResponse.statusCode.toString();
      log(code);
      throw Exception('Error token request! Status code $code');
    }
  }
}

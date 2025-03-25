import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<dynamic, dynamic>> retornarCep(String cep) async {
  var url = Uri.parse("https://viacep.com.br/ws/$cep/json/");
  var response = await http.get(url);
  var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  return decodedResponse;
}

import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<String>> fetchLorem() async {
  final response = await http.get(
    Uri.parse("https://baconipsum.com/api/?type=meat-and-filler&paras=7"),
  );

  if (response.statusCode == 200) {
    return _parseResponse(jsonDecode(response.body));
  } else {
    throw Exception("Could not retrieve Lorem: ${response.statusCode}");
  }
}

List<String> _parseResponse(List<dynamic> json) => json.cast();

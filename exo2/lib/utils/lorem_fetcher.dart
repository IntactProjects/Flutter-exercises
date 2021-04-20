import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<String>> fetchLorem() async {
  final response = await http
      .get(Uri.parse("https://baconipsum.com/api/?type=meat-and-filler"));

  if (response.statusCode == 200) {
    return _parseResponse(jsonDecode(response.body));
  } else {
    throw Exception('Failed to fetch lorem');
  }
}

List<String> _parseResponse(List<dynamic> json) => json.cast();

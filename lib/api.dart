import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models.dart';

Future<List<Match>> fetchMatches() async {
  // TODO: Remove the CORS proxy
  const String matchesUrl =
      'https://corsproxy.io/?https://boca.sobrinojulian.workers.dev/';
  final response = await http.get(Uri.parse(matchesUrl));

  if (response.statusCode == 200) {
    Iterable jsonResponse = jsonDecode(response.body);
    return jsonResponse.map((match) => Match.fromJson(match)).toList();
  } else {
    throw Exception('Failed to load matches');
  }
}

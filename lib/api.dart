import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models.dart';

Future<Album> fetchAlbum() async {
  const String albumUrl = 'https://jsonplaceholder.typicode.com/albums/3';
  final response = await http.get(Uri.parse(albumUrl));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }
  throw Exception('Failed to load album');
}

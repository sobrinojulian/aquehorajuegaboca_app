import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models.dart';

Future<Album> fetchAlbum() async {
  const String albumUrl = 'https://jsonplaceholder.typicode.com/albums/3';
  final response = await http.get(Uri.parse(albumUrl));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<Album>> fetchAlbums() async {
  const String albumsUrl = 'https://jsonplaceholder.typicode.com/albums';
  final response = await http.get(Uri.parse(albumsUrl));

  if (response.statusCode == 200) {
    Iterable jsonResponse = jsonDecode(response.body);
    return jsonResponse.map((album) => Album.fromJson(album)).toList();
  } else {
    throw Exception('Failed to load albums');
  }
}

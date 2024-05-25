import 'package:flutter/material.dart';
import 'package:aquehorajuegaboca_app/models.dart';

class AlbumTile extends StatelessWidget {
  final Album album;

  const AlbumTile({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${album.id.toString()}: ${album.title}'),
    );
  }
}

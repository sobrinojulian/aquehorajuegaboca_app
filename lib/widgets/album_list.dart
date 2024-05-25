import 'package:flutter/material.dart';
import 'package:aquehorajuegaboca_app/models.dart';
import 'package:aquehorajuegaboca_app/widgets/album_tile.dart';

class AlbumList extends StatelessWidget {
  final List<Album> albums;

  const AlbumList({Key? key, required this.albums}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: albums.length,
      itemBuilder: (context, index) {
        return AlbumTile(album: albums[index]);
      },
    );
  }
}

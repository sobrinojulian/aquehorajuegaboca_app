import 'package:flutter/material.dart';
import 'package:aquehorajuegaboca_app/models.dart';
import 'package:aquehorajuegaboca_app/widgets/match_tile.dart';

class MatchList extends StatelessWidget {
  final List<Match> matches;

  const MatchList({super.key, required this.matches});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: matches.length,
      itemBuilder: (context, index) {
        return MatchTile(match: matches[index]);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:aquehorajuegaboca_app/models.dart';

class MatchTile extends StatelessWidget {
  final Match match;

  const MatchTile({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${match.id.toString()}: ${match.date.toString()}'),
      subtitle: Text(match.league),
    );
  }
}

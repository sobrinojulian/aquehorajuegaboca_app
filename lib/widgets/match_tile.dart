import 'package:flutter/material.dart';
import 'package:aquehorajuegaboca_app/models.dart';

class MatchTile extends StatelessWidget {
  final Match match;

  const MatchTile({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Match ID: ${match.id}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Date: ${match.date.toLocal()}',
              style: TextStyle(color: Colors.grey[600]),
            ),
            Text('League: ${match.league}'),
            SizedBox(height: 10),
            Text('Competitors:', style: TextStyle(fontWeight: FontWeight.bold)),
            ...match.competitors.map((competitor) => Row(
              children: [
                Image.network(competitor.logo, height: 24, width: 24),
                SizedBox(width: 10),
                Text('${competitor.displayName} (${competitor.isHome ? "Home" : "Away"})'),
              ],
            )).toList(),
            SizedBox(height: 10),
            Text(
              match.tbd ? 'To be decided' : match.completed ? 'Completed' : 'Scheduled',
              style: TextStyle(color: match.completed ? Colors.green : Colors.orange),
            ),
            SizedBox(height: 10),
            Text('Venue:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Name: ${match.venue.fullName}'),
            Text('City: ${match.venue.address.city}'),
            Text('Country: ${match.venue.address.country}'),
          ],
        ),
      ),
    );
  }
}

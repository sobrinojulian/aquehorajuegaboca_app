import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:aquehorajuegaboca_app/models.dart';

class MatchTile extends StatelessWidget {
  final Match match;

  const MatchTile({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    final DateTime utcDate =
        match.date.toUtc().add(const Duration(hours: -3)); // UTC-03:00

    final DateFormat dayOfWeekFormat = DateFormat('EEE'); // Mon
    final DateFormat dateFormat = DateFormat('dd/MM'); // 24/05
    final DateFormat timeFormat = DateFormat('HH:mm'); // 14:30

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(match.league),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Image.network(
                        match.competitors[0].logo,
                        height: 48.0,
                        width: 48.0,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        match.competitors[0].displayName,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(dayOfWeekFormat.format(utcDate)),
                      Text(dateFormat.format(utcDate)),
                      match.tbd
                          ? const Text('TBD')
                          : Text(timeFormat.format(utcDate)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.network(
                        match.competitors[1].logo,
                        height: 48.0,
                        width: 48.0,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        match.competitors[1].displayName,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

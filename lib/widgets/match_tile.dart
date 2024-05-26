import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:aquehorajuegaboca_app/models.dart';

class MatchTile extends StatelessWidget {
  final Match match;
  const MatchTile({super.key, required this.match});

  static const double _imageHeight = 48.0;
  static const double _imageWidth = 48.0;
  static const double _imageSpacing = 8.0;
  static const double _cardPadding = 8.0;

  Widget _buildCompetitorInfo(Competitor competitor) {
    return Column(
      children: [
        Image.network(
          competitor.logo,
          height: _imageHeight,
          width: _imageWidth,
        ),
        const SizedBox(width: _imageSpacing),
        Text(
          competitor.displayName,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildDateTimeInfo(DateTime date, bool tbd) {
    final dayOfWeekFormat = DateFormat('EEE'); // Mon
    final dateFormat = DateFormat('dd/MM'); // 24/05
    final timeFormat = DateFormat('HH:mm'); // 14:30

    return Column(
      children: [
        Text(dayOfWeekFormat.format(date)),
        Text(dateFormat.format(date)),
        tbd ? const Text('TBD') : Text(timeFormat.format(date)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final DateTime date = match.date.toLocal();
    final Competitor homeCompetitor = match.competitors[0];
    final Competitor awayCompetitor = match.competitors[1];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(_cardPadding),
        child: Column(
          children: [
            Text(match.league),
            Row(
              children: [
                Expanded(
                  child: _buildCompetitorInfo(homeCompetitor),
                ),
                Expanded(
                  child: _buildDateTimeInfo(date, match.tbd),
                ),
                Expanded(
                  child: _buildCompetitorInfo(awayCompetitor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

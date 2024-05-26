class Match {
  final String id;
  final List<Competitor> competitors;
  final DateTime date;
  //final bool tbd;
  //final bool completed;
  //final String link;
  final String league;
  //final Venue venue;

  Match({
    required this.id,
    required this.competitors,
    required this.date,
    //required this.tbd,
    //required this.completed,
    //required this.link,
    required this.league,
    //required this.venue,
  });

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      id: json['id'],
      competitors: (json['competitors'] as List)
          .map((competitorJson) => Competitor.fromJson(competitorJson))
          .toList(),
      date: DateTime.parse(json['date']),
      //tbd: json['tbd'],
      //completed: json['completed'],
      //link: json['link'],
      league: json['league'],
      //venue: Venue.fromJson(json['venue']),
    );
  }
}

class Competitor {
  final String id;
  final String displayName;
  final String logo;
  final bool isHome;

  Competitor({
    required this.id,
    required this.displayName,
    required this.logo,
    required this.isHome,
  });

  factory Competitor.fromJson(Map<String, dynamic> json) {
    return Competitor(
      id: json['id'],
      displayName: json['displayName'],
      logo: json['logo'],
      isHome: json['isHome'],
    );
  }
}

class Venue {
  final String fullName;
  final Address address;

  Venue({required this.fullName, required this.address});

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      fullName: json['fullName'],
      address: Address.fromJson(json['address']),
    );
  }
}

class Address {
  final String city;
  final String country;

  Address({required this.city, required this.country});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['city'],
      country: json['country'],
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';

import 'package:aquehorajuegaboca_app/models.dart';
import 'package:aquehorajuegaboca_app/api.dart';
import 'package:aquehorajuegaboca_app/widgets/match_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Match>> futureMatches;

  @override
  void initState() {
    super.initState();
    futureMatches = fetchMatches();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A que hora juega Boca?',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('A que hora juega Boca?'),
        // ),
        body: Center(
          child: FutureBuilder<List<Match>>(
            future: futureMatches,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MatchList(matches: snapshot.data!);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

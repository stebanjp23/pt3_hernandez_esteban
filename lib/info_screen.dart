import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pt3_hernandez_esteban/sports.dart';
import 'package:pt3_hernandez_esteban/team_info.dart';
import 'dart:convert';
import 'teams.dart';

class info extends StatefulWidget {
  final String sportName;

  final Teams team;

  const info({required this.team, required this.sportName, Key? key})
    : super(key: key);

  @override
  InfoScreen createState() => InfoScreen();
}

class InfoScreen extends State<info> {
  Teams_info informacion = Teams_info(titulos: '', estadio: '');
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getTeams();
  }

  Future<void> _getTeams() async {
    final url = Uri.parse(
      'https://www.vidalibarraquer.net/android/sports/${widget.sportName}/${widget.team.abreviation.toLowerCase()}.json',
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = jsonDecode(response.body);
      List<dynamic> data = jsonMap['data'];
      Teams_info teamsList = Teams_info.fromJson(data[0]);
      setState(() {
        informacion = teamsList;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.team.name)),
      body: Center(child: Column(
        children: [
          Image.network("https://www.vidalibarraquer.net/android/sports/${widget.sportName}/${widget.team.abreviation.toLowerCase()}.png"),
          Text('Titulos: ${informacion.titulos}'),
          Text('Estadio: ${informacion.estadio}'), 
        ]
      )
      ),
    );
  }
}

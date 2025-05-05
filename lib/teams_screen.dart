import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'sports.dart';
import 'dart:convert';
import 'teams.dart';
import 'info_screen.dart';


class Teams_Screen extends StatefulWidget{
  final String sportName;
  const Teams_Screen({required this.sportName});
  
  @override
  _Estado createState() => _Estado();
}

class _Estado extends State<Teams_Screen> {
  List<Teams> teams = [];
  bool isLoading = true;

  @override
  void initState(){
    super.initState();
    _getTeams();
  }

  Future <void> _getTeams() async {
  final url = Uri.parse('https://www.vidalibarraquer.net/android/sports/${widget.sportName}.json');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonMap = jsonDecode(response.body);
    List<dynamic> data = jsonMap['teams'];
    List<Teams> teamsList = data.map((item) => Teams.fromJson(item)).toList();
    setState(() {
      teams = teamsList;
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
      appBar: AppBar(title: const Text('Equipos')),
      body: (
        ListView.builder(
          itemCount: teams.length,
          itemBuilder: (context, index){
            var e = teams[index];
            return ListTile(
              leading: Image.network("https://www.vidalibarraquer.net/android/sports/${widget.sportName}/${e.abreviation.toLowerCase()}.png"),
              title: Text(e.name),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => info(team: e, sportName: widget.sportName,),)
                  );
              },
            );
          })
        
      ),
      );
  }
}
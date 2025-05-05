class Teams {
  final int id;
  final String name;
  final String abreviation;

  Teams({
    required this.id,
    required this.name,
    required this.abreviation,
  });

  factory Teams.fromJson(Map<String, dynamic> json) {
    return Teams(
      id: json['team_id'] as int,
      name: json['team_name'] as String,
      abreviation: json['team_abbreviation'] as String,
      
    );
  }
}




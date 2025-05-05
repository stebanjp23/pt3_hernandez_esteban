class Teams_info {
  final String titulos;
  final String estadio;

  Teams_info({
    required this.titulos,
    required this.estadio,
  });

  factory Teams_info.fromJson(Map<String, dynamic> json) {
    return Teams_info(
      titulos: json['titles'] as String,
      estadio: json['team_stadium'] as String,
    );
  }
}

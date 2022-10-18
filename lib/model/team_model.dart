class TeamModel {
  String? teamName;
  int? teamSkore;

  TeamModel({required this.teamName, this.teamSkore = 0});

  TeamModel.fromJson(Map<String, dynamic> json) {
    teamName = json['team_name'];
    teamSkore = json['team_skore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['team_name'] = teamName;
    data['team_skore'] = teamSkore;
    return data;
  }
}

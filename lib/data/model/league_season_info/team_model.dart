part of data;

class TeamModel extends TeamEntity {

  TeamModel({
    required int id,
    String? name,
    String? nameCode,
    bool? national,
    String? shortName,
    String? slug,
    SportModel? sport,
    ColorModel? teamColors,
    int? type,
    int? userCount,
  }) : super(
    id: id,
    name: name,
    nameCode: nameCode,
    national: national,
    shortName: shortName,
    slug: slug,
    sport: sport,
    teamColors: teamColors,
    type: type,
    userCount: userCount
  );

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    TeamModel teamModel = TeamModel(
      id: json['id'],
      name: json['name'],
      nameCode: json['nameCode'],
      national: json['national'],
      shortName: json['shortName'],
      slug: json['slug'],
      sport: SportModel.fromJson(json['sport']),
      teamColors: ColorModel.fromJson(json['teamColors']),
      type: json['type'],
      userCount: json['userCount']
    );

    return teamModel;
  }
}
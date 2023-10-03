part of data;

class InfoModel extends InfoEntity {

  InfoModel({
    required int id,
    List<dynamic>? hostCountries,
    List<dynamic>? newcomersLowerDivision,
    List<dynamic>? newcomersOther,
    List<dynamic>? newcomersUpperDivision,
    int? numberOfCompetitors,
    String? tier,
    int? totalPrizeMoney,
    String? totalPrizeMoneyCurrency,
    PrizeMoneyModel? totalPrizeMoneyRaw,
    TeamModel? winner,
  }) : super(
    id: id,
    hostCountries: hostCountries,
    newcomersLowerDivision: newcomersLowerDivision,
    newcomersOther: newcomersOther,
    newcomersUpperDivision: newcomersUpperDivision,
    numberOfCompetitors: numberOfCompetitors,
    tier: tier,
    totalPrizeMoney: totalPrizeMoney,
    totalPrizeMoneyCurrency: totalPrizeMoneyCurrency,
    totalPrizeMoneyRaw: totalPrizeMoneyRaw,
    winner: winner
  );

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    InfoModel infoModel = InfoModel(
      id: json['id'],
      hostCountries: json['hostCountries'],
      newcomersLowerDivision: json['newcomersLowerDivision'],
      newcomersOther: json['newcomersOther'],
      newcomersUpperDivision: json['newcomersUpperDivision'],
      numberOfCompetitors: json['numberOfCompetitors'],
      tier: json['tier'],
      totalPrizeMoney: json['totalPrizeMoney'],
      totalPrizeMoneyCurrency: json['totalPrizeMoneyCurrency'],
      totalPrizeMoneyRaw: PrizeMoneyModel.fromJson(json['totalPrizeMoneyRaw']),
      winner: TeamModel.fromJson(json['winner'])
    );

    return infoModel;
  }
}
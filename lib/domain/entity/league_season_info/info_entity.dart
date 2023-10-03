part of domain;

class InfoEntity extends HiveObject {

  final int id;
  final List<dynamic>? hostCountries;
  final List<dynamic>? newcomersLowerDivision;
  final List<dynamic>? newcomersOther;
  final List<dynamic>? newcomersUpperDivision;
  final int? numberOfCompetitors;
  final String? tier;
  final int? totalPrizeMoney;
  final String? totalPrizeMoneyCurrency;
  final PrizeMoneyEntity? totalPrizeMoneyRaw;
  final TeamEntity? winner;

  InfoEntity({
    required this.id,
    this.hostCountries,
    this.newcomersLowerDivision,
    this.newcomersOther,
    this.newcomersUpperDivision,
    this.numberOfCompetitors,
    this.tier,
    this.totalPrizeMoney,
    this.totalPrizeMoneyCurrency,
    this.totalPrizeMoneyRaw,
    this.winner,
  });
}
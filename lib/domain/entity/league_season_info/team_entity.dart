part of domain;

class TeamEntity extends HiveObject {

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? nameCode;

  @HiveField(3)
  final bool? national;

  @HiveField(4)
  final String? shortName;

  @HiveField(5)
  final String? slug;

  @HiveField(6)
  final SportEntity? sport;

  @HiveField(7)
  final ColorEntity? teamColors;

  @HiveField(8)
  final int? type;

  @HiveField(9)
  final int? userCount;

  TeamEntity({
    required this.id,
    this.name,
    this.nameCode,
    this.national,
    this.shortName,
    this.slug,
    this.sport,
    this.teamColors,
    this.type,
    this.userCount,
  });
}
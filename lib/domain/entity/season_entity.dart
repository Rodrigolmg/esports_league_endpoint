part of domain;

class SeasonEntity extends HiveObject {

  final int id;
  final bool? editor;
  final String? name;
  final String? year;

  SeasonEntity({
    required this.id,
    this.editor,
    this.name,
    this.year,
  });
}
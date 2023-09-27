part of data;

class SeasonModel extends SeasonEntity{

  SeasonModel({
    required int id,
    bool? editor,
    String? name,
    String? year,
  }) : super (
    id: id,
    editor: editor,
    name: name,
    year: year
  );

  factory SeasonModel.fromJson(Map<String, dynamic> json) {
    SeasonModel seasonModel = SeasonModel(
      id: json['id'],
      editor: json['editor'],
      name: json['name'],
      year: json['year']
    );

    return seasonModel;
  }

}
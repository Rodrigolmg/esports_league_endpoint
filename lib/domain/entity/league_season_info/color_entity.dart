part of domain;

class ColorEntity extends HiveObject {

  final String? primary;
  final String? secondary;
  final String? text;

  ColorEntity({
    this.primary,
    this.secondary,
    this.text,
  });
}
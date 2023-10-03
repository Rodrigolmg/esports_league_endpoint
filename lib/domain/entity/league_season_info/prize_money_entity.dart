part of domain;

class PrizeMoneyEntity extends HiveObject {

  final String? currency;
  final int? value;

  PrizeMoneyEntity({
    this.currency,
    this.value,
  });
}
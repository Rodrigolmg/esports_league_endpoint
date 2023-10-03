part of data;

class PrizeMoneyModel extends PrizeMoneyEntity {

  PrizeMoneyModel({
    String? currency,
    int? value,
  }) : super(
    currency: currency,
    value: value
  );

  factory PrizeMoneyModel.fromJson(Map<String, dynamic> json) {
    PrizeMoneyModel prizeMoneyModel = PrizeMoneyModel(
      currency: json['currency'],
      value: json['value'],
    );

    return prizeMoneyModel;
  }
}
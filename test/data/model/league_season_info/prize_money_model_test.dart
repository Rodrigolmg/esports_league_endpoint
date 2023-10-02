import 'dart:convert';

import 'package:esports_league_endpoint/data/data.dart';
import 'package:esports_league_endpoint/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../fixtures/json_file_name.dart';

void main() {

  PrizeMoneyModel prizeMoneyModel = PrizeMoneyModel();

  test('Should be a subclass of PrizeMoneyEntity',
    () => expect(prizeMoneyModel, isA<PrizeMoneyEntity>())
  );

  group('fromJson', () {
    test('Should return a PrizeMoneyModel from a JSON', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(prizeMoneyJson));
      final result = PrizeMoneyModel.fromJson(json);
      expect(result, isA<PrizeMoneyModel>());
    });
  });

}
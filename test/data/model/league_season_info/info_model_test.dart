import 'dart:convert';

import 'package:esports_league_endpoint/data/data.dart';
import 'package:esports_league_endpoint/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../fixtures/json_file_name.dart';

void main() {

  InfoModel infoModel = InfoModel(
    id: 1
  );

  test('Should be a subclass of SportEntity',
    () => expect(infoModel, isA<InfoEntity>())
  );

  group('fromJson', () {
    test('Should return a InfoModel from a JSON', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(infoJson));
      final result = InfoModel.fromJson(json);
      expect(result, isA<InfoModel>());
    });

    test('Should contain a value in the InfoModel id field', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(infoJson));
      final result = InfoModel.fromJson(json);
      expect(result.id, isNotNull);
    });

    test('Should contain a PrizeMoneyModel from InfoModel JSON', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(infoJson));
      final result = InfoModel.fromJson(json);
      expect(result.totalPrizeMoneyRaw, isA<PrizeMoneyModel>());
    });

    test('Should contain a TeamModel from InfoModel JSON', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(infoJson));
      final result = InfoModel.fromJson(json);
      expect(result.winner, isA<TeamModel>());
    });
  });

}
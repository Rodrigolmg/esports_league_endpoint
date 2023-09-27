import 'dart:convert';

import 'package:esports_league_endpoint/data/data.dart';
import 'package:esports_league_endpoint/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture_reader.dart';
import '../../fixtures/json_file_name.dart';

void main(){

  SeasonModel seasonModel = SeasonModel(id: 1);

  test('Should be a subclass of SeasonEntity',
      () => expect(seasonModel, isA<SeasonEntity>())
  );

  group('fromJson', () {
    test('Should return a CategoryModel from a JSON', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(seasonJson));
      final result = SeasonModel.fromJson(json);
      expect(result, isA<SeasonModel>());
    });

    test('Should contain a value in the id field', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(seasonJson));
      final result = SeasonModel.fromJson(json);
      expect(result.id, isNotNull);
    });
  });
}
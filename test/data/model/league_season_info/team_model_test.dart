import 'dart:convert';

import 'package:esports_league_endpoint/data/data.dart';
import 'package:esports_league_endpoint/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../fixtures/json_file_name.dart';

void main() {

  TeamModel teamModel = TeamModel(
    id: 1
  );

  test('Should be a subclass of TeamEntity',
    () => expect(teamModel, isA<TeamEntity>())
  );

  group('fromJson', () {

    test('Should return a TeamModel from a JSON', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(teamJson));
      final result = TeamModel.fromJson(json);
      expect(result, isA<TeamModel>());
    });

    test('Should contain a value in the TeamModel id field', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(teamJson));
      final result = TeamModel.fromJson(json);
      expect(result.id, isNotNull);
    });

    test('Should contain a SportModel from a JSON', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(teamJson));
      final result = TeamModel.fromJson(json);
      expect(result.sport, isA<SportModel>());
    });

    test('Should contain a ColorModel from a JSON', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(teamJson));
      final result = TeamModel.fromJson(json);
      expect(result.teamColors, isA<ColorModel>());
    });


  });
}
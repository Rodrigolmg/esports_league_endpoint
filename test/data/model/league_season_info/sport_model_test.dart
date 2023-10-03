import 'dart:convert';

import 'package:esports_league_endpoint/data/data.dart';
import 'package:esports_league_endpoint/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../fixtures/json_file_name.dart';

void main(){
  SportModel sportModel = SportModel(
    id: 2
  );

  test('Should be a subclass of SportEntity',
      () => expect(sportModel, isA<SportEntity>())
  );

  group('fromJson', () {
    test('Should return a SportModel from a JSON', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(sportJson));
      final result = SportModel.fromJson(json);
      expect(result, isA<SportModel>());
    });

    test('Should contain a value in the SportModel id field', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(sportJson));
      final result = SportModel.fromJson(json);
      expect(result.id, isNotNull);
    });
  });
}
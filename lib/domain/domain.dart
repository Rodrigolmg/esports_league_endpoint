library domain;

import 'package:esports_league_endpoint/core/core.dart';
import 'package:hive/hive.dart';
import 'package:dartz/dartz.dart';

// entity
part 'entity/season_entity.dart';

// repository
part 'repository/league_season_repository.dart';

// usecase
part 'usecase/get_league_seasons_usecase.dart';
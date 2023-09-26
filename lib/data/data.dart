library data;

import 'package:dartz/dartz.dart';
import 'package:esports_league_endpoint/core/core.dart';
import 'package:esports_league_endpoint/domain/domain.dart';

// repository
part 'repository/league_season_repository_impl.dart';

// model
part 'model/season_model.dart';

// remote datasource
part 'datasource/remote/league_season_datasource.dart';

// local datasource
part 'datasource/local/league_season_local_datasource.dart';
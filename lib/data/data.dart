library data;

import 'package:dartz/dartz.dart';
import 'package:esports_league_endpoint/core/core.dart';
import 'package:esports_league_endpoint/domain/domain.dart';
import 'package:dio/dio.dart';
import 'package:esports_http_api/esports_http_api.dart';
import 'package:hive/hive.dart';

// repository
part 'repository/league_season_repository_impl.dart';

/// model
part 'model/season_model.dart';

// league season info model
part 'model/league_season_info/color_model.dart';
part 'model/league_season_info/sport_model.dart';
part 'model/league_season_info/team_model.dart';
part 'model/league_season_info/prize_money_model.dart';
part 'model/league_season_info/info_model.dart';

/// datasource

// remote datasource
part 'datasource/remote/league_season_datasource.dart';

// local datasource
part 'datasource/local/league_season_local_datasource.dart';

// util datasource
part 'datasource/url_path.dart';
part 'datasource/datasource_box_name.dart';
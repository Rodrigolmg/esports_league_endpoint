part of data;

abstract class LeagueSeasonLocalDataSource {
  Future<List<SeasonModel>?> getLastLeagueSeasons(int? tournamentId);
  Future<void> cacheLeagueSeasons(List<SeasonModel>? seasons);
}

class LeagueSeasonLocalDataSourceImpl implements LeagueSeasonLocalDataSource {
  @override
  Future<void> cacheLeagueSeasons(List<SeasonModel>? seasons) {
    // TODO: implement cacheLeagueSeasons
    throw UnimplementedError();
  }

  @override
  Future<List<SeasonModel>?> getLastLeagueSeasons(int? tournamentId) {
    // TODO: implement getLastLeagueSeasons
    throw UnimplementedError();
  }

}
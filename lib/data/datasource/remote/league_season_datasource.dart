part of data;

abstract class LeagueSeasonDataSource {
  Future<List<SeasonModel>?> getLeagueSeasons(int? tournamentId);
}

class LeagueSeasonDataSourceImpl implements LeagueSeasonDataSource {

  @override
  Future<List<SeasonModel>?> getLeagueSeasons(int? tournamentId) {
    // TODO: implement getLeagueSeasons
    throw UnimplementedError();
  }


}
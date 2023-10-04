part of data;

abstract class LeagueSeasonInfoDataSource {
  Future<InfoModel> getSeasonInfo(int? tournamentId);
}

class LeagueSeasonInfoDataSourceImpl implements LeagueSeasonInfoDataSource {
  @override
  Future<InfoModel> getSeasonInfo(int? tournamentId) {
    // TODO: implement getSeasonInfo
    throw UnimplementedError();
  }


}
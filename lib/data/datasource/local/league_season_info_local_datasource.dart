part of data;

abstract class LeagueSeasonInfoLocalDataSource {
  Future<InfoModel?> getLastSeasonInfo();
  Future<void> cacheSeasonInfo(InfoModel seasonInfo);
}

class LeagueSeasonInfoLocalDataSourceImpl implements LeagueSeasonInfoLocalDataSource {
  @override
  Future<void> cacheSeasonInfo(InfoModel seasonInfo) {
    // TODO: implement cacheSeasonInfo
    throw UnimplementedError();
  }

  @override
  Future<InfoModel?> getLastSeasonInfo() {
    // TODO: implement getLastSeasonInfo
    throw UnimplementedError();
  }

}
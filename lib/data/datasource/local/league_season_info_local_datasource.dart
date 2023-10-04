part of data;

abstract class LeagueSeasonInfoLocalDataSource {
  Future<InfoModel?> getLastSeasonInfo();
  Future<void> cacheSeasonInfo(InfoModel seasonInfo);
}

class LeagueSeasonInfoLocalDataSourceImpl implements LeagueSeasonInfoLocalDataSource {
  @override
  Future<void> cacheSeasonInfo(InfoModel seasonInfo) async {
    Box leagueSeasonInfoBox = Hive.box(DataSourceBoxName.leagueSeasonInfoBox);

    if(!leagueSeasonInfoBox.isOpen){
      leagueSeasonInfoBox = await Hive.openBox(
          DataSourceBoxName.leagueSeasonInfoBox);
    }

    leagueSeasonInfoBox.add(seasonInfo);
  }

  @override
  Future<InfoModel?> getLastSeasonInfo() async {
    Box<InfoModel> leagueSeasonInfoBox = Hive.box(
        DataSourceBoxName.leagueSeasonInfoBox);

    if(!leagueSeasonInfoBox.isOpen){
      leagueSeasonInfoBox = await Hive.openBox(
          DataSourceBoxName.leagueSeasonInfoBox);
    }

    int lastIndex = leagueSeasonInfoBox.length - 1;

    InfoModel? lastTeamDetail
      = leagueSeasonInfoBox.getAt(lastIndex);

    return lastTeamDetail;
  }

}
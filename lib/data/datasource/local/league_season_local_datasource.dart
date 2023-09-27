part of data;

abstract class LeagueSeasonLocalDataSource {
  Future<List<SeasonModel>?> getLastLeagueSeasons();
  Future<void> cacheLeagueSeasons(List<SeasonModel>? seasons);
}

class LeagueSeasonLocalDataSourceImpl implements LeagueSeasonLocalDataSource {
  @override
  Future<void> cacheLeagueSeasons(List<SeasonModel>? seasons) async {
    Box leagueSeasonBox = Hive.box(DataSourceBoxName.leagueSeasonBox);

    if(!leagueSeasonBox.isOpen){
      leagueSeasonBox = await Hive.openBox(DataSourceBoxName.leagueSeasonBox);
    }

    leagueSeasonBox.add(seasons);
  }

  @override
  Future<List<SeasonModel>?> getLastLeagueSeasons() async {
    Box<List<SeasonModel>> leagueSeasonBox = Hive.box(DataSourceBoxName.leagueSeasonBox);

    if(!leagueSeasonBox.isOpen){
      leagueSeasonBox = await Hive.openBox(DataSourceBoxName.leagueSeasonBox);
    }

    int lastIndex = leagueSeasonBox.length - 1;

    List<SeasonModel>? lastTeamDetail
      = leagueSeasonBox.getAt(lastIndex);
    return lastTeamDetail;
  }

}
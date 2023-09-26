part of data;

abstract class LeagueSeasonDataSource {
  Future<List<SeasonModel>?> getLeagueSeasons(int? tournamentId);
}

class LeagueSeasonDataSourceImpl implements LeagueSeasonDataSource {

  final DioMethod dio;

  const LeagueSeasonDataSourceImpl({
    required this.dio,
  });

  @override
  Future<List<SeasonModel>?> getLeagueSeasons(int? tournamentId) async {
    Response response = await dio.getMethod(UrlPath.leagueSeasonPath(tournamentId));
    if(response.statusCode != null && response.statusCode == 200){
      if((response.data as Map<String, dynamic>).isEmpty){
        throw ServerException(statusCode: 204);
      }

      List<dynamic>? seasons = response.data['seasons'];

      if(seasons == null || seasons.isEmpty){
        throw ServerException(statusCode: 204);
      }

      List<SeasonModel> leagueSeasons = seasons
          .map((e) => SeasonModel.fromJson(e)).toList();

      return Future.value(leagueSeasons);
    } else {
      throw ServerException(statusCode: response.statusCode);
    }
  }
}
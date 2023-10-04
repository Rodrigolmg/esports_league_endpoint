part of data;

abstract class LeagueSeasonInfoDataSource {
  Future<InfoModel> getSeasonInfo(int? tournamentId, int? seasonId);
}

class LeagueSeasonInfoDataSourceImpl implements LeagueSeasonInfoDataSource {

  final DioMethod dio;

  const LeagueSeasonInfoDataSourceImpl({
    required this.dio,
  });

  @override
  Future<InfoModel> getSeasonInfo(int? tournamentId, int? seasonId) async {
    Response response = await dio.getMethod(
      UrlPath.leagueSeasonInfoPath(tournamentId, seasonId)
    );

    if(response.statusCode != null && response.statusCode == 200){
      if((response.data as Map<String, dynamic>).isEmpty){
        throw ServerException(statusCode: 204);
      }

      InfoModel? info = InfoModel.fromJson(response.data['info']);

      return Future.value(info);
    } else {
      throw ServerException(statusCode: response.statusCode);
    }
  }
}
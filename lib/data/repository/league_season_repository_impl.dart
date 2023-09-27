part of data;

class LeagueSeasonRepositoryImpl implements LeagueSeasonRepository {
  final LeagueSeasonDataSource remoteDataSource;
  final LeagueSeasonLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  const LeagueSeasonRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo
  });

  @override
  Future<Either<Failure, List<SeasonEntity>?>> getLeagueSeason(int? tournamentId) async {
    if(await networkInfo.isConnected){
      try {
        List<SeasonModel>? leagueSeasons =
          await remoteDataSource.getLeagueSeasons(tournamentId);
        localDataSource.cacheLeagueSeasons(leagueSeasons);

        return Right(leagueSeasons);

      } on ServerException catch(sE) {
        return Left(ServerFailure(statusCode: sE.statusCode));
      }
    } else {
      try {
        List<SeasonModel>? lastLeagueSeasons =
          await localDataSource.getLastLeagueSeasons();

        if(lastLeagueSeasons == null) {
          return Left(CacheFailure());
        }

        return Right(lastLeagueSeasons);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
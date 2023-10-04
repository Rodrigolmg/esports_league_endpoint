part of data;

class LeagueSeasonInfoRepositoryImpl implements LeagueSeasonInfoRepository {

  final LeagueSeasonInfoDataSource remoteDataSource;
  final LeagueSeasonInfoLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  const LeagueSeasonInfoRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo
  });

  @override
  Future<Either<Failure, InfoEntity>> getSeasonInfo(int? tournamentId) async {
    if(await networkInfo.isConnected){
      try {
        InfoModel info = await remoteDataSource.getSeasonInfo(tournamentId);
        localDataSource.cacheSeasonInfo(info);

        return Right(info);

      } on ServerException catch(sE) {
        return Left(ServerFailure(statusCode: sE.statusCode));
      }
    } else {
      try {
        InfoModel? lastInfo =
          await localDataSource.getLastSeasonInfo();

        if(lastInfo == null) {
          return Left(CacheFailure());
        }

        return Right(lastInfo);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
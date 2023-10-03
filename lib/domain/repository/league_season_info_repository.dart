part of domain;

abstract class LeagueSeasonInfoRepository {
  Future<Either<Failure, InfoEntity>> getSeasonInfo(int? tournamentId);
}
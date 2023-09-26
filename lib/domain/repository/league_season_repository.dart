part of domain;

abstract class LeagueSeasonRepository {
  Future<Either<Failure, List<SeasonEntity>?>> getLeagueSeason(int? tournamentId);
}
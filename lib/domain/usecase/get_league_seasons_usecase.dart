part of domain;

class GetLeagueSeasonsUseCase implements UseCase<List<SeasonEntity>?, int?> {

    final LeagueSeasonRepository repository;

    const GetLeagueSeasonsUseCase({
      required this.repository
    });

  @override
  Future<Either<Failure, List<SeasonEntity>?>> call([int? tournamentId]) {
    return repository.getLeagueSeason(tournamentId);
  }

}
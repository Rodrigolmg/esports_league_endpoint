part of domain;

class GetLeagueSeasonInfoUseCase implements UseCase<InfoEntity,int?> {

    final LeagueSeasonInfoRepository repository;

    const GetLeagueSeasonInfoUseCase({
      required this.repository
    });

  @override
  Future<Either<Failure, InfoEntity>> call([int? tournamentId]) {
    return repository.getSeasonInfo(tournamentId);
  }


}
import 'package:dartz/dartz.dart';
import 'package:esports_league_endpoint/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<LeagueSeasonRepository>()])
import 'get_league_seasons_usecase_test.mocks.dart';

void main(){

  late GetLeagueSeasonsUseCase useCase;
  late MockLeagueSeasonRepository mockRepository;

  setUp(() {
    mockRepository = MockLeagueSeasonRepository();
    useCase = GetLeagueSeasonsUseCase(repository: mockRepository);
  });

  const int tTournamentId = 1;

  List<SeasonEntity> leagueSeasons = [
    SeasonEntity(id: 1),
    SeasonEntity(id: 2),
    SeasonEntity(id: 3),
  ];

  test('Should get Right value', () async {

    when(mockRepository.getLeagueSeason(any))
        .thenAnswer((_) async => Right(leagueSeasons));

    final result = await useCase(tTournamentId);

    expect(result, Right(leagueSeasons));
    verify(mockRepository.getLeagueSeason(tTournamentId));
    verifyNoMoreInteractions(mockRepository);
  });

}
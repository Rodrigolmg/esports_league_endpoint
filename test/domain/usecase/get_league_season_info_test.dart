import 'package:dartz/dartz.dart';
import 'package:esports_league_endpoint/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<LeagueSeasonInfoRepository>()])
import 'get_league_season_info_test.mocks.dart';

void main(){

  late GetLeagueSeasonInfoUseCase useCase;
  late MockLeagueSeasonInfoRepository mockRepository;

  setUp(() {
    mockRepository = MockLeagueSeasonInfoRepository();
    useCase = GetLeagueSeasonInfoUseCase(repository: mockRepository);
  });

  const int tTournamentId = 1;

  InfoEntity tInfo = InfoEntity(id: 1);

  test('Should get Right value', () async {

    when(mockRepository.getSeasonInfo(any))
        .thenAnswer((_) async => Right(tInfo));

    final result = await useCase(tTournamentId);

    expect(result, Right(tInfo));
    verify(mockRepository.getSeasonInfo(tTournamentId));
    verifyNoMoreInteractions(mockRepository);
  });
}
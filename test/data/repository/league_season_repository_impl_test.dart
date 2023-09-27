import 'package:dartz/dartz.dart';
import 'package:esports_league_endpoint/core/core.dart';
import 'package:esports_league_endpoint/data/data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<LeagueSeasonDataSource>(),
  MockSpec<LeagueSeasonLocalDataSource>(),
  MockSpec<NetworkInfo>(),
])
import 'league_season_repository_impl_test.mocks.dart';

void main() {
  late LeagueSeasonRepositoryImpl repositoryImpl;
  late MockLeagueSeasonDataSource mockRemoteDataSource;
  late MockLeagueSeasonLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockLeagueSeasonDataSource();
    mockLocalDataSource = MockLeagueSeasonLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = LeagueSeasonRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo);
  });

  const int tTournamentId = 1;

  List<SeasonModel> leagueSeasons = [
    SeasonModel(id: 1),
    SeasonModel(id: 2),
    SeasonModel(id: 3),
  ];

  test('Should check if the device is online', () async {
    when(mockNetworkInfo.isConnected)
        .thenAnswer((_) async => true);

    repositoryImpl.getLeagueSeason(tTournamentId);
    verify(mockNetworkInfo.isConnected);

  });

  group('Device is online', () {
    setUp((){
      when(mockNetworkInfo.isConnected)
          .thenAnswer((_) async => true);
    });

    test('Should return remote data when the remote call is successfull', () async {

      when(mockRemoteDataSource.getLeagueSeasons(any))
          .thenAnswer((_) async => leagueSeasons);

      final result = await repositoryImpl.getLeagueSeason(tTournamentId);

      verify(mockRemoteDataSource.getLeagueSeasons(tTournamentId));
      expect(result, equals(Right(leagueSeasons)));

    });

    test('Should cache data locally when the remote call is successfull', () async {

      when(mockRemoteDataSource.getLeagueSeasons(any))
          .thenAnswer((_) async => leagueSeasons);

      await repositoryImpl.getLeagueSeason(tTournamentId);

      verify(mockRemoteDataSource.getLeagueSeasons(tTournamentId));
      verify(mockLocalDataSource.cacheLeagueSeasons(leagueSeasons));

    });

    test('Should return server failure when remote call is unsuccessfull', () async {

      when(mockRemoteDataSource.getLeagueSeasons(any))
          .thenThrow(ServerException());

      final result = await repositoryImpl.getLeagueSeason(tTournamentId);

      verify(mockRemoteDataSource.getLeagueSeasons(tTournamentId));
      verifyZeroInteractions(mockLocalDataSource);
      expect(result, equals(const Left(ServerFailure())));
    });
  });

  group('Device is offline', () {
    setUp((){
      when(mockNetworkInfo.isConnected)
          .thenAnswer((_) async => false);
    });

    test('Should return last locally cached data when the cached data is present',
            () async {
          when(mockLocalDataSource.getLastLeagueSeasons())
              .thenAnswer((_) async => leagueSeasons);

          final result = await repositoryImpl.getLeagueSeason(tTournamentId);

          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastLeagueSeasons());
          expect(result, equals(Right(leagueSeasons)));
        });

    test('Should return CacheFailure when there is no cached data',
        () async {
      when(mockLocalDataSource.getLastLeagueSeasons())
          .thenThrow(CacheException());

      final result = await repositoryImpl.getLeagueSeason(tTournamentId);

      verifyZeroInteractions(mockRemoteDataSource);
      verify(mockLocalDataSource.getLastLeagueSeasons());
      expect(result, equals(Left(CacheFailure())));
    });
  });
}

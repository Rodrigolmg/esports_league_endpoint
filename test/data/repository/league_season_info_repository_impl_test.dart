import 'package:dartz/dartz.dart';
import 'package:esports_league_endpoint/core/core.dart';
import 'package:esports_league_endpoint/data/data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<LeagueSeasonInfoDataSource>(),
  MockSpec<LeagueSeasonInfoLocalDataSource>(),
  MockSpec<NetworkInfo>(),
])
import 'league_season_info_repository_impl_test.mocks.dart';

void main(){

  late LeagueSeasonInfoRepositoryImpl repositoryImpl;
  late MockLeagueSeasonInfoDataSource mockRemoteDataSource;
  late MockLeagueSeasonInfoLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockLeagueSeasonInfoDataSource();
    mockLocalDataSource = MockLeagueSeasonInfoLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = LeagueSeasonInfoRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo
    );
  });

  const int tTournamentId = 1;

  InfoModel tInfo = InfoModel(id: 1);

  test('Should check if the device is online', () async {
    when(mockNetworkInfo.isConnected)
        .thenAnswer((_) async => true);

    repositoryImpl.getSeasonInfo(tTournamentId);
    verify(mockNetworkInfo.isConnected);

  });

  group('Device is online', () {
    setUp((){
      when(mockNetworkInfo.isConnected)
          .thenAnswer((_) async => true);
    });

    test('Should return remote data when the remote call is successfull', () async {

      when(mockRemoteDataSource.getSeasonInfo(any))
          .thenAnswer((_) async => tInfo);

      final result = await repositoryImpl.getSeasonInfo(tTournamentId);

      verify(mockRemoteDataSource.getSeasonInfo(tTournamentId));
      expect(result, equals(Right(tInfo)));

    });

    test('Should cache data locally when the remote call is successfull', () async {

      when(mockRemoteDataSource.getSeasonInfo(any))
          .thenAnswer((_) async => tInfo);

      await repositoryImpl.getSeasonInfo(tTournamentId);

      verify(mockRemoteDataSource.getSeasonInfo(tTournamentId));
      verify(mockLocalDataSource.cacheSeasonInfo(tInfo));

    });

    test('Should return server failure when remote call is unsuccessfull', () async {

      when(mockRemoteDataSource.getSeasonInfo(any))
          .thenThrow(ServerException());

      final result = await repositoryImpl.getSeasonInfo(tTournamentId);

      verify(mockRemoteDataSource.getSeasonInfo(tTournamentId));
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
          when(mockLocalDataSource.getLastSeasonInfo())
              .thenAnswer((_) async => tInfo);

          final result = await repositoryImpl.getSeasonInfo(tTournamentId);

          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastSeasonInfo());
          expect(result, equals(Right(tInfo)));
        });

    test('Should return CacheFailure when there is no cached data',
            () async {
          when(mockLocalDataSource.getLastSeasonInfo())
              .thenThrow(CacheException());

          final result = await repositoryImpl.getSeasonInfo(tTournamentId);

          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastSeasonInfo());
          expect(result, equals(Left(CacheFailure())));
        });
  });
}
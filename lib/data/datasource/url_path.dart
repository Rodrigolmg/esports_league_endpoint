part of data;

class UrlPath {
  static String leagueSeasonPath(int? tournamentId)
    => 'tournament/$tournamentId/seasons';
  static String leagueSeasonInfoPath(int? tournamentId, int? seasonId)
    => 'tournament/$tournamentId/season/$seasonId/info';
  static String leagueDetailPath(int? tournamentId)
  => 'tournament/$tournamentId';
}
part of data;

class UrlPath {
  static String leagueSeasonPath(int? tournamentId)
    => 'tournament/$tournamentId/seasons';
}
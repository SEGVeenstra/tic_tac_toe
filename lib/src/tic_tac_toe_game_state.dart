enum Players { p1, p2 }

enum TicTacToeStatus { p1Turn, p2Turn, draw, p1Won, p2Won }

class TicTacToeGameState {
  final List<Players?> fields;

  TicTacToeGameState(
      {this.fields = const [
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null
      ]});

  /// Get the current game status
  TicTacToeStatus get status {
    final countP1 = fields.where((f) => f == Players.p1).length;
    final countP2 = fields.where((f) => f == Players.p2).length;

    if (hasWon(Players.p1)) return TicTacToeStatus.p1Won;
    if (hasWon(Players.p2)) return TicTacToeStatus.p2Won;

    if (countP1 + countP2 == 9) return TicTacToeStatus.draw;

    if (countP1 == countP2) return TicTacToeStatus.p1Turn;
    return TicTacToeStatus.p2Turn;
  }

  bool hasWon(Players player) {
    if (fields[0] == player && fields[1] == player && fields[2] == player ||
        fields[3] == player && fields[4] == player && fields[5] == player ||
        fields[6] == player && fields[7] == player && fields[8] == player ||
        fields[0] == player && fields[3] == player && fields[6] == player ||
        fields[1] == player && fields[4] == player && fields[7] == player ||
        fields[2] == player && fields[5] == player && fields[8] == player ||
        fields[0] == player && fields[4] == player && fields[8] == player ||
        fields[2] == player && fields[4] == player && fields[6] == player) {
      return true;
    }
    return false;
  }

  /// Do a move
  void doMove(Players player, int field) {}
}

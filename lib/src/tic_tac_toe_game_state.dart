/// The Players for the Tic Tac Toe game.
enum Player { p1, p2 }

/// The states the game can be in.
enum Status { p1Turn, p2Turn, p1Won, p2Won, draw }

/// The state of a Tic Tac Toe Game
class TicTacToeGameState {
  /// Gets the [fields] with the info about which [Player] claimed it.
  List<Player?> get fields =>
      [null, null, null, null, null, null, null, null, null];

  /// Returns the [Status] of the game
  Status get status => Status.p1Turn;
}

import 'package:meta/meta.dart';

/// The Players for the Tic Tac Toe game.
enum Player { p1, p2 }

/// The states the game can be in.
enum Status { p1Turn, p2Turn, p1Won, p2Won, draw }

/// The state of a Tic Tac Toe Game
class TicTacToeGameState {
  final List<Player?> _fields;

  /// Gets the [fields] with the info about which [Player] claimed it.
  List<Player?> get fields => List.from(_fields);

  /// Returns the [Status] of the game
  Status get status {
    if (_hasThreeInARow(Player.p1)) return Status.p1Won;
    if (_hasThreeInARow(Player.p2)) return Status.p2Won;

    final occupiedFields = _fields.where((field) => field != null);

    if (occupiedFields.length == 9) return Status.draw;

    final hasEvenAmountOfOccupiedFields = occupiedFields.length % 2 == 0;

    return hasEvenAmountOfOccupiedFields ? Status.p1Turn : Status.p2Turn;
  }

  TicTacToeGameState()
      : _fields = [null, null, null, null, null, null, null, null, null];

  @visibleForTesting
  TicTacToeGameState.seed(this._fields);

  bool _hasThreeInARow(Player player) {
    if (_fields[0] == player && _fields[1] == player && _fields[2] == player ||
        _fields[3] == player && _fields[4] == player && _fields[5] == player ||
        _fields[6] == player && _fields[7] == player && _fields[8] == player ||
        _fields[0] == player && _fields[3] == player && _fields[6] == player ||
        _fields[1] == player && _fields[4] == player && _fields[7] == player ||
        _fields[2] == player && _fields[5] == player && _fields[8] == player ||
        _fields[0] == player && _fields[4] == player && _fields[8] == player ||
        _fields[2] == player && _fields[4] == player && _fields[6] == player) {
      return true;
    }
    return false;
  }
}

import 'package:meta/meta.dart';
import 'package:tic_tac_toe_game/src/invalid_claim_exception.dart';

import 'player.dart';
import 'status.dart';

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

  TicTacToeGameState claimField(int field) {
    if (field < 0 || field > 8 || _fields[field] != null) {
      throw InvalidClaimException();
    }
    if (status != Status.p1Turn && status != Status.p2Turn) {
      throw InvalidClaimException();
    }
    final newFields = fields;
    newFields[field] = status == Status.p1Turn ? Player.p1 : Player.p2;

    return TicTacToeGameState.seed(newFields);
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

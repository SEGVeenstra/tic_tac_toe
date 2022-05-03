import 'package:equatable/equatable.dart';

enum Players { p1, p2 }

enum TicTacToeStatus { p1Turn, p2Turn, draw, p1Won, p2Won }

class InvalidMoveException with EquatableMixin implements Exception {
  final String message;
  final TicTacToeGameState state;

  const InvalidMoveException({
    required this.message,
    required this.state,
  });

  @override
  List<Object?> get props => [message, state];
}

class TicTacToeGameState with EquatableMixin {
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
  TicTacToeGameState doMove(Players player, int field) {
    if (status != Players.p1 && player == Players.p1) {
      throw InvalidMoveException(
        message: 'P1 tried to make a move, but it\'s not P1\'s turn.',
        state: this,
      );
    }
    if (status != Players.p2 && player == Players.p2) {
      throw InvalidMoveException(
        message: 'P2 tried to make a move, but it\'s not P2\'s turn.',
        state: this,
      );
    }

    final newFields = List.of(fields);
    newFields[field] = player;
    return TicTacToeGameState(fields: newFields);
  }

  @override
  List<Object?> get props => [fields];
}

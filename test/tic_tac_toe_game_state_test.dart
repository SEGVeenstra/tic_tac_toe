import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:tic_tac_toe_game/tic_tac_toe_game.dart';

void main() {
  group(
    'constructor',
    () {
      test('should return initial state', () {
        final TicTacToeGameState state = TicTacToeGameState();

        expect(state.fields,
            equals([null, null, null, null, null, null, null, null, null]));
        expect(state.status, Status.p1Turn);
      });
    },
  );
}

import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:tic_tac_toe_game/tic_tac_toe_game.dart';

void main() {
  group(
    'constructor',
    () {
      test('should return initial state', () {
        final state = TicTacToeGameState();

        expect(state.fields,
            equals([null, null, null, null, null, null, null, null, null]));
        expect(state.status, Status.p1Turn);
      });
    },
  );

  group(
    'fields',
    () {
      test(
        'updating retrieved fields should not update internal state',
        () {
          final state = TicTacToeGameState();

          state.fields[0] = Player.p1;

          expect(state.fields,
              [null, null, null, null, null, null, null, null, null]);
        },
      );
    },
  );

  group(
    'status',
    () {
      final testCases = <String, Status>{
        // Turns
        'OO-|XOX|-X-': Status.p1Turn,
        'X-X|---|--O': Status.p2Turn,
        // Draw
        'XOX|XOX|OXO': Status.draw,
        // Win states player 1
        'XXX|OO-|---': Status.p1Won,
        'X-O|XXX|O-O': Status.p1Won,
        '---|O-O|XXX': Status.p1Won,
        'X--|X-O|X-O': Status.p1Won,
        '-X-|-XO|-XO': Status.p1Won,
        '--X|-OX|-OX': Status.p1Won,
        'X-O|-XO|--X': Status.p1Won,
        'O-X|-XO|X--': Status.p1Won,
        // Win states player 2
        'OOO|XX-|-X-': Status.p2Won,
        'X-X|OOO|-X-': Status.p2Won,
        'X-X|--X|OOO': Status.p2Won,
        'O--|O-X|OXX': Status.p2Won,
        '-O-|-OX|XOX': Status.p2Won,
        '--O|-XO|XXO': Status.p2Won,
        'O-X|-O-|XXO': Status.p2Won,
        'X-O|-O-|OXX': Status.p2Won,
      };

      testCases.forEach(
        (state, status) => test(
          '$state should result in $status',
          () {
            expect(state.asTicTacToeGameState.status, status);
          },
        ),
      );
    },
  );

  group(
    'claimField',
    () {
      group(
        'invalid claims',
        () {
          final testCases = <String, int>{
            'XOX|XOX|OXO': 0,
            'X-O|XXX|O-O': 1,
            '--O|-XO|XXO': 0,
            'X-O|XXX|OO-': -1,
            '-XO|XXX|OO-': 10,
            '---|-X-|---': 4,
          };

          testCases.forEach(
            (state, field) {
              test(
                'calling claimField with $field on $state should throw InvalidClaimException',
                () {
                  expect(
                    () => state.asTicTacToeGameState.claimField(field),
                    throwsA(isA<InvalidClaimException>()),
                  );
                },
              );
            },
          );
        },
      );

      group(
        'successfull claims',
        () {
          final testCases = [
            _ClaimTestCase(
                initial: '---|---|---', field: 4, expected: '---|-X-|---'),
            _ClaimTestCase(
                initial: '-OO|-X-|XXO', field: 0, expected: 'XOO|-X-|XXO'),
            _ClaimTestCase(
                initial: 'XOO|-X-|XXO', field: 5, expected: 'XOO|-XO|XXO'),
          ];

          for (var testCase in testCases) {
            final start = testCase.initial;
            final field = testCase.field;
            final end = testCase.expected;

            test(
              'claiming $field on $start should result in $end',
              () {
                final startState = start.asTicTacToeGameState;
                final expectedState = end.asTicTacToeGameState;

                final actual = startState.claimField(field);

                expect(actual.fields, expectedState.fields);
                expect(actual.status, expectedState.status);
              },
            );
          }
        },
      );
    },
  );
}

class _ClaimTestCase {
  final String initial;
  final int field;
  final String expected;

  _ClaimTestCase({
    required this.initial,
    required this.field,
    required this.expected,
  });
}

extension on String {
  TicTacToeGameState get asTicTacToeGameState {
    final fields = replaceAll('|', '').split('').map((char) {
      switch (char) {
        case 'X':
          return Player.p1;
        case 'O':
          return Player.p2;
        default:
          null;
      }
    }).toList();
    return TicTacToeGameState.seed(fields);
  }
}

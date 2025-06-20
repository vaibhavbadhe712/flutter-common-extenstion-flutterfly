// test/flutter_common_extensions_test.dart
import 'package:flutter_common_extensions_flutterfly/flutter_common_extenstions.dart';
import 'package:test/test.dart';

void main() {
  group('String Extensions Tests', () {
    test('capitalizeFirst should capitalize first letter', () {
      expect('hello'.capitalizeFirst(), 'Hello');
      expect('HELLO'.capitalizeFirst(), 'Hello');
      expect(''.capitalizeFirst(), '');
    });

    test('titleCase should capitalize each word', () {
      expect('hello world'.titleCase, 'Hello World');
      expect('test case'.titleCase, 'Test Case');
    });

    test('isEmail should validate email', () {
      expect('test@email.com'.isEmail, true);
      expect('invalid-email'.isEmail, false);
    });

    test('isNumeric should check if string is numeric', () {
      expect('123'.isNumeric, true);
      expect('12.5'.isNumeric, true);
      expect('abc'.isNumeric, false);
    });

    test('truncate should limit string length', () {
      expect('hello world'.truncate(5), 'hello...');
      expect('hi'.truncate(5), 'hi');
    });

    test('removeWhitespace should remove all spaces', () {
      expect('hello world test'.removeWhitespace, 'helloworldtest');
    });
  });

  group('DateTime Extensions Tests', () {
    test('formatDate should format correctly', () {
      final date = DateTime(2025, 6, 20);
      expect(date.formatDate, '20/06/2025');
    });

    test('formatTime should format correctly', () {
      final time = DateTime(2025, 6, 20, 14, 30);
      expect(time.formatTime, '14:30');
    });

    test('isToday should check current date', () {
      final today = DateTime.now();
      expect(today.isToday, true);

      final yesterday = DateTime.now().subtract(const Duration(days: 1));
      expect(yesterday.isToday, false);
    });

    test('dayName should return correct day', () {
      final monday = DateTime(2025, 6, 16); // Monday
      expect(monday.dayName, 'Monday');
    });
  });

  group('List Extensions Tests', () {
    test('safeGet should return element or null', () {
      final list = [1, 2, 3];
      expect(list.safeGet(1), 2);
      expect(list.safeGet(10), null);
    });

    test('second and third should return correct elements', () {
      final list = ['a', 'b', 'c', 'd'];
      expect(list.second, 'b');
      expect(list.third, 'c');
    });

    test('unique should remove duplicates', () {
      final list = [1, 2, 2, 3, 3, 4];
      expect(list.unique, [1, 2, 3, 4]);
    });

    test('chunk should split list correctly', () {
      final list = [1, 2, 3, 4, 5, 6];
      final chunked = list.chunk(2);
      expect(chunked, [
        [1, 2],
        [3, 4],
        [5, 6]
      ]);
    });
  });

  group('Nullable Extensions Tests', () {
    test('nullable string extensions', () {
      String? nullString;
      expect(nullString.isNullOrEmpty, true);
      expect(nullString.orEmpty, '');

      String? nonNullString = 'hello';
      expect(nonNullString.isNotNullOrEmpty, true);
    });

    test('nullable list extensions', () {
      List<int>? nullList;
      expect(nullList.isNullOrEmpty, true);
      expect(nullList.orEmpty, []);
    });
  });

  group('Duration Extensions Tests', () {
    test('formatDuration should format correctly', () {
      final duration = Duration(hours: 2, minutes: 30, seconds: 45);
      expect(duration.formatDuration, '02:30:45');
    });

    test('humanReadable should format correctly', () {
      expect(Duration(days: 2).humanReadable, '2 days');
      expect(Duration(hours: 1).humanReadable, '1 hour');
      expect(Duration(minutes: 30).humanReadable, '30 minutes');
    });

    test('int to duration extensions', () {
      expect(5.seconds, Duration(seconds: 5));
      expect(10.minutes, Duration(minutes: 10));
      expect(2.hours, Duration(hours: 2));
    });
  });
}

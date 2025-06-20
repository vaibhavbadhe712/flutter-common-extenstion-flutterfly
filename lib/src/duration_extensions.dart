// lib/src/duration_extensions.dart

extension DurationExtensions on Duration {
  /// Formats duration to readable string
  String get formatDuration {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(inSeconds.remainder(60));
    return '${twoDigits(inHours)}:$twoDigitMinutes:$twoDigitSeconds';
  }

  /// Gets human readable format
  String get humanReadable {
    if (inDays > 0) {
      return '$inDays day${inDays == 1 ? '' : 's'}';
    } else if (inHours > 0) {
      return '$inHours hour${inHours == 1 ? '' : 's'}';
    } else if (inMinutes > 0) {
      return '$inMinutes minute${inMinutes == 1 ? '' : 's'}';
    } else {
      return '$inSeconds second${inSeconds == 1 ? '' : 's'}';
    }
  }

  /// Adds duration
  Duration operator +(Duration other) =>
      Duration(microseconds: inMicroseconds + other.inMicroseconds);

  /// Subtracts duration
  Duration operator -(Duration other) =>
      Duration(microseconds: inMicroseconds - other.inMicroseconds);

  /// Multiplies duration
  Duration operator *(num factor) =>
      Duration(microseconds: (inMicroseconds * factor).round());

  /// Delays execution
  Future<void> get delay => Future.delayed(this);
}

extension IntToDuration on int {
  Duration get milliseconds => Duration(milliseconds: this);
  Duration get seconds => Duration(seconds: this);
  Duration get minutes => Duration(minutes: this);
  Duration get hours => Duration(hours: this);
  Duration get days => Duration(days: this);
}

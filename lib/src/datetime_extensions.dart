import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  /// Formats date to dd/MM/yyyy
  String get formatDate => DateFormat('dd/MM/yyyy').format(this);

  /// Formats date to dd-MM-yyyy
  String get formatDateDash => DateFormat('dd-MM-yyyy').format(this);

  /// Formats date to yyyy-MM-dd
  String get formatDateISO => DateFormat('yyyy-MM-dd').format(this);

  /// Formats time to HH:mm
  String get formatTime => DateFormat('HH:mm').format(this);

  /// Formats time to h:mm a
  String get formatTime12 => DateFormat('h:mm a').format(this);

  /// Formats datetime to dd/MM/yyyy HH:mm
  String get formatDateTime => DateFormat('dd/MM/yyyy HH:mm').format(this);

  /// Formats datetime to dd/MM/yyyy h:mm a
  String get formatDateTime12 => DateFormat('dd/MM/yyyy h:mm a').format(this);

  /// Gets day name (Monday, Tuesday, etc.)
  String get dayName => DateFormat('EEEE').format(this);

  /// Gets short day name (Mon, Tue, etc.)
  String get dayNameShort => DateFormat('EEE').format(this);

  /// Gets month name (January, February, etc.)
  String get monthName => DateFormat('MMMM').format(this);

  /// Gets short month name (Jan, Feb, etc.)
  String get monthNameShort => DateFormat('MMM').format(this);

  /// Checks if date is today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Checks if date is yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// Checks if date is tomorrow
  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  /// Gets relative time (2 hours ago, 3 days ago, etc.)
  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }

  /// Gets start of day (00:00:00)
  DateTime get startOfDay => DateTime(year, month, day);

  /// Gets end of day (23:59:59)
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59);

  /// Gets start of month
  DateTime get startOfMonth => DateTime(year, month, 1);

  /// Gets end of month
  DateTime get endOfMonth => DateTime(year, month + 1, 0, 23, 59, 59);

  /// Adds business days (excludes weekends)
  DateTime addBusinessDays(int days) {
    DateTime result = this;
    int addedDays = 0;

    while (addedDays < days) {
      result = result.add(const Duration(days: 1));
      if (result.weekday != DateTime.saturday &&
          result.weekday != DateTime.sunday) {
        addedDays++;
      }
    }

    return result;
  }

  /// Checks if date is weekend
  bool get isWeekend =>
      weekday == DateTime.saturday || weekday == DateTime.sunday;

  /// Checks if date is weekday
  bool get isWeekday => !isWeekend;
}

extension NullableDateTimeExtensions on DateTime? {
  String get formatDateSafe => this?.formatDate ?? '--';
  String get formatTimeSafe => this?.formatTime ?? '--';
  String get formatDateTimeSafe => this?.formatDateTime ?? '--';
}

extension StringToDateTime on String {
  /// Safely parse string to DateTime
  DateTime? get toDateTime => DateTime.tryParse(this);

  /// Parse string to DateTime with fallback
  DateTime toDateTimeOrDefault([DateTime? defaultValue]) {
    return DateTime.tryParse(this) ?? defaultValue ?? DateTime.now();
  }
}

import 'package:intl/intl.dart';

extension FormattedDateTime on DateTime {
  String get formattedDateTime {
    return DateFormat('dd/MM/yyyy kk:mm').format(this);
  }

  String get formattedDate {
    return DateFormat('EEE, dd MMMM yyyy').format(this);
  }

  String get formattedDay {
    return DateFormat('dd').format(this);
  }

  String get formattedMonth {
    return DateFormat('MMM').format(this);
  }
}

extension FormattedDate on DateTime {
  String get formattedRequestedDate {
    return DateFormat('MM-dd-yyyy').format(this);
  }
}

extension FormattedTime on DateTime {
  String get formattedTime {
    return DateFormat('kk:mm').format(this);
  }
}

extension DateTimeAgo on DateTime {
  String timeAgo({bool numericDates = true}) {
    final date2 = DateTime.now();
    final difference = date2.difference(this);

    if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }
}

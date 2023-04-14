



RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
String Function(Match) mathFunc = (Match match) => '${match[1]},';

final timeRegex = RegExp(r'\s+(\d{1,2}:\d{2})\s+', multiLine: true);

extension StringExtension on String {
  String capitalize() {
    if (isNotEmpty) {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    }
    return this;
  }

  String addCommers() {
    return replaceAllMapped(reg, mathFunc);
  }

  String addAMOrPM() {
    int hour = int.parse(split(':').first);
    int min = int.parse(split(':').last);
    return '$hour:${min < 10 ? '0$min' : '$min'}${hour > 11 ? 'PM' : 'AM'}';
  }

  List<int> returnHourAndMin() {
    int hour = int.parse(split(':').first);
    int min = int.parse(split(':').last);
    return [hour, min];
  }

}

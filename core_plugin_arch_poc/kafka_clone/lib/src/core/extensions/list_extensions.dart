extension TrimSeconds on DateTime {
  DateTime trimMilliSeconds() =>
      DateTime(year, month, day, hour, minute, second, millisecond.short);
}

extension ShortInt on int {
  int get short => int.parse(
      toString().length > 3 ? '${toString().substring(0, 2)}...' : toString());
}

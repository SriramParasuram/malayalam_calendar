import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Notifier holding the "current" [DateTime] for the app.
///
/// Defaults to the real wall-clock time at startup but can be reassigned (e.g.
/// when the user navigates between months) via [setDate] / [today].
class CurrentDateTime extends Notifier<DateTime> {
  @override
  DateTime build() => DateTime.now();

  void setDate(DateTime value) => state = value;

  void today() => state = DateTime.now();
}

final currentDateTimeProvider =
    NotifierProvider<CurrentDateTime, DateTime>(CurrentDateTime.new);

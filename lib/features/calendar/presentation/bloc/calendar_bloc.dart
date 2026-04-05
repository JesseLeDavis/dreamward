import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/database/daos/calendar_dao.dart';

// ---------------------------------------------------------------------------
// Events
// ---------------------------------------------------------------------------

abstract class CalendarEvent {}

class LoadCalendarMonth extends CalendarEvent {
  LoadCalendarMonth(this.year, this.month);
  final int year;
  final int month;
}

// ---------------------------------------------------------------------------
// States
// ---------------------------------------------------------------------------

abstract class CalendarState {}

class CalendarInitial extends CalendarState {}

class CalendarLoading extends CalendarState {}

class CalendarLoaded extends CalendarState {
  CalendarLoaded(this.summaries);
  // Map from 'YYYY-MM-DD' date string to day summary
  final Map<String, CalendarDaySummary> summaries;
}

class CalendarError extends CalendarState {
  CalendarError(this.message);
  final String message;
}

// ---------------------------------------------------------------------------
// BLoC
// ---------------------------------------------------------------------------

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc(this._db) : super(CalendarInitial()) {
    on<LoadCalendarMonth>(_onLoadCalendarMonth);
  }

  final AppDatabase _db;

  Future<void> _onLoadCalendarMonth(
    LoadCalendarMonth event,
    Emitter<CalendarState> emit,
  ) async {
    emit(CalendarLoading());
    try {
      final startDate =
          '${event.year}-${event.month.toString().padLeft(2, '0')}-01';
      final lastDay = DateTime(event.year, event.month + 1, 0).day;
      final endDate =
          '${event.year}-${event.month.toString().padLeft(2, '0')}-${lastDay.toString().padLeft(2, '0')}';

      final list = await _db.calendarDao.getMonthSummary(startDate, endDate);
      final map = {for (final s in list) s.dateId: s};
      emit(CalendarLoaded(map));
    } catch (e) {
      emit(CalendarError(e.toString()));
    }
  }
}

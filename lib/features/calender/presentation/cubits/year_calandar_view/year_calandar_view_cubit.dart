import 'package:flutter_bloc/flutter_bloc.dart';

part 'year_calandar_view_state.dart';

class YearCalendarViewCubit extends Cubit<YearCalendarViewState> {
  YearCalendarViewCubit() : super(YearCalendarViewInitial());
  int year = DateTime.now().year;
  int month = DateTime.now().day;
  int day = DateTime.now().month;
  void updateCalendarView({int? year, int? month, int? day}) {
    this.year = year ?? this.year;
    this.month = month ?? this.month;
    this.day = day ?? this.day;
    emit(YearCalendarViewUpdate());
  }

  DateTime focusedDay() {
    return DateTime(year, month, day);
  }
}

import 'calendar_day.dart';

class MonthModel {
  String? year;
  String? month;
  String? monthName;
  List<CalendarDay>? calendarDays;

  MonthModel({this.year, this.month, this.monthName, this.calendarDays});

  @override
  String toString() {
    return 'MonthModel(year: $year, month: $month, monthName: $monthName, calendarDays: $calendarDays)';
  }

  factory MonthModel.fromJson(Map<String, dynamic> json) => MonthModel(
        year: json['year'] as String?,
        month: json['month'] as String?,
        monthName: json['monthName'] as String?,
        // calendarDays: (json['calendarDays'] as List<dynamic>?)
        //     ?.map((e) => CalendarDay.fromJson(e as Map<String, dynamic>))
        //     .toList(),
      );

  Map<String, dynamic> toJson() => {
        'year': year,
        'month': month,
        'monthName': monthName,
        'calendarDays': calendarDays?.map((e) => e.toJson()).toList(),
      };
}

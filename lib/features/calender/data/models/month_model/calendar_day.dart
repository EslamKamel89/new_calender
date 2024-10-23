class CalendarDay {
  String? gregorianDate;
  String? oldHijriDate;
  String? newHijriDate;
  bool? isToday;
  bool? isNewHijriMonth;

  CalendarDay({
    this.gregorianDate,
    this.oldHijriDate,
    this.newHijriDate,
    this.isToday,
    this.isNewHijriMonth,
  });

  @override
  String toString() {
    return 'CalendarDay(gregorianDate: $gregorianDate, oldHijriDate: $oldHijriDate, newHijriDate: $newHijriDate, isToday: $isToday, isNewHijriMonth: $isNewHijriMonth)';
  }

  factory CalendarDay.fromJson(Map<String, dynamic> json) => CalendarDay(
        gregorianDate: json['gregorianDate'] as String?,
        oldHijriDate: json['oldHijriDate'] as String?,
        newHijriDate: json['newHijriDate'] as String?,
        isToday: json['isToday'] as bool?,
        isNewHijriMonth: json['isNewHijriMonth'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'gregorianDate': gregorianDate,
        'oldHijriDate': oldHijriDate,
        'newHijriDate': newHijriDate,
        'isToday': isToday,
        'isNewHijriMonth': isNewHijriMonth,
      };
}

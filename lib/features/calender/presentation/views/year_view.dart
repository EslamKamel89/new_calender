import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_calender/core/widgets/default_scaffold.dart';
import 'package:new_calender/features/calender/presentation/cubits/get_month_data/get_month_data_cubit.dart';
import 'package:new_calender/features/calender/presentation/cubits/year_calandar_view/year_calandar_view_cubit.dart';
import 'package:new_calender/features/calender/presentation/widgets/button_group.dart';
import 'package:new_calender/features/calender/presentation/widgets/calendar_day_info.dart';
import 'package:new_calender/features/calender/presentation/widgets/month_dropdown.dart';
import 'package:new_calender/utils/colors/clr.dart';
import 'package:table_calendar/table_calendar.dart';

class YearCalendarView extends StatefulWidget {
  const YearCalendarView({super.key});

  @override
  State<YearCalendarView> createState() => _YearCalendarViewState();
}

class _YearCalendarViewState extends State<YearCalendarView> {
  late final TextEditingController textEditingController;
  late final YearCalendarViewCubit yearCalendarViewCubit;
  DateTime? _selectedDay;
  late final GetMonthDataCubit getMonthDateCubit;
  @override
  void initState() {
    yearCalendarViewCubit = context.read<YearCalendarViewCubit>();
    getMonthDateCubit = context.read<GetMonthDataCubit>();
    getMonthDateCubit.getMonthData();
    Future.delayed(const Duration(seconds: 10)).then((_) {
      getMonthDateCubit.getCalendarDay();
    });
    textEditingController = TextEditingController();
    textEditingController.text = DateTime.now().year.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var outlineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
    );
    // getMonthDateCubit.getCalendarDay(30);
    return DefaultScaffold(
      title: 'Full Year Hijri Calendar',
      child: BlocBuilder<YearCalendarViewCubit, YearCalendarViewState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 25.h),
              const ButtonGroup(),
              SizedBox(height: 25.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        controller: textEditingController,
                        keyboardType: const TextInputType.numberWithOptions(),
                        // initialValue: DateTime.now().year.toString(),
                        decoration: InputDecoration(
                          labelText: 'Select Year',
                          isDense: true,
                          enabledBorder: outlineBorder,
                          focusedBorder: outlineBorder,
                        ),
                        onChanged: (value) {
                          try {
                            int selectedYear = int.parse(value);
                            if (selectedYear < 602 || selectedYear > 3999) {
                              Future.delayed(const Duration(seconds: 30)).then((_) {
                                if (yearCalendarViewCubit.year < 602 || yearCalendarViewCubit.year > 3999) {
                                  // year = DateTime.now().year;
                                  // textEditingController.text = year.toString();
                                  yearCalendarViewCubit.updateCalendarView();
                                }
                              });
                              return;
                            }
                            yearCalendarViewCubit.updateCalendarView(year: selectedYear);
                            getMonthDateCubit.year = selectedYear;
                            getMonthDateCubit.getMonthData();
                            // year = selectedYear;
                            // setState(() {});
                          } catch (e) {
                            yearCalendarViewCubit.updateCalendarView(year: DateTime.now().year);
                            // year = DateTime.now().year;
                            // setState(() {});
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 10.w),
                    const Expanded(
                      flex: 2,
                      child: MonthDropDown(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 350.h,
                width: double.infinity,
                child: TableCalendar(
                    firstDay: DateTime.utc(601, 1, 1),
                    lastDay: DateTime.utc(4000, 12, 30),
                    focusedDay: yearCalendarViewCubit.focusedDay(),
                    // focusedDay: _focusedDay,
                    weekendDays: const [DateTime.friday],
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      _selectedDay = selectedDay;
                      yearCalendarViewCubit.updateCalendarView(
                        year: selectedDay.year,
                        month: selectedDay.month,
                        day: selectedDay.day,
                      );
                      getMonthDateCubit.day = selectedDay.day;
                      getMonthDateCubit.getCalendarDay();
                    },
                    calendarStyle: const CalendarStyle(
                      selectedDecoration: BoxDecoration(
                        color: Clr.primaryColorLight,
                        shape: BoxShape.circle,
                      ),
                      todayDecoration: BoxDecoration(
                        color: Clr.secondryColorLight,
                        shape: BoxShape.circle,
                      ),
                    ),
                    shouldFillViewport: true,
                    startingDayOfWeek: StartingDayOfWeek.sunday),
              ),
              const CalendarDayInfo(),
            ],
          );
        },
      ),
    );
  }
}

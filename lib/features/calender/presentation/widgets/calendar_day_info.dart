import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_calender/features/calender/data/models/month_model/calendar_day.dart';
import 'package:new_calender/features/calender/presentation/cubits/get_month_data/get_month_data_cubit.dart';
import 'package:new_calender/features/calender/presentation/cubits/year_calandar_view/year_calandar_view_cubit.dart';
import 'package:new_calender/utils/colors/clr.dart';
import 'package:new_calender/utils/styles/styles.dart';

class CalendarDayInfo extends StatefulWidget {
  const CalendarDayInfo({
    super.key,
  });

  @override
  State<CalendarDayInfo> createState() => _CalendarDayInfoState();
}

class _CalendarDayInfoState extends State<CalendarDayInfo> {
  late final YearCalendarViewCubit yearCalendarViewCubit;
  late final GetMonthDataCubit getMonthDateCubit;
  @override
  void initState() {
    yearCalendarViewCubit = context.read<YearCalendarViewCubit>();
    getMonthDateCubit = context.read<GetMonthDataCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMonthDataCubit, GetMonthDataState>(
      builder: (context, state) {
        CalendarDay? calendarDay = getMonthDateCubit.calendarDay;
        return Expanded(
          child: Container(
            child: AnimatedOpacity(
              opacity: calendarDay != null ? 1.0 : 0.0,
              duration: const Duration(seconds: 2),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Clr.primaryColorLight,
                  border: Border.all(color: Clr.primaryColorLight),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: txt('Old Hijri', e: St.bold14, c: Colors.white),
                        ),
                        const Expanded(flex: 1, child: SizedBox()),
                        Expanded(
                          flex: 4,
                          child: txt(calendarDay?.oldHijriDate ?? '', e: St.reg14, c: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: txt('New Hijri', e: St.bold14, c: Colors.white),
                        ),
                        const Expanded(flex: 1, child: SizedBox()),
                        Expanded(
                          flex: 4,
                          child: txt(calendarDay?.newHijriDate ?? '', e: St.reg14, c: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

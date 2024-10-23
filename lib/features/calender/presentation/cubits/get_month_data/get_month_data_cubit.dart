// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_calender/core/Errors/failure.dart';
import 'package:new_calender/core/Helpers/print_helper.dart';
import 'package:new_calender/features/calender/data/models/month_model/calendar_day.dart';
import 'package:new_calender/features/calender/data/models/month_model/month_model.dart';
import 'package:new_calender/features/calender/data/repos/calender_repo_imp.dart';

part 'get_month_data_state.dart';

class GetMonthDataCubit extends Cubit<GetMonthDataState> {
  final CalanderRepoImp calanderRepoImp;
  MonthModel? monthModel;
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  int day = DateTime.now().day;
  CalendarDay? calendarDay;
  GetMonthDataCubit({
    required this.calanderRepoImp,
  }) : super(GetMonthDataInitial());
  Future<void> getMonthData() async {
    const t = "getMonthData - GetMonthDataCubit";
    emit(GetMonthDataLoading());
    final result = await calanderRepoImp.getMonthData(year: year, month: month);
    result.fold(
      (Failure failure) {
        pr(failure.message, t);
        emit(GetMonthDataFailed());
      },
      (MonthModel model) {
        monthModel = model;
        pr(model, t);
        emit(GetMonthDataSuccess());
      },
    );
  }

  void getCalendarDay() {
    const t = "getCalendarDay - GetMonthDataCubit";
    pr(year, '$t year');
    pr(month, '$t month');
    pr(day, '$t day');
    if (monthModel == null || monthModel?.calendarDays == null) {
      return;
    }
    for (CalendarDay model in monthModel!.calendarDays!) {
      if (model.gregorianDate == null) {
        continue;
      }
      if (int.parse(model.gregorianDate!) == day) {
        calendarDay = model;
        emit(GetMonthDataSuccess());
        break;
      }
    }
    pr(calendarDay, t);
  }
}

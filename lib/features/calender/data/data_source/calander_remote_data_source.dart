// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:new_calender/core/Errors/exception.dart';
import 'package:new_calender/core/Helpers/print_helper.dart';
import 'package:new_calender/core/api_service/api_consumer.dart';
import 'package:new_calender/core/api_service/check_internet.dart';
import 'package:new_calender/core/api_service/end_points.dart';
import 'package:new_calender/features/calender/data/models/month_model/calendar_day.dart';
import 'package:new_calender/features/calender/data/models/month_model/month_model.dart';

abstract class CalanderRemoteDataSource {
  Future<MonthModel> getMonthData({
    required int year,
    required int month,
  });
}

class CalanderRemoteDataSourceImp implements CalanderRemoteDataSource {
  final ApiConsumer api;
  CalanderRemoteDataSourceImp({
    required this.api,
  });
  @override
  Future<MonthModel> getMonthData({
    required int year,
    required int month,
  }) async {
    const t = "getMonthData - CalanderRemoteDataSourceImp";
    if (!(await checkInternet())) {
      throw OfflineException();
    }
    final data = await api.get(
      EndPoint.viewMonth,
      queryParameter: {
        'year': year,
        'month': month,
      },
    );
    if (data['status'] != 'success') {
      pr('validation exception', t);
      throw ValidationErrorException();
    }
    MonthModel model = MonthModel.fromJson(data['data']);
    if (data['data']['calendarDays'] == null) {
      pr('No calendarDays key is found in the response', t);
      throw Exception('No calendarDays key is found in the response');
    }
    List days = data['data']['calendarDays'];
    List<CalendarDay> calendarDays = [];
    for (var i = 0; i < days.length; i++) {
      if (days[i] == null) {
        continue;
      }
      calendarDays.add(CalendarDay.fromJson(days[i]));
    }
    model.calendarDays = calendarDays;
    pr(model, t);
    return model;
  }
}

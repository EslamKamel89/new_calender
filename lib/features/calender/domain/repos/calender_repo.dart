import 'package:dartz/dartz.dart';
import 'package:new_calender/core/Errors/failure.dart';
import 'package:new_calender/features/calender/data/models/month_model/month_model.dart';

abstract class CalanderRepo {
  Future<Either<Failure, MonthModel>> getMonthData({
    required int year,
    required int month,
  });
}

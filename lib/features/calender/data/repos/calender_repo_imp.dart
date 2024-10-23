import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:new_calender/core/Errors/exception.dart';
import 'package:new_calender/core/Errors/failure.dart';
import 'package:new_calender/core/Helpers/print_helper.dart';
import 'package:new_calender/features/calender/data/data_source/calander_remote_data_source.dart';
import 'package:new_calender/features/calender/data/models/month_model/month_model.dart';
import 'package:new_calender/features/calender/domain/repos/calender_repo.dart';

class CalanderRepoImp implements CalanderRepo {
  final CalanderRemoteDataSourceImp calanderRemoteDataSourceImp;

  CalanderRepoImp({required this.calanderRemoteDataSourceImp});

  @override
  Future<Either<Failure, MonthModel>> getMonthData({
    required int year,
    required int month,
  }) async {
    const t = "getMonthData - CalanderRepoImp";
    try {
      MonthModel model = await calanderRemoteDataSourceImp.getMonthData(year: year, month: month);
      pr(model, t);
      return Right(model);
    } catch (e) {
      pr(e, t);
      if (e is DioException) {
        return Left(ServerFailure.formDioError(e));
      }
      if (e is ValidationErrorException) {
        return Left(ServerFailure('Validation Exception occured: $e'));
      }
      if (e is OfflineException) {
        return Left(ServerFailure.offline());
      }
      // rethrow;
      return Left(ServerFailure(e.toString()));
    }
  }
}

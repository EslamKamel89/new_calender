import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:new_calender/core/api_service/api_consumer.dart';
import 'package:new_calender/core/api_service/dio_consumer.dart';
import 'package:new_calender/features/calender/data/data_source/calander_remote_data_source.dart';
import 'package:new_calender/features/calender/data/repos/calender_repo_imp.dart';

final GetIt serviceLocator = GetIt.instance;

void initServiceLocator() {
  serviceLocator.registerLazySingleton<Dio>(() => Dio());
  serviceLocator.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: serviceLocator()));
  serviceLocator
      .registerLazySingleton<CalanderRemoteDataSourceImp>(() => CalanderRemoteDataSourceImp(api: serviceLocator()));
  // serviceLocator.registerLazySingleton<HomeLocalDataSource>(() => HomeLocalDataSourceImp());
  serviceLocator.registerLazySingleton<CalanderRepoImp>(
    () => CalanderRepoImp(calanderRemoteDataSourceImp: serviceLocator()),
  );
  // serviceLocator.registerLazySingleton<FetchFeaturedBooksUsecase>(
  //   () => FetchFeaturedBooksUsecase(homeRepo: serviceLocator()),
  // );
  // serviceLocator.registerLazySingleton<FetchNewestBooksUsecase>(
  //   () => FetchNewestBooksUsecase(homeRepo: serviceLocator()),
  // );
}

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:new_calender/core/api_service/api_consumer.dart';
import 'package:new_calender/core/api_service/dio_consumer.dart';

final GetIt serviceLocator = GetIt.instance;

void initServiceLocator() {
  serviceLocator.registerLazySingleton<Dio>(() => Dio());
  serviceLocator.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: serviceLocator()));
  // serviceLocator.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImp(api: serviceLocator()));
  // serviceLocator.registerLazySingleton<HomeLocalDataSource>(() => HomeLocalDataSourceImp());
  // serviceLocator.registerLazySingleton<HomeRepo>(
  //   () => HomeRepoImp(homeLocalDataSource: serviceLocator(), homeRemoteDataSource: serviceLocator()),
  // );
  // serviceLocator.registerLazySingleton<FetchFeaturedBooksUsecase>(
  //   () => FetchFeaturedBooksUsecase(homeRepo: serviceLocator()),
  // );
  // serviceLocator.registerLazySingleton<FetchNewestBooksUsecase>(
  //   () => FetchNewestBooksUsecase(homeRepo: serviceLocator()),
  // );
}

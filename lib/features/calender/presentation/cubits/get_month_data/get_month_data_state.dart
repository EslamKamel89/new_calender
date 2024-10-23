part of 'get_month_data_cubit.dart';

sealed class GetMonthDataState {}

final class GetMonthDataInitial extends GetMonthDataState {}

final class GetMonthDataLoading extends GetMonthDataState {}

final class GetMonthDataFailed extends GetMonthDataState {}

final class GetMonthDataSuccess extends GetMonthDataState {}

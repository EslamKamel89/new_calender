import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_calender/core/service_locator/service_locator.dart';
import 'package:new_calender/features/calender/presentation/cubits/get_month_data/get_month_data_cubit.dart';
import 'package:new_calender/features/calender/presentation/cubits/year_calandar_view/year_calandar_view_cubit.dart';
import 'package:new_calender/features/calender/presentation/views/year_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => YearCalendarViewCubit(),
          ),
          BlocProvider(
            create: (context) => GetMonthDataCubit(calanderRepoImp: serviceLocator()),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: YearCalendarView(),
        ),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Calender')));
  }
}

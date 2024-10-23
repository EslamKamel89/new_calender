import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_calender/features/calender/presentation/cubits/get_month_data/get_month_data_cubit.dart';
import 'package:new_calender/features/calender/presentation/cubits/year_calandar_view/year_calandar_view_cubit.dart';

class MonthDropDown extends StatefulWidget {
  const MonthDropDown({super.key});

  @override
  State<MonthDropDown> createState() => _MonthDropDownState();
}

class _MonthDropDownState extends State<MonthDropDown> {
  String? selectedMonth;
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  late final YearCalendarViewCubit yearCalendarViewCubit;
  late final GetMonthDataCubit getMonthDateCubit;

  @override
  void initState() {
    getMonthDateCubit = context.read<GetMonthDataCubit>();

    yearCalendarViewCubit = context.read<YearCalendarViewCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton<String>(
        hint: const Text('Select a month'),
        alignment: AlignmentDirectional.centerStart,
        value: selectedMonth,
        onChanged: (String? newValue) {
          yearCalendarViewCubit.updateCalendarView(month: months.indexOf(newValue ?? 'January') + 1);
          getMonthDateCubit.month = months.indexOf(newValue ?? 'January') + 1;
          getMonthDateCubit.getMonthData();
          setState(() {
            selectedMonth = newValue;
          });
        },
        items: months.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

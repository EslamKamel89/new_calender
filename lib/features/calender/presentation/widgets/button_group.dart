import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_calender/features/calender/presentation/widgets/calendar_icon.dart';
import 'package:new_calender/utils/assets/assets.dart';
import 'package:new_calender/utils/colors/clr.dart';

class ButtonGroup extends StatefulWidget {
  const ButtonGroup({super.key});

  @override
  State<ButtonGroup> createState() => _ButtonGroupState();
}

class _ButtonGroupState extends State<ButtonGroup> {
  List<bool> isSelected = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      onPressed: (int index) {
        setState(() {
          bool cond = isSelected[index];
          isSelected = [false, false, false];
          isSelected[index] = !cond;
        });
      },
      isSelected: isSelected,
      borderRadius: BorderRadius.circular(12),
      selectedColor: Colors.white,
      fillColor: Clr.primaryColorLight,
      borderWidth: 2,
      borderColor: Clr.primaryColorDark,
      selectedBorderColor: Clr.primaryColorDark,
      splashColor: Clr.primaryColorLight,
      highlightColor: Clr.primaryColorLight,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.h),
          child: Row(
            children: [
              const CalenderIcon(path: AssetsData.calender7),
              SizedBox(width: 5.w),
              const Text('New Hiijri'),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.h),
          child: Row(
            children: [
              const CalenderIcon(path: AssetsData.calender3),
              SizedBox(width: 5.w),
              const Text('Old Hiijri'),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.h),
          child: Row(
            children: [
              const CalenderIcon(path: AssetsData.calender5),
              SizedBox(width: 5.w),
              const Text('Gregorian Data'),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalenderIcon extends StatelessWidget {
  const CalenderIcon({
    super.key,
    required this.path,
  });
  final String path;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.h,
      height: 20.h,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(shape: BoxShape.rectangle),
      child: Image.asset(path),
    );
  }
}

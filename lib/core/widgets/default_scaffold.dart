import 'package:flutter/material.dart';
import 'package:new_calender/utils/colors/clr.dart';
import 'package:new_calender/utils/styles/styles.dart';

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold({
    super.key,
    required this.title,
    required this.child,
  });
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // backgroundColor: Clr.primaryColorDark,
        appBar: AppBar(
          title: txt(
            title,
            c: Colors.white,
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Clr.primaryColorDark, Clr.primaryColorLight],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          elevation: 10,
          shadowColor: Clr.primaryColorLight,
        ),
        body: child,
      ),
    );
  }
}

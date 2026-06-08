import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_colors.dart';
import 'features/calendar/calendar_screen.dart';

void main() {
  runApp(const ProviderScope(child: MalayalamCalendarApp()));
}

class MalayalamCalendarApp extends StatelessWidget {
  const MalayalamCalendarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Malayalam Calendar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.wall,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.holiday,
          surface: AppColors.wall,
        ),
        fontFamily: 'Roboto',
      ),
      home: const CalendarScreen(),
    );
  }
}

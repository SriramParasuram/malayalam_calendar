import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers/datetime_provider.dart';
import '../../core/widgets/paint_texture.dart';
import 'widgets/wall_calendar.dart';

/// Home screen: a painted wall background with the [WallCalendar] hanging on it.
class CalendarScreen extends ConsumerWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = ref.watch(currentDateTimeProvider);

    return Scaffold(
      body: PaintTexture(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 36),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 440),
                child: WallCalendar(date: now),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

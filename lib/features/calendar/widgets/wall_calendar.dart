import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/malayalam_numerals.dart';
import '../../../core/utils/month_names.dart';
import 'calendar_hook.dart';
import 'dinam_grid.dart';
import 'paper_texture.dart';

/// A skeuomorphic "wall calendar" that looks like a physical object hanging on
/// the wall: a raised paper sheet (soft [BoxShadow] + paper texture) with a
/// plastic [CalendarHook] at the top centre and a [DinamGrid] inside.
class WallCalendar extends StatelessWidget {
  const WallCalendar({super.key, required this.date});

  /// Any date within the month to display.
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    // The hook overhangs the top of the paper sheet, so we reserve space for it
    // with a Stack that is allowed to overflow upward.
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            // Soft shadow to lift the sheet off the wall.
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.22),
                blurRadius: 28,
                spreadRadius: 1,
                offset: const Offset(0, 14),
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.10),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: PaperTexture(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.paperEdge, width: 1),
                ),
                padding: const EdgeInsets.fromLTRB(18, 26, 18, 22),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _Header(date: date),
                    const SizedBox(height: 16),
                    DinamGrid(month: date),
                  ],
                ),
              ),
            ),
          ),
        ),
        // Plastic hanger at the top centre, overhanging the sheet.
        const Positioned(top: 0, child: CalendarHook()),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          MonthNames.englishOf(date.month),
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
            color: AppColors.ink,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          '${MonthNames.malayalamOf(date.month)}  \u00B7  ${MalayalamNumerals.fromInt(date.year)}',
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.holiday,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

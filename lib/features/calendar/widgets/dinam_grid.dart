import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/malayalam_numerals.dart';

/// A month grid of "dinam" (day) cells laid out with [GridView.builder].
///
/// Each cell shows a large Gregorian number in the centre and a small Malayalam
/// numeral in the bottom-right corner. Leading blanks pad the first week so the
/// 1st lands under the correct weekday column.
class DinamGrid extends StatelessWidget {
  const DinamGrid({super.key, required this.month});

  /// Any date within the month to render.
  final DateTime month;

  static const List<String> _weekdayLabels = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
  ];

  int get _daysInMonth => DateTime(month.year, month.month + 1, 0).day;

  /// Weekday index (0 = Sunday) of the 1st of the month.
  int get _leadingBlanks => DateTime(month.year, month.month, 1).weekday % 7;

  @override
  Widget build(BuildContext context) {
    final totalCells = _leadingBlanks + _daysInMonth;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            for (final label in _weekdayLabels)
              Expanded(
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      color: label == 'Sun' ? AppColors.holiday : AppColors.inkSoft,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        const Divider(height: 1, thickness: 1, color: AppColors.paperEdge),
        const SizedBox(height: 6),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: totalCells,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 0.82,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
          ),
          itemBuilder: (context, index) {
            if (index < _leadingBlanks) {
              return const SizedBox.shrink();
            }
            final day = index - _leadingBlanks + 1;
            final isSunday = (index % 7) == 0;
            return _DinamCell(gregorianDay: day, isHoliday: isSunday);
          },
        ),
      ],
    );
  }
}

class _DinamCell extends StatelessWidget {
  const _DinamCell({required this.gregorianDay, required this.isHoliday});

  final int gregorianDay;
  final bool isHoliday;

  @override
  Widget build(BuildContext context) {
    final numberColor = isHoliday ? AppColors.holiday : AppColors.ink;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.paperEdge.withValues(alpha: 0.7)),
      ),
      child: Stack(
        children: [
          // Large Gregorian number, centred.
          Center(
            child: Text(
              '$gregorianDay',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: numberColor,
              ),
            ),
          ),
          // Small Malayalam numeral in the bottom-right corner.
          Positioned(
            right: 4,
            bottom: 2,
            child: Text(
              MalayalamNumerals.fromInt(gregorianDay),
              style: const TextStyle(
                fontSize: 11,
                height: 1,
                color: AppColors.inkSoft,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

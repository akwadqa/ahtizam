import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../controllers/rate_controller.dart';

class RatingOptionItem extends StatelessWidget {
  final RatingOption option;
  final bool isSelected;
  final VoidCallback onTap;

  const RatingOptionItem({
    super.key,
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.amber : Colors.transparent,
            width: isSelected ? 1 : 0,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option.label.tr(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: isSelected ? FontWeight.bold : null,
                  ),
            ),
            // Spacer(),
            Row(
              children: List.generate(5, (index) {
                final isFilled = index < option.value;
                return Icon(
                  isFilled ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: isSelected ? 26 : 24,
                );
              }).reversed.toList(),
            ),
          ],
        ),
      ),
    );
  }
}

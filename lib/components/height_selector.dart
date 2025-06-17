import 'package:flutter/material.dart';
import 'package:imc_calculator/core/Text_style.dart';
import 'package:imc_calculator/core/app_colors.dart';

class HeightSelector extends StatefulWidget {
  final double height;
  final Function(double) incrementHeight;
  const HeightSelector({super.key, required this.height, required this.incrementHeight});

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  double height = 220;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundSelected,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text("ALTURA", style: TextStyles.bodyText),
            Text(
              "${widget.height.toStringAsFixed(0)} cm",
              style: TextStyle(
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
            Slider(
              value: widget.height,
              onChanged: (value) {
                widget.incrementHeight(value);
              },
              min: 130,
              max: 220,
              divisions: 70,
              activeColor: AppColors.primary,
              label: "${widget.height.toStringAsFixed(0)}",
            ),
          ],
        ),
      ),
    );
  }
}

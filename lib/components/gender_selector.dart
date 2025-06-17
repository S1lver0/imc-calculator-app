import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:imc_calculator/core/Text_style.dart';
import 'package:imc_calculator/core/app_colors.dart';

class GenderSelector extends StatefulWidget {
  final Function(String) definirGenero;
  final int genero;
  const GenderSelector({
    super.key,
    required this.definirGenero,
    required this.genero,
  });

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              widget.definirGenero("HOMBRE");
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 16,
                bottom: 16,
                right: 8,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: widget.genero == 1
                      ? AppColors.noSelect
                      : AppColors.backgroundSelected,
                  borderRadius: BorderRadius.circular(16),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Image.asset("assets/images/male.png", height: 100),
                      SizedBox(height: 8),
                      Text("Hombre".toUpperCase(), style: TextStyles.bodyText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                widget.definirGenero("MUJER");
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 16,
                top: 16,
                bottom: 16,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: widget.genero == 2
                      ? AppColors.noSelect
                      : AppColors.backgroundSelected,
                  borderRadius: BorderRadius.circular(16),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Image.asset("assets/images/female.png", height: 100),
                      SizedBox(height: 8),
                      Text("Mujer".toUpperCase(), style: TextStyles.bodyText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

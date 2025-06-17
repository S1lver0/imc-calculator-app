import 'package:flutter/material.dart';
import 'package:imc_calculator/core/Text_style.dart';
import 'package:imc_calculator/core/app_colors.dart';

class NumberSelector extends StatefulWidget {
  final String title;
  final double padR;
  final double padL;
  final Function onIncrement;
  final Function onDecrement;
  final int contador;

  const NumberSelector({
    super.key,
    required this.title,
    this.padR = 16,
    this.padL = 16,
    required this.onIncrement,
    required this.onDecrement,
    required this.contador,
  });

  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          right: widget.padR,
          left: widget.padL,
          top: 16,
          bottom: 16,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundSelected,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  top: 16,
                  bottom: 8,
                ),
                child: Text(
                  widget.title,
                  style: TextStyle(fontSize: 25, color: AppColors.background),
                ),
              ),
              Text(
                "${widget.contador}",
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  top: 0,
                  bottom: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      heroTag: null,
                      onPressed: () {
                        widget.onDecrement();
                      },
                      shape: CircleBorder(),
                      child: Icon(Icons.remove, color: Colors.white),
                      backgroundColor: AppColors.primary,
                    ),
                    SizedBox(width: 15),
                    FloatingActionButton(
                      heroTag: null,
                      onPressed: () {
                        widget.onIncrement();
                      },
                      shape: CircleBorder(),
                      child: Icon(Icons.add, color: Colors.white),
                      backgroundColor: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

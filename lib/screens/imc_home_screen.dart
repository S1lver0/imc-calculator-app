import 'package:flutter/material.dart';
import 'package:imc_calculator/components/gender_selector.dart';
import 'package:imc_calculator/components/height_selector.dart';
import 'package:imc_calculator/components/number_selector.dart';
import 'package:imc_calculator/core/Text_style.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/screens/imc_resolve.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  int setpeso = 50;
  int setedad = 10;
  double setAltura = 150;
  int setGenero = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(
          definirGenero: (String genero) {
            setState(() {
              if (genero == "HOMBRE") {
                setGenero = 1;
              } else {
                setGenero = 2;
              }
            });
          },
          genero: setGenero,
        ),
        HeightSelector(
          height: setAltura,
          incrementHeight: (double value) {
            setState(() {
              setAltura = value;
            });
          },
        ),
        Row(
          children: [
            NumberSelector(
              title: "Peso",
              padR: 8,
              contador: setpeso,
              onIncrement: () {
                setState(() {
                  if (setpeso <= 300) {
                    setState(() {
                      setpeso++;
                    });
                  }
                });
              },
              onDecrement: () {
                setState(() {
                  if (setpeso >= 1) {
                    setState(() {
                      setpeso--;
                    });
                  }
                });
              },
            ),
            NumberSelector(
              title: "Edad",
              padR: 8,
              contador: setedad,
              onIncrement: () {
                setState(() {
                  if (setedad <= 300) {
                    setState(() {
                      setedad++;
                    });
                  }
                });
              },
              onDecrement: () {
                setState(() {
                  if (setedad >= 1) {
                    setState(() {
                      setedad--;
                    });
                  }
                });
              },
            ),
          ],
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImcResolve(
                    height: setAltura,
                    peso: setpeso

                  )),
                );
              },
              child: Text("Calcular", style: TextStyles.bodyText),
            ),
          ),
        ),
      ],
    );
  }
}

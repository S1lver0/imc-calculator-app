import 'package:flutter/material.dart';
import 'package:imc_calculator/core/Text_style.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/screens/imc_home_screen.dart';

class ImcResolve extends StatelessWidget {
  final double height;
  final int peso;
  const ImcResolve({super.key, required this.peso, required this.height});
  List resultado(double imc) {
    List<String> result = [];
    if (imc < 18.5) {
      result.add('Bajo peso');
      result.add('yellow');
      result.add('Peso insuficiente, posible desnutrición');
    } else if (imc <= 24.9 && imc >= 18.5) {
      result.add('Peso Normal');
      result.add('green');
      result.add('Peso saludable.');
    } else if (imc <= 29.9 && imc >= 25) {
      result.add('Sobrepeso');
      result.add('yellow');
      result.add('Algo de exceso de peso.');
    } else if (imc <= 34.9 && imc >= 30) {
      result.add('Obesidad grado I');
      result.add('yellow');
      result.add('Obesidad leve, riesgo moderado.');
    } else if (imc <= 39.9 && imc >= 35) {
      result.add('Obesidad grado II');
      result.add('red');
      result.add('Obesidad severa, riesgo alto.');
    } else if (imc >= 40) {
      result.add('Obesidad grado III');
      result.add('red');
      result.add('Obesidad muy severa, riesgo muy alto.');
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    double fixedHeight = height / 100;
    double imcResult = peso / (fixedHeight * fixedHeight);
    List mostrarResultado = resultado(imcResult);
    String colorString = mostrarResultado[1];

    return Scaffold(
      backgroundColor: AppColors.accent,
      appBar: toobarResult(),
      body: bodyResult(imcResult, mostrarResultado, colorString, context),
    );
  }

  Padding bodyResult(
    double result,
    List mostrarResultado,
    String colorString,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 15,
              left: 10,
              right: 10,
              top: 10,
            ),
            child: Text(
              "Tu resultado ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.secundary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "${mostrarResultado[0]}",
                        style: TextStyle(
                          color:
                              {
                                'red': Colors.red,
                                'yellow': Colors.yellow,
                                'green': Colors.green,
                              }[colorString] ??
                              Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        result.toStringAsFixed(2),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${mostrarResultado[2]}",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                  Navigator.pop(context);
                },
                child: Text("Finalizar", style: TextStyles.bodyText),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar toobarResult() {
    return AppBar(
      title: Text("Resultado"),
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    );
  }
}

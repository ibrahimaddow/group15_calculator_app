import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/calculator_controller.dart';
import '../widget/calculator_button.dart';

class CalculatorView extends StatelessWidget {
  final CalculatorController controller = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(16),
              child: Obx(
                    () => Text(
                  controller.displayValue.value,
                  style: TextStyle(fontSize: 48, color: Colors.white),
                ),
              ),
            ),
          ),
          _buildButtonGrid(),
        ],
      ),
    );
  }

  Widget _buildButtonGrid() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 4,
      children: [
        CalculatorButton(
          label: 'C',
          color: Colors.orange,
          onTap: () => controller.clearDisplay(),
        ),
        CalculatorButton(
          label: '⌫',
          color: Colors.orange,
          onTap: () => controller.backspace(), // Call the backspace method
        ),
        CalculatorButton(
          label: '%',
          color: Colors.orange,
          onTap: () => controller.calculatePercentage(), // Call the percentage method
        ),
        CalculatorButton(
          label: '/',
          color: Colors.orange,
          onTap: () => controller.updateDisplay('/'),
        ),
        CalculatorButton(
          label: '7',
          onTap: () => controller.updateDisplay('7'),
        ),
        CalculatorButton(
          label: '8',
          onTap: () => controller.updateDisplay('8'),
        ),
        CalculatorButton(
          label: '9',
          onTap: () => controller.updateDisplay('9'),
        ),
        CalculatorButton(
          label: '*',
          color: Colors.orange,
          onTap: () => controller.updateDisplay('*'),
        ),
        CalculatorButton(
          label: '4',
          onTap: () => controller.updateDisplay('4'),
        ),
        CalculatorButton(
          label: '5',
          onTap: () => controller.updateDisplay('5'),
        ),
        CalculatorButton(
          label: '6',
          onTap: () => controller.updateDisplay('6'),
        ),
        CalculatorButton(
          label: '-',
          color: Colors.orange,
          onTap: () => controller.updateDisplay('-'),
        ),
        CalculatorButton(
          label: '1',
          onTap: () => controller.updateDisplay('1'),
        ),
        CalculatorButton(
          label: '2',
          onTap: () => controller.updateDisplay('2'),
        ),
        CalculatorButton(
          label: '3',
          onTap: () => controller.updateDisplay('3'),
        ),
        CalculatorButton(
          label: '+',
          color: Colors.orange,
          onTap: () => controller.updateDisplay('+'),
        ),
        CalculatorButton(
          label: '0',
          onTap: () => controller.updateDisplay('0'),
        ),
        CalculatorButton(
          label: '.',
          onTap: () => controller.updateDisplay('.'),
        ),
        CalculatorButton(
          label: '=',
          color: Colors.orange,
          onTap: () => controller.calculateResult(),
        ),
      ],
    );
  }
}
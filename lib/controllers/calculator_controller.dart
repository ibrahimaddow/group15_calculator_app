import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  var displayValue = '0'.obs; // Observable variable for the display value

  void updateDisplay(String value) {
    if (displayValue.value == '0') {
      displayValue.value = value;
    } else {
      displayValue.value += value;
    }
  }

  void clearDisplay() {
    displayValue.value = '0';
  }

  void backspace() {
    if (displayValue.value.isNotEmpty && displayValue.value != '0') {
      displayValue.value = displayValue.value.substring(0, displayValue.value.length - 1);
      if (displayValue.value.isEmpty) {
        displayValue.value = '0'; // Reset to '0' if the display becomes empty
      }
    }
  }

  void calculateResult() {
    try {
      Parser parser = Parser();
      Expression expression = parser.parse(displayValue.value);
      ContextModel contextModel = ContextModel();
      double result = expression.evaluate(EvaluationType.REAL, contextModel);

      // Check if the result is a whole number
      if (result == result.toInt()) {
        displayValue.value = result.toInt().toString(); // Display as integer
      } else {
        displayValue.value = result.toString(); // Display as double
      }
    } catch (e) {
      displayValue.value = 'Error';
    }
  }

  void calculatePercentage() {
    try {
      // Append '/100' to the current display value to calculate the percentage
      Parser parser = Parser();
      Expression expression = parser.parse(displayValue.value + '/100');
      ContextModel contextModel = ContextModel();
      double result = expression.evaluate(EvaluationType.REAL, contextModel);

      // Update the display with the percentage result
      if (result == result.toInt()) {
        displayValue.value = result.toInt().toString(); // Display as integer
      } else {
        displayValue.value = result.toString(); // Display as double
      }
    } catch (e) {
      displayValue.value = 'Error';
    }
  }
}
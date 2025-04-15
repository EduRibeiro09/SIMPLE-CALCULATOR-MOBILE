class Memory {
  String _value = '0';
  String _buffer = '';
  String _operation = '';
  String _expression = '';
  bool _isResultCalculated = false;

  String get value => _value;
  String get expression => _expression;
  bool get isResultCalculated => _isResultCalculated;

  void applyCommand(String command) {
    if (command == 'C') {
      _clear();
    } else if (command == '⌫') {
      _backspace();
    } else if (_isNumeric(command) || command == '.') {
      _appendDigit(command);
    } else if (command == '%') {
      _applyPercent();
    } else if (_isOperator(command)) {
      _setOperation(command);
    } else if (command == '=') {
      _calculate();
    }
  }

  void _clear() {
    _value = '0';
    _buffer = '';
    _operation = '';
    _expression = '';
    _isResultCalculated = false;
  }

  void _backspace() {
    if (_value.length > 1) {
      _value = _value.substring(0, _value.length - 1);
    } else {
      _value = '0';
    }
    _isResultCalculated = false;
  }

  void _appendDigit(String digit) {
    if (digit == '.' && _value.contains('.')) return;

    if (_isResultCalculated) {
      _value = digit == '.' ? '0.' : digit;
      _expression = _value;
      _isResultCalculated = false;
    } else {
      if (_value == '0' && digit != '.') {
        _value = digit;
      } else {
        _value += digit;
      }

      if (_operation.isNotEmpty && _buffer.isNotEmpty) {
        _expression = '$_buffer $_operation $_value';
      } else {
        _expression = _value;
      }
    }
  }

  void _setOperation(String operation) {
    _buffer = _value;
    _operation = operation;
    _expression = '$_value $operation';
    _value = '0';
    _isResultCalculated = false;
  }

  void _calculate() {
    if (_buffer.isEmpty || _operation.isEmpty) return;

    final double num1 = double.tryParse(_buffer) ?? 0.0;
    double num2 = double.tryParse(_value) ?? 0.0;

    // Se a operação for +, -, × ou ÷ e o comando anterior foi '%',
    // tratamos num2 como porcentagem de num1
    if (_operation != '%' && _value.contains('%')) {
      num2 = num1 * (num2 / 100);
    }

    double result = 0.0;

    switch (_operation) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '×':
        result = num1 * num2;
        break;
      case '÷':
        result = num2 != 0 ? num1 / num2 : 0.0;
        break;
      case '%':
        result = num1 * (num2 / 100);
        break;
    }

    _expression = '$_buffer $_operation $_value =';
    _value = _formatResult(result);
    _buffer = '';
    _operation = '';
    _isResultCalculated = true;
  }

  void _applyPercent() {
    if (_buffer.isNotEmpty && _operation.isNotEmpty) {
      // Percentagem em relação ao primeiro número
      final double base = double.tryParse(_buffer) ?? 0.0;
      final double current = double.tryParse(_value) ?? 0.0;
      final percent = base * (current / 100);
      _value = _formatResult(percent);
      _expression = '$_buffer $_operation $current%';
    } else {
      // Percentual puro (sem base de cálculo)
      final double current = double.tryParse(_value) ?? 0.0;
      final percent = current / 100;
      _value = _formatResult(percent);
      _expression = '$current% = $_value';
    }
  }

  String _formatResult(double result) {
    return result.truncateToDouble() == result
        ? result.toStringAsFixed(0)
        : result.toStringAsFixed(2);
  }

  bool _isNumeric(String str) {
    return double.tryParse(str) != null;
  }

  bool _isOperator(String str) {
    return ['+', '-', '×', '÷', '%'].contains(str);
  }
}

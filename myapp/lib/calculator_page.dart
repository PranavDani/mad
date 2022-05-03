import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  late String _currentValue;
  late String _opValue;
  late String _operator;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentValue = '';
    _opValue = '';
    _operator = '';
  }

  void updateCurrentValue(val) {
    setState(() {
      _currentValue = val;
    });
  }

  void updateOpValue(val) {
    setState(() {
      _opValue = val;
    });
  }

  void updateOperator(val) {
    setState(() {
      _operator = val;
    });
  }

  final List<String> _keys = [
    '1',
    '2',
    '3',
    '+',
    '4',
    '5',
    '6',
    '-',
    '7',
    '8',
    '9',
    '*',
    'AC',
    '0',
    '=',
    '/'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        leading: const Icon(Icons.filter_vintage),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("$_opValue $_operator"),
          Text("$_currentValue", style: TextStyle(fontSize: 20)),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              children: List.generate(
                _keys.length,
                (index) => TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    elevation: MaterialStateProperty.all(0.5),
                  ),
                  onPressed: () {
                    if (_keys[index] == 'AC') {
                      updateCurrentValue('');
                      updateOperator('');
                      updateOpValue('');
                    } else if (_keys[index] == '=') {
                      if (_operator == '+') {
                        updateCurrentValue(
                            (int.parse(_currentValue) + int.parse(_opValue))
                                .toString());
                      } else if (_operator == '-') {
                        updateCurrentValue(
                            (int.parse(_currentValue) - int.parse(_opValue))
                                .toString());
                      } else if (_operator == '*') {
                        updateCurrentValue(
                            (int.parse(_currentValue) * int.parse(_opValue))
                                .toString());
                      } else if (_operator == '/') {
                        updateCurrentValue(
                            (int.parse(_currentValue) / int.parse(_opValue))
                                .toString());
                      }
                      updateOpValue('');
                      updateOperator('');
                    } else if (_keys[index] == '+' ||
                        _keys[index] == '-' ||
                        _keys[index] == '*' ||
                        _keys[index] == '/') {
                      updateOperator(_keys[index]);
                      updateOpValue(_currentValue);
                      updateCurrentValue('');
                    } else {
                      updateCurrentValue(_keys[index]);
                    }
                  },
                  child: Text(
                    _keys[index],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Convertor extends StatelessWidget {
  final _cel = TextEditingController();
  final _fah = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Farhrenheit',
              hintText: "Farhrenheit",
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            controller: _fah,
            onChanged: (value) {
              if (value.isNotEmpty)
                _cel.text = "${(double.parse(value) - 32) * 5 / 9} °C";
            },
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Celcius',
              hintText: "Celcius",
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            controller: _cel,
            onChanged: (value) {
              if (value.isNotEmpty)
                _fah.text = "${double.parse(value) * 9 / 5 + 32} °F";
            },
          ),
        ],
      ),
    );
  }
}

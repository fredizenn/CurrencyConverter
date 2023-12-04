import 'package:flutter/material.dart';

class CurrencyConverterMatPage extends StatefulWidget {
  const CurrencyConverterMatPage({super.key});

  @override
  State<CurrencyConverterMatPage> createState() =>
      _CurrencyConverterMatPageState();
}

class _CurrencyConverterMatPageState extends State<CurrencyConverterMatPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  convert() {
    setState(() {
      result = double.parse(textEditingController.text) * 12.00;
    });
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black,
          width: 2.0,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(5));

    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          elevation: 0,
          title: const Text(
            'Currency Converter',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(9.0),
                  child: Text(
                    'GH₵ ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextField(
                  onSubmitted: (value) => debugPrint(value),
                  controller: textEditingController,
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Please enter the amount in USD',
                    hintStyle: const TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                    ),
                    prefixIcon: const Icon(Icons.monetization_on_outlined,
                        color: Colors.black),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true, signed: true),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: convert,
                    style: TextButton.styleFrom(
                      elevation: (15),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      textStyle: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    child: const Text('Convert')),
              ],
            ),
          ),
        ));
  }
}

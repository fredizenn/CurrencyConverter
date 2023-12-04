import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() => _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState extends State<CurrencyConverterCupertinoPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  convert() {
    setState(() {
      result = double.parse(textEditingController.text) * 12.00;
    });
  }

  @override
   Widget build(BuildContext context) {
    // final border = OutlineInputBorder(
    //     borderSide: const BorderSide(
    //       color: CupertinoColors.black,
    //       width: 2.0,
    //       style: BorderStyle.solid,
    //     ),
    //     borderRadius: BorderRadius.circular(5));

    return CupertinoPageScaffold(
        backgroundColor: CupertinoColors.systemGrey3,
        navigationBar: const CupertinoNavigationBar(
          backgroundColor: CupertinoColors.systemGrey3,
          middle:  Text(
            'Currency Converter',
            style: TextStyle(color: CupertinoColors.white),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(9.0),
                  child: Text(
                    'GH₵ ${ result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.white,
                    ),
                  ),
                ),
                CupertinoTextField(
                  onSubmitted: (value) => debugPrint(value),
                  controller: textEditingController,
                  style: const TextStyle(color: CupertinoColors.black, fontSize: 14),
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  placeholder: 'Please enter the amount in USD',
                  prefix: const Icon(CupertinoIcons.money_dollar),
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true, signed: true),
                ),
                const SizedBox(height: 20),
                CupertinoButton(
                    onPressed: convert,
                    color: CupertinoColors.black,
                    child: const Text('Convert')),
              ],
            ),
          ),
        ));
  }
}
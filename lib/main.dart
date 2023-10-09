// import 'package:flutter/material.dart';

// void main() {
//   runApp(CurrencyConverterApp());
// }

// class CurrencyConverterApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Currency Converter',
//       home: CurrencyConverterScreen(),
//     );
//   }
// }

// class CurrencyConverterScreen extends StatefulWidget {
//   @override
//   _CurrencyConverterScreenState createState() =>
//       _CurrencyConverterScreenState();
// }

// class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
//   double amount = 0.0;
//   String fromCurrency = 'USD';
//   String toCurrency = 'EUR';
//   double result = 0.0;

//   Map<String, double> exchangeRates = {
//     'USD': 1.0,
//     'EUR': 0.85,
//     'GBP': 0.73,
//     // Add more currency exchange rates here
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Currency Converter'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'Enter Amount'),
//               onChanged: (value) {
//                 setState(() {
//                   amount = double.tryParse(value) ?? 0.0;
//                 });
//               },
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 DropdownButton<String>(
//                   value: fromCurrency,
//                   items: exchangeRates.keys.map((String currency) {
//                     return DropdownMenuItem<String>(
//                       value: currency,
//                       child: Text(currency),
//                     );
//                   }).toList(),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       fromCurrency = newValue ?? 'USD';
//                     });
//                   },
//                 ),
//                 Icon(Icons.arrow_forward),
//                 DropdownButton<String>(
//                   value: toCurrency,
//                   items: exchangeRates.keys.map((String currency) {
//                     return DropdownMenuItem<String>(
//                       value: currency,
//                       child: Text(currency),
//                     );
//                   }).toList(),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       toCurrency = newValue ?? 'EUR';
//                     });
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             // ElevatedButton(
//             // onPressed: convertCurrency,
//             // child: Text('Convert'),
//             // ),
//             SizedBox(height: 20),
//             Text(
//               'Result: $result $toCurrency',
//               style: TextStyle(fontSize: 18),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(CurrencyConverterApp());
}

class CurrencyConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      home: CurrencyConverterScreen(),
    );
  }
}

class CurrencyConverterScreen extends StatefulWidget {
  @override
  _CurrencyConverterScreenState createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  double amount = 0.0;
  String fromCurrency = 'INR';
  String toCurrency = 'USD';
  double result = 0.0;

  Map<String, double> exchangeRates = {
    'INR': 1.0,
    'USD': 0.012,
    'GBP': 0.73,
  };

  void convertCurrency() {
    if (fromCurrency == toCurrency) {
      setState(() {
        result = amount;
      });
    } else {
      setState(() {
        result = amount *
            (exchangeRates[toCurrency]! / exchangeRates[fromCurrency]!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Amount'),
              onChanged: (value) {
                setState(() {
                  amount = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: fromCurrency,
                  items: exchangeRates.keys.map((String currency) {
                    return DropdownMenuItem<String>(
                      value: currency,
                      child: Text(currency),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      fromCurrency = newValue ?? 'USD';
                    });
                  },
                ),
                Icon(Icons.arrow_forward),
                DropdownButton<String>(
                  value: toCurrency,
                  items: exchangeRates.keys.map((String currency) {
                    return DropdownMenuItem<String>(
                      value: currency,
                      child: Text(currency),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      toCurrency = newValue ?? 'EUR';
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertCurrency,
              child: Text('Convert'),
            ),
            SizedBox(height: 20),
            Text(
              'Result: $result $toCurrency',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

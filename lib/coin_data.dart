import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = 'your-key';
const coinURL = 'your-url';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<dynamic> getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      http.Response response =
          await http.get('$coinURL/$crypto/$selectedCurrency?apikey=$apiKey');
      if (response.statusCode == 200) {
        var lastPrice = jsonDecode(response.body)['rate'];
        cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
      } else {
        print('error found = ${response.statusCode}');
      }
    }
    return cryptoPrices;
  }
}

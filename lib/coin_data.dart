import 'package:http/http.dart' as http;
import 'dart:convert';

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

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'AEA4A616-F529-41FC-9191-6D3300882019';

class CoinData {
  Future getData(String selectedCurrency) async {
    Map<String, String> dataMap = {};
    for (String cryptoCoin in cryptoList) {
      String url = "$coinAPIURL/$cryptoCoin/$selectedCurrency?apikey=$apiKey";
      http.Response temp = await http.get(Uri.parse(url));

      if (temp.statusCode == 200) {
        String data = temp.body;
        dataMap[cryptoCoin] = jsonDecode(data)['rate'].toStringAsFixed(0);
      } else {
        print(temp.statusCode);
        throw 'Problem with the get request';
      }
    }
    return dataMap;
  }
}

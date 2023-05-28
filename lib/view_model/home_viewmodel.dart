import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:testdemo/models/currencyModel.dart';

import '../service.dart';

class HomeProvider extends ChangeNotifier {
  int i = 0;
  CurrencyModel? currencyModel;
  List<CurrencyModel> historyList = [];
  double usdPrice = 0, gbpPrice = 0, eurPrice = 0;
  List fibonacciList = [];
  List primeNumberList = [];
  List filterArrayList = [];
  String validateError = "";
  final TextEditingController controllerFibo = TextEditingController();
  final TextEditingController controllerprime = TextEditingController();
  final TextEditingController controllerfilter = TextEditingController();

  List filterArray1 = [1, 5, 3, 8, 7, 9, 11, 6],
      filterArray2 = [5, 3, 8, 7, 13, 2, 16];
  HomeProvider();
  init() {
    print('aaaaaaaaaaaaaaaa');
    callRestApi();
  }

  validate(String value) {
    int flag = 0, dupMoreTwo = 0, seqNumber = 0, reverseNumber = 0;
    String dupStr = '';
    for (var i = 0; i < value.length; i++) {
      if (i < value.length - 1 && value[i] == value[i + 1]) {
        if (value[i] != dupStr) {
          dupStr = value[i];
          flag++;
          // print('flag : $flag');
        } else {
          dupMoreTwo++;
          // print('dupMoreTwo : $dupMoreTwo');
        }
      }

      if (i < value.length - 1 &&
          int.parse(value[i]) + 1 == int.parse(value[i + 1])) {
        seqNumber++;
        // print('seqNumber :  $seqNumber');
      }
      if (i < value.length - 1 &&
          int.parse(value[i]) - 1 == int.parse(value[i + 1])) {
        reverseNumber++;
      }
    }

    // print(flag);
    if (flag >= 2) {
      validateError = 'ไม่ให้มีเลขซ้ำติดกันเกิน 2 ชุด';
    } else if (dupMoreTwo > 0) {
      validateError = 'ไม่ให้มีเลขซ้ำติดกันเกิน 2 ตัว';
    } else if (seqNumber >= 2 || reverseNumber >= 2) {
      validateError = 'ต้องกันไม่ให้มีเลขเรียงกันเกิน 2 ตัว';
    } else if (value.isEmpty) {
      validateError = 'Please enter some text';
    } else if (value.length < 6) {
      validateError = 'ความยาวต้องมากกว่าหรือเท่ากับ 6 ตัวอักษร';
    } else {
      validateError = '';
    }

    notifyListeners();
  }

  filterArray() {
    filterArrayList = [];
    for (var i = 0; i < filterArray1.length; i++) {
      for (var j = 0; j < filterArray2.length; j++) {
        if (filterArray1[i] == filterArray2[j]) {
          filterArrayList.add(filterArray1[i]);
        }
      }
    }
    controllerfilter.text = filterArrayList.toString();
    notifyListeners();
  }

  primeNumber() {
    primeNumberList = [];
    for (var j = 2; j < 100; j++) {
      int i, m = 0, flag = 0;
      m = j ~/ 2;
      for (i = 2; i <= m; i++) {
        if (j % i == 0) {
          flag = 1;
          break;
        }
      }
      if (flag == 0) {
        primeNumberList.add('$j');
      }
    }
    controllerprime.text = primeNumberList.toString();
    notifyListeners();
  }

  fibonacci() {
    fibonacciList = [];
    int n1 = 0, n2 = 1, n3;
    fibonacciList.add(n1);
    fibonacciList.add(n2);
    for (int i = 2; i <= 20; i++) {
      n3 = n1 + n2;
      fibonacciList.add(n3);
      n1 = n2;
      n2 = n3;
    }
    // print(fibonacciList.toString());
    controllerFibo.text = fibonacciList.toString();
  }

  currencyToBTC(String code, String value) {
    double parseValue = double.parse(value);
    switch (code) {
      case 'usd':
        usdPrice = parseValue / currencyModel!.bpi!.uSD!.rateFloat!;
        break;
      case 'gbp':
        gbpPrice = parseValue / currencyModel!.bpi!.gBP!.rateFloat!;
        break;
      case 'eur':
        eurPrice = parseValue / currencyModel!.bpi!.eUR!.rateFloat!;
        break;
    }
    notifyListeners();
  }

  Future callRestApi() async {
    while (true) {
      var jsonRes = await Service()
          .getMethod('https://api.coindesk.com/v1/bpi/currentprice.json');
      currencyModel = CurrencyModel.fromJson(jsonDecode(jsonRes));

      historyList.add(currencyModel!);

      notifyListeners();
      await Future.delayed(const Duration(minutes: 1));
    }
  }
}

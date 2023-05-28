import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testdemo/view/history.dart';

import '../view_model/home_viewmodel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    var initProvider = Provider.of<HomeProvider>(context, listen: false);
    initProvider.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
        backgroundColor: Colors.amber.shade400,
      ),
      body: Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: SingleChildScrollView(
          child: Consumer<HomeProvider>(
            builder: (context, pvd, child) => pvd.currencyModel == null
                ? Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: const CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      showPrice(context, pvd),
                      showHistory(context),
                      currencyToBTC(context, pvd),
                      fibonacci(pvd, context),
                      primeNumber(pvd, context),
                      filterArray(pvd, context),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 30, left: 30, right: 30),
                            // width: MediaQuery.of(context).size.width * 0.3,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                pvd.validate(value);
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'input',
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 30, bottom: 60),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              pvd.validateError,
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 13),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Column filterArray(HomeProvider pvd, BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => pvd.filterArray(),
          child: Container(
            margin: const EdgeInsets.only(top: 20, left: 25, right: 25),
            alignment: Alignment.center,
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.orange.shade200,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: const Text('FilterArray  >> Click << ',
                style: TextStyle(fontSize: 18)),
          ),
        ),
        Text('Array List 1 : ${pvd.filterArray1.toString()}'),
        Text('Array List 2 : ${pvd.filterArray2.toString()}'),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 80,
          child: TextField(
            enabled: false,
            controller: pvd.controllerfilter,
            maxLines: 8,
          ),
        ),
      ],
    );
  }

  Column primeNumber(HomeProvider pvd, BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => pvd.primeNumber(),
          child: Container(
            margin: const EdgeInsets.only(top: 20, left: 25, right: 25),
            alignment: Alignment.center,
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.orange.shade200,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: const Text('PrimeNumber >> Click <<',
                style: TextStyle(fontSize: 18)),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 80,
          child: TextField(
            enabled: false,
            controller: pvd.controllerprime,
            maxLines: 8,
          ),
        ),
      ],
    );
  }

  Column fibonacci(HomeProvider pvd, BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => pvd.fibonacci(),
          child: Container(
            margin: const EdgeInsets.only(top: 20, left: 25, right: 25),
            alignment: Alignment.center,
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.orange.shade200,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: const Text('Fibonacci >> Click <<',
                style: TextStyle(fontSize: 18)),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 80,
          child: TextField(
            enabled: false,
            controller: pvd.controllerFibo,
            maxLines: 8,
          ),
        ),
      ],
    );
  }

  Column currencyToBTC(BuildContext context, HomeProvider pvd) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 15, bottom: 10),
              width: MediaQuery.of(context).size.width * 0.3,
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  String result = value.isEmpty ? '0' : value;
                  pvd.currencyToBTC('usd', result);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'USD',
                ),
              ),
            ),
            const Text('  =  ', style: TextStyle(fontSize: 30)),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.45,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.orange.shade200,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Text('${pvd.usdPrice.toStringAsFixed(7)}',
                  style: const TextStyle(fontSize: 18)),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 15, bottom: 10),
              width: MediaQuery.of(context).size.width * 0.3,
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  String result = value.isEmpty ? '0' : value;
                  pvd.currencyToBTC('gbp', result);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'GBP',
                ),
              ),
            ),
            const Text('  =  ', style: TextStyle(fontSize: 30)),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.45,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.orange.shade200,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Text('${pvd.gbpPrice.toStringAsFixed(7)}',
                  style: const TextStyle(fontSize: 18)),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 15, bottom: 10),
              width: MediaQuery.of(context).size.width * 0.3,
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  String result = value.isEmpty ? '0' : value;
                  pvd.currencyToBTC('eur', result);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'EUR',
                ),
              ),
            ),
            const Text('  =  ', style: TextStyle(fontSize: 30)),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.45,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.orange.shade200,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Text('${pvd.eurPrice.toStringAsFixed(7)}',
                  style: const TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ],
    );
  }

  InkWell showHistory(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HistoryPage()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.8,
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.orange.shade200,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: const Text('History :  >> Click <<',
            style: TextStyle(fontSize: 18)),
      ),
    );
  }

  Container showPrice(BuildContext context, HomeProvider pvd) {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 30),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.8,
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.amber.shade300,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Text(
                '${pvd.currencyModel!.bpi!.uSD!.code} :  ${pvd.currencyModel!.bpi!.uSD!.rate}',
                style: const TextStyle(fontSize: 18)),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.8,
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.amber.shade300,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Text(
                '${pvd.currencyModel!.bpi!.gBP!.code} :  ${pvd.currencyModel!.bpi!.gBP!.rate}',
                style: const TextStyle(fontSize: 18)),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.8,
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.amber.shade300,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Text(
                '${pvd.currencyModel!.bpi!.eUR!.code} :  ${pvd.currencyModel!.bpi!.eUR!.rate}',
                style: const TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}

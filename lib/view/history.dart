import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testdemo/view_model/home_viewmodel.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        backgroundColor: Colors.orange.shade400,
      ),
      body: Consumer<HomeProvider>(
        builder: (context, pvd, child) => Center(
            child: ListView.builder(
          itemCount: pvd.historyList.length,
          itemBuilder: (context, index) {
            // return ListTile(
            //   title: Text('${pvd.historyList[index].time!.updated}'),
            //   subtitle: Column(
            //     children: <Widget>[
            //       Text(
            //           '${pvd.historyList[index].bpi!.uSD!.code} : ${pvd.historyList[index].bpi!.uSD!.rate}'),
            //       Text(
            //           '${pvd.historyList[index].bpi!.gBP!.code} : ${pvd.historyList[index].bpi!.gBP!.rate}'),
            //       Text(
            //           '${pvd.historyList[index].bpi!.eUR!.code} : ${pvd.historyList[index].bpi!.eUR!.rate}')
            //     ],
            //   ),
            // );
            return Container(
              margin: const EdgeInsets.only(
                  left: 30, top: 20, right: 30, bottom: 10),
              height: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.orange.shade400, Colors.orange.shade200]),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('${pvd.historyList[index].time!.updated}',
                      style: const TextStyle(fontSize: 18)),
                  Text(
                      '${pvd.historyList[index].bpi!.uSD!.code} : ${pvd.historyList[index].bpi!.uSD!.rate}',
                      style: const TextStyle(fontSize: 15)),
                  Text(
                      '${pvd.historyList[index].bpi!.gBP!.code} : ${pvd.historyList[index].bpi!.gBP!.rate}',
                      style: const TextStyle(fontSize: 15)),
                  Text(
                      '${pvd.historyList[index].bpi!.eUR!.code} : ${pvd.historyList[index].bpi!.eUR!.rate}',
                      style: const TextStyle(fontSize: 15))
                ],
              ),
            );
          },
        )),
      ),
    );
  }
}

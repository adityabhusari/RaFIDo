import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  List<String> busID = ['32', '298', '216'];
  List<String> departure = ['Katraj', 'Shivajinagar', 'Sahakarnagar'];
  List<String> arrival = ['Kothrud', 'Wanowrie', 'Camp'];
  List<String> date = ['29th April', '21st June', '25th May'];
  List<String> busfare = ['10', '30', '50'];
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: busID.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Text(busID[index]),
          trailing: Text(busfare[index]),
          title: Column(
            children: [
              Row(
                children: [
                  Text(departure[index]),
                  Text("-->"),
                  Text(arrival[index]),
                ],
              ),
              Center(child: Text(date[index])),
            ],
          ),
         
        );
      },
    );
  }
}

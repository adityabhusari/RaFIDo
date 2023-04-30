import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  List<String> busID = ['32', '298', '216'];
  List<String> departure = ['Katraj', 'Shivajinagar', 'Sahakarnagar'];
  List<String> arrival = ['Kothrud', 'Wanowrie', 'Camp'];
  List<String> date = ['29th April', '21st June', '25th May'];
  List<String> busfare = ['10', '30', '50'];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Travel History"),
        elevation: 2,
      ),
      body: ListView.builder(
        itemCount: busID.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 2,
            child: ListTile(
              leading: Text(busID[index]),
              trailing: Text(busfare[index]),
              title: Column(
                children: [
                  Center(child:
                  Row(
                    children: [
                      Text(departure[index]),
                      Text("-->"),
                      Text(arrival[index]),
                    ],
                  ),
                  ),
                  Center(child: Text(date[index])),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

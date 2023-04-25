import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapido/view_models/bus_viewmodel.dart';

class BusListScreen extends StatefulWidget {
  const BusListScreen({super.key});

  @override
  State<BusListScreen> createState() => _BusListScreenState();
}

class _BusListScreenState extends State<BusListScreen> {
  @override
  Widget build(BuildContext context) {
    final busVM = Provider.of<BusViewModel>(context, listen: true);

    return Scaffold(
        appBar: AppBar(
          title: Text("Bus Routes"),
          elevation: 2,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  busVM.setQuery(value);
                },
                decoration: InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 64, 0, 0),
              child: ListView.builder(
                itemCount: busVM.filteredTrips.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(busVM.filteredTrips[index].headsign),
                    subtitle: Text(busVM.filteredTrips[index].routeID),
                    onTap: () {
                      busVM.selectedBus = busVM.filteredTrips[index];
                      Navigator.pushNamed(context, "/bus");
                    },
                  );
                },
              ),
            ),
            if (busVM.isLoading)
              Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ));
  }
}

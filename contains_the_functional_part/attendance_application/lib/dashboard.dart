import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  bool isSwitched = false;

  Future<Position> getCurrentLocation() async {

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission;

    if (!serviceEnabled) {

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {

      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
      
      
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Transform.scale(
            scale: 2,
            child: Switch(
                activeColor: Colors.deepPurple,
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    getCurrentLocation().then((value) {
                      print(value);
                    })
                    .catchError((error) {
                      print(error);
                    });

                    // take the switch output from here
                    print(isSwitched);
                  });
                }),
          ),
        ]),
      ),
    );
  }
}

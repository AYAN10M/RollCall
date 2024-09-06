import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

class MyDashBoard extends StatefulWidget {
  const MyDashBoard({super.key});

  @override
  State<MyDashBoard> createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {
  bool isSwitched = false;
  String switchStatus = "Switch is OFF";
  String attendanceStatus = "Out of Zone";
  double distance = 0.0;
  final double officeLatitude = 22.556423;
  final double officeLongitude = 88.414450;
  DateTime? checkInTime;
  Timer? timer;
  String timerDisplay = "00:00:00";

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

  void calculateDistance(Position currentPosition) {
    distance = Geolocator.distanceBetween(
      currentPosition.latitude,
      currentPosition.longitude,
      officeLatitude,
      officeLongitude,
    );

    setState(() {
      attendanceStatus =
          distance <= 50.0 ? "Recording Attendance" : "Out of Zone";
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        final duration = DateTime.now().difference(checkInTime!);
        timerDisplay = duration.toString().split('.').first.padLeft(8, "0");
      });
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  void handleSwitchChanged(bool value) {
    setState(() {
      isSwitched = value;

      if (isSwitched) {
        getCurrentLocation().then((Position position) {
          calculateDistance(position);

          if (attendanceStatus == "Recording Attendance") {
            checkInTime = DateTime.now();
            startTimer();
          }
        }).catchError((error) {
          switchStatus = "Error: $error";
        });
      } else {
        switchStatus = "Switch is OFF";
        stopTimer();
        timerDisplay = "00:00:00"; // Reset timer display
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 131, 197, 190),
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.info,
                color: Color.fromARGB(255, 0, 109, 119), size: 30),
            onPressed: () {},
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(Icons.settings,
                color: Color.fromARGB(255, 0, 109, 119), size: 30),
            onPressed: () {},
          ),
          const SizedBox(width: 20)
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.scale(
              scale: 2,
              child: Switch(
                activeColor: const Color.fromARGB(255, 0, 109, 119),
                value: isSwitched,
                onChanged: handleSwitchChanged,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 5,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isSwitched) ...[
                    const Text(
                      "Switch is OFF",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ] else if (attendanceStatus == "Recording Attendance") ...[
                    const Text(
                      "Recording Attendance",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Check-In Time: ${checkInTime != null ? "${checkInTime!.hour}:${checkInTime!.minute}" : "---"}",
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black87),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Total Time: $timerDisplay",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ] else ...[
                    Column(
                      children: [
                        const Text("Out of Range",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                        Text(
                          "Distance from Office: ${distance.toStringAsFixed(2)} meters",
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black54),
                        ),
                      ],
                    ),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

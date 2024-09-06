import 'package:attendance_application/pages/profile_page/tab_container.dart';
import 'package:flutter/material.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 246, 249),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 0, 109, 119),

                // Add this to add shadow to the container
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black26,
                //     blurRadius: 10,
                //     offset: Offset(0, 10),
                //   ),
                // ],

                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  // Profile Picture
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage('assets/img/profile.jpg'),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: const Color.fromARGB(255, 237, 246, 249),
                        width: 4,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Profile Details
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Adolf Hitler',
                        style: TextStyle(
                          fontSize: 30,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'GreatVibes',
                          color: Color.fromARGB(255, 237, 246, 249),
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(children: [
                        Icon(
                          Icons.email,
                          color: Colors.white70,
                          size: 18,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'john.doe@example.com',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                            fontFamily: 'Tomorrow',
                          ),
                        ),
                      ]),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.white70,
                            size: 18,
                          ),
                          SizedBox(width: 8),
                          Text(
                            '+123 456 7890',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Tomorrow',
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.work,
                            color: Colors.white70,
                            size: 18,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Software Developer',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Tomorrow',
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            // The buttom tab Container
            const MyTabContainer(),
          ],
        ),
      ),
    );
  }
}

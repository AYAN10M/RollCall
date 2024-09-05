import 'package:flutter/material.dart';
import 'package:tab_container/tab_container.dart';

class MyTabContainer extends StatefulWidget {
  const MyTabContainer({super.key});

  @override
  State<MyTabContainer> createState() => _MyTabContainerState();
}

class _MyTabContainerState extends State<MyTabContainer>
    with SingleTickerProviderStateMixin {
  late TabController _tabController = TabController(length: 3, vsync: this);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabContainer(
      controller: _tabController,
      tabEdge: TabEdge.top,
      tabsStart: 0.0,
      tabsEnd: 1,
      tabMaxLength: 200,
      borderRadius: BorderRadius.circular(10),
      tabBorderRadius: BorderRadius.circular(10),
      childPadding: const EdgeInsets.all(20.0),
      selectedTextStyle: const TextStyle(
        color: Color.fromARGB(255, 237, 246, 249),
        fontSize: 16.0,
      ),
      unselectedTextStyle: const TextStyle(
        color: Color.fromARGB(255, 0, 109, 119),
        fontSize: 16.0,
      ),
      colors: const [
        Color.fromARGB(255, 131, 197, 190),
        Color.fromARGB(255, 226, 149, 120),
      ],
      tabs: const [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            Icons.person,
            color: Color.fromARGB(255, 237, 246, 249),
            size: 20,
          ),
          SizedBox(width: 10),
          Text('Personal Info', style: TextStyle(fontFamily: 'Tomorrow')),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            Icons.person,
            color: Color.fromARGB(255, 237, 246, 249),
            size: 20,
          ),
          SizedBox(width: 10),
          Text('Company Info', style: TextStyle(fontFamily: 'Tomorrow')),
        ]),
      ],
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.3,
          // data for child 1 will be added later when backend is added
          child: const Column(children: [
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.date_range_outlined, size: 24, color: Colors.white),
                SizedBox(width: 10),
                Text('Date of Birth:\n20th April 1889',
                    style: TextStyle(
                        fontFamily: 'Tomorrow',
                        fontSize: 16,
                        color: Colors.white)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.location_on_outlined, size: 24, color: Colors.white),
                SizedBox(width: 10),
                Text(
                    'Address: \nNo. 1, Basanti Hwy, \nBrahmapur Government Colony, \nBagdoba, Kolkata, Hadia, \nWest Bengal 700150',
                    style: TextStyle(
                        fontFamily: 'Tomorrow',
                        fontSize: 16,
                        color: Colors.white)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.document_scanner_rounded,
                    size: 24, color: Colors.white),
                SizedBox(width: 10),
                Text('Document ID:\n1234 5678 9012 [Aadhhar Card]',
                    style: TextStyle(
                        fontFamily: 'Tomorrow',
                        fontSize: 16,
                        color: Colors.white)),
              ],
            ),
          ]),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.3,
          child: const Column(children: [
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.contacts_sharp, size: 24, color: Colors.white),
                SizedBox(width: 10),
                Text('Employee ID:\n1234',
                    style: TextStyle(
                        fontFamily: 'Tomorrow',
                        fontSize: 16,
                        color: Colors.white)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.contacts_outlined, size: 24, color: Colors.white),
                SizedBox(width: 10),
                Text('Office ID:\n2255',
                    style: TextStyle(
                        fontFamily: 'Tomorrow',
                        fontSize: 16,
                        color: Colors.white)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.date_range_outlined, size: 24, color: Colors.white),
                SizedBox(width: 10),
                Text('Date of Joining:\n20th April 1889',
                    style: TextStyle(
                        fontFamily: 'Tomorrow',
                        fontSize: 16,
                        color: Colors.white)),
              ],
            ),
          ]),
        ),
      ],
    );
  }
}

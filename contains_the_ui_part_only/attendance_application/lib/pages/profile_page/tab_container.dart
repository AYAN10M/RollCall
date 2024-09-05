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
        color: Colors.white,
        fontSize: 15.0,
      ),
      unselectedTextStyle: const TextStyle(
        color: Color.fromARGB(255, 0, 109, 119),
        fontSize: 13.0,
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
          ),
          Text('Personal Info')
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            Icons.person,
            color: Color.fromARGB(255, 237, 246, 249),
          ),
          Text('Company Info'),
        ]),
      ],
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.4,
          // data for child 1 will be added later when backend is added
          child: const Text('Child 1'),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.4,
          child: const Text('Child 2'),
        ),
      ],
    );
  }
}

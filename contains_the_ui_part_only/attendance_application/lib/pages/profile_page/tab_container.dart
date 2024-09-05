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
        color: Colors.black,
        fontSize: 13.0,
      ),
      colors: const [
        Colors.red,
        Colors.green,
      ],
      tabs: const [
        Text('Personal Info'),
        Text('Company Info'),
      ],
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.4,
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

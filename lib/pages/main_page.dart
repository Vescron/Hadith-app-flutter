// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hadith_app/pages/home.dart';
import 'package:hadith_app/pages/book_selection.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages = [
    HomePage(),
    BookSelection(),
  ];

int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      bottomNavigationBar: MediaQuery.of(context).size.width > 600 ?
      null : NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });   
        },
       // indicatorColor: Color.fromARGB(255, 255, 209, 209),
        selectedIndex: currentIndex,
       // backgroundColor: Color.fromARGB(255, 255, 246, 145),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.book_rounded),
            label: 'Books',
          ),],
      ),
      body: MediaQuery.of(context).size.width > 600 ?
      Row(
        children: [
          NavigationRail(
            selectedIndex: currentIndex,
            onDestinationSelected: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            extended: false,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.book_rounded),
                label: Text('Books'),
              ),
            ],
          ),
         // VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: IndexedStack(
              index: currentIndex,
              children: pages,
            ),
          ),
        ],
      ) 
      : IndexedStack(
        index : currentIndex,
        children: pages,
      ),
    );
  }
}
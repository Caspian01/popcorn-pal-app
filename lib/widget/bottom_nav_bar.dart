import 'package:flutter/material.dart';
import 'package:movie_app_flutter/screens/homescreen.dart';
import 'package:movie_app_flutter/screens/more_screen.dart';
import 'package:movie_app_flutter/screens/search_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.black,
          height: 70,
          child: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.home),
              text: "Home",
            ),
            Tab(
              icon: Icon(Icons.search),
              text: "Search",
            ),
            Tab(
              icon: Icon(Icons.photo_library_outlined),
              text: "New & Hot",
            )

          ],
          indicatorColor: Colors.transparent,
          labelColor: Colors.white,
          unselectedLabelColor: Color(0xff999999)
          )
        ),
        body: const TabBarView(children: [
          HomeScreen(),
          SearchScreen(),
          MoreScreen()
        ],)
      ),

    );
  }
}
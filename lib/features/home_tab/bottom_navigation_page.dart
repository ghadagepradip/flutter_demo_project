import 'package:demo_project/features/home_tab/home_tab_page.dart';
import 'package:flutter/material.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeTabPage(),
    const FreeTrailTabPage(),
    const SearchTabPage(),
    const MySpaceTabPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.diamond_outlined),
            label: "Free Trail",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "My Space",
          ),
        ],
      ),
    );
  }
}

class FreeTrailTabPage extends StatelessWidget {
  const FreeTrailTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Free Trail Page"));
  }
}

class SearchTabPage extends StatelessWidget {
  const SearchTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Search Page"));
  }
}

class MySpaceTabPage extends StatelessWidget {
  const MySpaceTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Profile Page"));
  }
}

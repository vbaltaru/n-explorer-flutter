import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/search_screen.dart';
import 'screens/my_list_screen.dart';
import 'screens/profile_screen.dart'; // ASIGURĂ-TE CĂ AI ACEST IMPORT

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Modificăm aici: Când selectăm tab-ul 2 (My List), afișăm direct ecranul
      // pentru a forța reîncărcarea datelor. Pentru restul, folosim IndexedStack.
      body: _selectedIndex == 2
          ? const MyListScreen()
          : IndexedStack(
              index: _selectedIndex,
              children: const [
                HomeScreen(),
                SearchScreen(),
                SizedBox(), // Placeholder pentru index 2
                ProfileScreen(),
              ],
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF0F0F0F),
        selectedItemColor: const Color(0xFFE50914),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'My List'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

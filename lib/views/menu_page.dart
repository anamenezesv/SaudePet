import 'package:flutter/material.dart';
import 'package:saude_pet/views/main_page.dart';

void main() {
  runApp(MenuPage());
}

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PetPage(),
    );
  }
}

class PetPage extends StatefulWidget {
  @override
  _PetPageState createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(30, 90, 160, 10),
              child: Text(
                'Olá',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xFF2f8057),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 0, 230, 10),
              child: Text(
                'Como está seu pet hoje?',
                style: TextStyle(fontSize: 13.0),
                textAlign: TextAlign.left,
              ),
            ),
            Card(
              margin: EdgeInsets.all(16.0),
              child: ListTile(
                leading: Icon(
                  Icons.pets,
                  color: Color(0xFF2f8057),
                ),
                title: Text('Shelby'),
                subtitle: Text('Raça: Yorkshire'),
              ),
            ),
            Card(
              margin: EdgeInsets.all(16.0),
              child: ListTile(
                leading: Icon(
                  Icons.local_hospital,
                  color: Color(0xFF2f8057),
                ),
                title: Text('Saúde do Pet'),
                subtitle: Text('Última visita ao veterinário: 15/09/2023'),
              ),
            ),
            Card(
              margin: EdgeInsets.all(16.0),
              child: ListTile(
                leading: Icon(
                  Icons.pets,
                  color: Color(0xFF2f8057),
                ),
                title: Text('Alimentação do Pet'),
                subtitle: Text('Hora da última refeição: 15:00'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Alimentar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Veterinários',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF2f8057),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if(index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      }
    });
  }
}
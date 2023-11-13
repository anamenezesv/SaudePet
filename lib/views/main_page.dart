import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:saude_pet/views/menu_page.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  TextEditingController _horarioController = TextEditingController();

  final double borderRadius = 10.0;
  final Color borderColor = Color(0xFF2f8057);
  final double emailBorderWidth = 4.0;

  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 90, 160, 10),
                child: Text(
                  'Alimentador Automático',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 230, 10),
                child: Text(
                  'Defina a dieta do seu pet',
                  style: TextStyle(fontSize: 13.0),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextFormField(
                  controller: _horarioController,
                  decoration: InputDecoration(
                    labelText: 'Defina um período para alimentação (minutos)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                      borderSide: BorderSide(
                        color: borderColor,
                        width: emailBorderWidth,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    onPressed: () {
                      // Ação ao pressionar o botão "Definir"
                      print(_horarioController.text);
                      _showSuccessToast(context); // Exibe o toast de sucesso
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(borderRadius),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF2f8057)),
                    ),
                    child: Text('Definir', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextButton(
                    onPressed: () {
                      // Ação ao pressionar o botão "Sair"
                      _onItemTapped(context, 0); // Chama o método para navegação
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Color(0xFF2f8057)),
                    ),
                    child: Text('Sair'),
                  ),
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
          onTap: (index) => _onItemTapped(context, index),
        ),
      ),
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    if (_selectedIndex != index) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MenuPage()),
      );
    }
  }

  void _showSuccessToast(BuildContext context) {
    Fluttertoast.showToast(
      msg: "Dieta definida com sucesso!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}

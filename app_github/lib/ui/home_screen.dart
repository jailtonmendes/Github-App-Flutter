import 'package:app_github/ui/restults_Screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _username = TextEditingController();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Container(
              width: double.maxFinite,
              height: 300.0,
              decoration: const BoxDecoration(
                // color: Colors.amberAccent,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
              ),
              child: Image.asset(
                'assets/images/github.png',
                height: 100,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  style: const TextStyle(fontSize: 22, color: Colors.black),
                  controller: _username,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0), width: 1),
                      ),
                      labelText: 'username',
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'username'),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RestultsScreen(username: _username.value.text),
                        ),
                      );
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    child: const Text('Buscar', style: TextStyle(fontSize: 24)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

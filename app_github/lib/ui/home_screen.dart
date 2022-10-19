import 'package:app_github/ui/restults_Screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            // color: const Color.fromARGB(255, 211, 25, 25),
            width: double.maxFinite,
            height: 300.0,
            decoration: const BoxDecoration(
              color: Colors.amberAccent,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
            ),
            child: Image.asset(
              'assets/images/github.png',
              height: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.amberAccent, width: 1),
                      ),
                      labelText: 'username',
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'username'),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RestultsScreen()));
                    },
                    style: const ButtonStyle(),
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

import 'package:flutter/material.dart';

import '../shared/components/components.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  String? selectedItem = 'Item 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Outdoor Calculator'),
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              setState(
                () {
                  selectedItem = value;
                },
              );
            },
            itemBuilder: (context) {
              return items.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          //           decoration: const BoxDecoration(
          //   borderRadius: BorderRadius.all(Radius.circular(40)),
          //   color: Colors.white,
          // ),
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    // CircleAvatar(
                    //   radius: 75,
                    //   backgroundColor: const Color.fromARGB(255, 250, 250, 242),
                    //   child: Image.asset('images/murad.png'),
                    // ),
                    Row(
                      children: [
                        textInBut(),
                        const Text(
                          '          العرض',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        textInBut(),
                        const Text(
                          '     جانب يمين',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        textInBut(),
                        const Text(
                          '     جانب يسار',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        textInBut(),
                        const Text(
                          '          الأرتفاع',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        textInBut(),
                        const Text(
                          '          البطنية',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        textInBut(),
                        const Text(
                          '             الكاب',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        textInBut(),
                        const Text(
                          '        التسقيف',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        textInBut(),
                        const Text(
                          '      سعر المتر',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    button(
                      width: 200,
                      function: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CalculateTotal(),
                          ),
                        );
                      },
                      text: ' Calculate',
                      isUpperCase: false,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CalculateTotal extends StatelessWidget {
  const CalculateTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Total Calculator'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  textInBut(enabled: false),
                  const Text(
                    ' مجموع الامتار',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  textInBut(
                    enabled: false,
                  ),
                  const Text(
                    '        المجموع',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

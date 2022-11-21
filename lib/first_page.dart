import 'package:flutter/material.dart';
import 'layout/home_layout.dart';
import 'modules/calculator.dart';
import 'operations_plan.dart';
import 'shared/components/components.dart';
import 'tasks/screens/home_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 46.0,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
              const Text(
                'Mohamed Springy',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'App Developer',
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Developer@MuradAgency.com',
                style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Account'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Log Out'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              button(
                width: double.infinity,
                text: 'Tasks To Do',
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              button(
                width: double.infinity,
                text: 'Operations',
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OperationPlan(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              button(
                width: double.infinity,
                text: 'Calculator',
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Calculator(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
}

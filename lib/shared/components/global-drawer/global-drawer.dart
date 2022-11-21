import 'package:flutter/material.dart';

Widget GlobalDrawer() {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          child: Column(
            children: const [
              CircleAvatar(
                radius: 46.0,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
              Text(
                'Mohamed Springy',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'App Developer',
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Developer@MuradAgency.com',
                style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
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
  );
}
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text("Menu", style: TextStyle(color: Colors.grey)),

          ),
          ListTile(
              leading: IconButton(
                icon: Icon(Icons.home),
                color: Colors.lightBlue,
                tooltip: 'Home',
                onPressed: () => Navigator.pushNamed(context, '/main'),
              ),
              title: Text('Home', style: TextStyle(color: Colors.lightBlue),)
          ),
          ListTile(
              leading: IconButton(
                icon: Icon(Icons.settings_applications_sharp),
                color: Colors.lightBlue,
                tooltip: 'Settings',
                onPressed: () => Navigator.pushNamed(context, '/settings'),
              ),
              title: Text('Settings', style: TextStyle(color: Colors.lightBlue),)
          ),
          ListTile(
              leading: IconButton(
                icon: Icon(Icons.power_settings_new_outlined),
                color: Colors.lightBlue,
                tooltip: 'Exit',
                onPressed: () => print('Exit'),
              ),
              title: Text('Exit', style: TextStyle(color: Colors.lightBlue),)
          ),
        ],
      ),
    );
  }
}

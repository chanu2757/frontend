import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:bs_flutter_buttons/bs_flutter_buttons.dart';

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  void initState() {
    super.initState();
    bootstrapGridParameters(
      gutterSize: 30,
    );
  }

  Widget _sidebar(BuildContext context) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _sidebar(context),
      appBar: AppBar(
        title: Container(
          child: Image.asset("imgs/appbar.jpg"),
          height: AppBar().preferredSize.height * 0.95,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu),
                color: Colors.lightBlue,
                tooltip: 'Menu',
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            }
        ),
      ),
      body: SingleChildScrollView(

      ),
    );
  }
}


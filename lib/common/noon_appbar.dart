import 'package:flutter/material.dart';

class AppBar1 extends StatelessWidget with PreferredSizeWidget{
  const AppBar1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
      );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class AppBar2 extends StatelessWidget with PreferredSizeWidget{
  const AppBar2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
      actions: <Widget>[
        Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.search_outlined),
                color: Colors.lightBlue,
                tooltip: 'Search',
                iconSize: AppBar().preferredSize.height * 0.7,
                onPressed: () => print('search'),
              );
            }
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

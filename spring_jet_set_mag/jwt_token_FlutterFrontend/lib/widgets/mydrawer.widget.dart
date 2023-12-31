import 'package:flutter/material.dart';
import 'package:jwt_token/global/global.parameter.dart';
import 'package:jwt_token/widgets/drawer.header.widget.dart';
import 'package:jwt_token/widgets/drawer.item.widget.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          MyDrawerHeaderWidget(),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                height: 2,
                color: Colors.deepPurple,
              ),
              itemCount: GlobalParameters.menus.length,
              itemBuilder: (context, index) => DrawerItemWidget(
                  GlobalParameters.menus[index]['title'],
                  GlobalParameters.menus[index]['route'],
                  GlobalParameters.menus[index]['icon']),
            ),
          ),
        ],
      ),
    );
  }
}

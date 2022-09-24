import 'package:flutter/material.dart';

import 'sliverAppBar.dart';

class TabBarSliverAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(

    floatingActionButton: FloatingActionButton(
      child:Icon(Icons.arrow_forward_ios,
      ),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => BasicSliverAppBar()));


      },),

    body: DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverAppBar(
              title: Text('Tab Bar with Sliver'),
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.map), text: 'Tab 1'),
                  Tab(icon: Icon(Icons.portrait), text: 'Tab 2'),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          children: [
            buildImages(),
            buildImages(),
          ],
        ),
      ),
    ),
  );

  Widget buildImages() => GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
    ),
    itemCount: 20,
    itemBuilder: (context, index) => ImageWidget(index: index),
  );
}
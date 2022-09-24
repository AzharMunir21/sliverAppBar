import 'package:flutter/material.dart';

import 'advanceSliverAppBarr.dart';

class BasicSliverAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(

    floatingActionButton: FloatingActionButton(
      child:Icon(Icons.arrow_forward_ios,
      ),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AdvancedSliverAppBar()));


      },),

    body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.red,
          expandedHeight: 200,
          floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              'https://source.unsplash.com/random?monochromatic+dark',
              fit: BoxFit.cover,
            ),
            title: Text('Flexible Title'),
            centerTitle: true,
          ),
          //title: Text('My App Bar'),
          leading: Icon(Icons.arrow_back),
          actions: [
            Icon(Icons.settings),
            SizedBox(width: 12),
          ],
        ),
        buildImages(),
      ],
    ),
  );

  Widget buildImages() => SliverToBoxAdapter(
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      primary: false,
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index) => ImageWidget(index: index,),
    ),
  );
}
class ImageWidget extends StatelessWidget {
  final int index;

  const ImageWidget({

    required this.index,
  }) ;

  @override
  Widget build(BuildContext context) => Container(
    height: 150,
    width: double.infinity,
    child: Card(
      child: Image.network(
        'https://source.unsplash.com/random?sig=$index',
        fit: BoxFit.cover,
      ),
    ),
  );
}
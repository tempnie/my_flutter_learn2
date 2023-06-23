import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nested ListView Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Material(
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: const Text('嵌套ListView'),
                  pinned: true,
                  forceElevated: innerBoxIsScrolled,
                ),
                buildSliverList(5),
              ];
            },
            body: ListView.builder(
              padding: const EdgeInsets.all(8),
              physics: const ClampingScrollPhysics(),
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 50,
                  child: Center(child: Text('Item $index')),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  SliverList buildSliverList(int itemCount) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            height: 100,
            color: Colors.grey[200],
            child: Center(child: Text('Sliver Item $index')),
          );
        },
        childCount: itemCount,
      ),
    );
  }
}

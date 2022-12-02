// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Numbers',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Random Numbers'),
        ),
        body: const Center(
          child: RandomNumbers(),
        ),
      ),
    );
  }
}

class RandomNumbers extends StatefulWidget {
  const RandomNumbers({super.key});

  @override
  State<RandomNumbers> createState() => _RandomNumbersState();
}

class _RandomNumbersState extends State<RandomNumbers> {

  final items = List<ListItem>.generate(100,(i) => HeadingItem(i+1));
  Iterable<ListItem> tmpItems = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: tmpItems.length + 2,
      itemBuilder: (context, i) {
        if (i == 0) {
          return FloatingActionButton(
            onPressed: () {
              showEven();
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.navigation),
          );
        }
        if (i == 1) {
          return FloatingActionButton(
            onPressed: () {
              showID();
            },
            backgroundColor: Colors.red,
            child: const Icon(Icons.navigation),
          );
        }
        final item = tmpItems.elementAt(i-2);
        return ListTile(
          title: item.buildTitle(context),
        );
      },
    );
  }

  /*
  Convert items to tmpItems but only keep even numbers
   */
  void showEven() {
    setState(() {
      tmpItems = items.where((item) => item.number.isEven);
    });
  }
  void showID() {
    setState(() {
      tmpItems = items.where((item) => "620510596".contains(item.number.toString()));
    });
  }
}

abstract class ListItem {
  late final int number;
  Widget buildTitle(BuildContext context);
}

class HeadingItem implements ListItem {

  HeadingItem(this.number);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      number.toString(),
      style: Theme.of(context).textTheme.headline5,
    );
  }

  @override
  int number;
}


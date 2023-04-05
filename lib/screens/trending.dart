import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../components/appbar.dart';

class Trending extends StatelessWidget {
  const Trending({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(context),
      body: Center(
        child: Column(children: [
          Text("trending page",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)
        ]),
      ),
    );
  }
}
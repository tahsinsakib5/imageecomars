import 'package:finalimagep/maindesing/dard.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                    image: AssetImage("assets/banner.png"), fit: BoxFit.cover)),
          ),
          Row(
            children: [
              smallcard()
            ],
          ),

          
        ],
      ),
    );
  }
}

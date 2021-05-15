import 'package:animation_demo/bar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.red,
    Colors.green
  ];
  List<int> durations = [600, 700, 800, 600, 700, 800];
  List<double> heights = [50, 75, 60, 30, 25, 80];

  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          setState(() {
            status = !status;
          });
          print(status);
        },
        child: status
            ? Icon(Icons.pause, color: Colors.white)
            : Icon(Icons.play_arrow, color: Colors.white),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: bars(),
        ),
      ),
    );
  }

  Widget bars() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return BarWidget(
              status: status,
              color: colors[index],
              duration: durations[index],
              height: heights[index]);
        },
        itemCount: colors.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
      ),
      // child: BarWidget(
      //   color: Colors.red,
      //   duration: 1,
      // ),
    );
  }
}

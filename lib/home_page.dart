import 'package:animation_demo/bar_widget.dart';
import 'package:animation_demo/models/state.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

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
    Colors.green,
    Colors.blue
  ];
  List<int> durations = [200, 300, 400, 200, 300, 400, 200];
  List<double> heights = [18, 36, 56, 18, 36, 56, 18];

  bool status;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    status = Provider.of<WaveState>(context).state;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Provider.of<WaveState>(context, listen: false).updateState(!status);
        },
        child: status
            ? Icon(Icons.pause, color: Colors.white)
            : Icon(Icons.play_arrow, color: Colors.white),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            height: 200,
            width: double.maxFinite,
            child: Lottie.asset(
              'assets/soundwave.json',
              repeat: status,
              reverse: status,
              animate: status,
            ),
          ),
          Flexible(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: bars(),
              ),
            ),
          ),
        ],
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
    );
  }
}

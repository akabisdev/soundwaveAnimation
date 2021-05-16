import 'package:animation_demo/models/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main() {
  runApp(AnimationDemo());
}

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WaveState>(
      create: (context) => WaveState(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

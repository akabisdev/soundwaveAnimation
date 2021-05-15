import 'package:flutter/material.dart';

class BarWidget extends StatefulWidget {
  final status;
  final color;
  final duration;
  final height;

  const BarWidget(
      {Key key, this.color, this.duration, this.status, this.height})
      : super(key: key);

  @override
  _BarWidgetState createState() => _BarWidgetState();
}

class _BarWidgetState extends State<BarWidget>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;
  bool stop = true;
  double height;

  @override
  void initState() {
    super.initState();
    height = widget.height;
    print('init');
    animationController = AnimationController(
        duration: Duration(milliseconds: widget.duration), vsync: this);
    final curvedAnimation = CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutSine);
    animation = Tween<double>(begin: 10, end: 100).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
    print(widget.status);
    animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    stop = widget.status;
    if (stop) {
      height = animation.value;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          // duration: Duration(seconds: 1),
          height: !stop ? height : animation.value,
          width: 10,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: widget.color,
              borderRadius: BorderRadius.circular(4)),
        ),
      ),
    );
  }

  @override
  void dispose() {
    print('disposing');
    animationController.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
   Indicator({super.key,required this.currentIndex,required this.currentPosition});
 int currentIndex  ;
 int currentPosition ;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 10,
      backgroundColor: currentIndex == currentPosition ? Colors.blueGrey : Colors.grey,
    );
  }
}

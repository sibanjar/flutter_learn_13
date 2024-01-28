import 'dart:developer';

import 'package:circle_list/circle_list.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'data.dart';

class CircularPage extends StatefulWidget {
  const CircularPage({Key? key}) : super(key: key);

  @override
  State<CircularPage> createState() => _CircularPageState();
}

class _CircularPageState extends State<CircularPage> {
  List<String> num1 = [];
  double initialAngle = math.pi / 2;
  double lastValidAngle = math.pi / 2;
  double initialCoordsAngle = -1;
  bool isDragCrossed = false;

  @override
  void initState() {
    num1 = Numbers.num;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circle List Test'),
      ),
      body: SizedBox(
        child: CircleList(
          initialAngle: initialAngle,
          innerCircleColor: Colors.redAccent,
          outerCircleColor: Colors.greenAccent,
          origin: const Offset(0, 0),
          showInitialAnimation: true,
          onDragStart: (PolarCoord cords) {
            if(initialCoordsAngle<0){
              initialCoordsAngle = cords.angle;
            }
          },
          onDragEnd: () {
            setState(() {
              // Reset the flag for the next drag
              isDragCrossed = false;
              initialCoordsAngle = -1;
            });
          },
          onDragUpdate: (PolarCoord cords) {
            double angle = cords.angle;

            // Calculate the portion size (360 degrees / 12 portions)
            double portionSize = 360 / 12;

            // Calculate the portion index
            int portionIndex = ((angle - initialCoordsAngle) / portionSize).floor();

            // Calculate the starting and ending angles of the current portion
            double portionStartAngle = initialCoordsAngle + portionIndex * portionSize;
            double portionEndAngle = portionStartAngle + portionSize;

            // Check if the drag has crossed more than 50% of the current portion
            if (!isDragCrossed &&
                (angle - portionStartAngle > portionSize / 2 || angle - portionStartAngle < -portionSize / 2)) {
              setState(() {
                // Update drag logic here
                // For demonstration, let's rotate the circle based on the drag
                log('Drag crossed more than 50%');
                isDragCrossed = true;
                initialAngle = angle;
                lastValidAngle = angle;
              });
            } else {
              // Return to the last valid position
              setState(() {
                // You may want to add a transition effect here
                log('Drag did not cross more than 50%');
                initialAngle = lastValidAngle;
              });
            }
          },
          children: num1.asMap().entries.map((entry) {
            final String number = entry.value;
            final int index = entry.key;
            return CircleAvatar(
              backgroundColor: Colors.grey,
              child: Text(number),
            );
          }).toList(),
        ),
      ),
    );
  }
}

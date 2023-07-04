import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final String add;
  final VoidCallback onPressing;

  ReusableCard({required this.add,required this.onPressing});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50.0,
      width: 180.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF36D1DC), Color(0xFF5B86E5)],   // Set the gradient colors
        ),
        borderRadius: BorderRadius.circular(10),   // Match the border radius of the card
      ),
      child: MaterialButton(
        elevation: 10.0,
        onPressed: onPressing,
        minWidth: 200.0,
        height: 42.0,
        child: Text(
          style: TextStyle(color: Colors.white60,fontSize: 20.0,fontWeight: FontWeight.w600),
          add,
        ),
      ),

    );


  }
}
import 'package:flutter/material.dart';

class FormcardWidget extends StatelessWidget {
  final Widget child;
const FormcardWidget({ Key? key, required this.child }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2)
          )
        ]
      ),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: child,
      ),
    );
  }
}
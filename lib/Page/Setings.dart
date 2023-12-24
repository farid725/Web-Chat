import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.orangeAccent,
        child: const Center(
            child: Text('Page 3',style: TextStyle(color: Colors.blue,fontSize: 65),),
        ),
    );
  }
}

import 'package:flutter/material.dart';
class Score extends StatefulWidget {
  const Score({Key? key}) : super(key: key);

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.red,
              margin: EdgeInsets.all(30),
              child: TextButton(
                onPressed: (){

                },
                child: Text('Restart',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,letterSpacing:2),),
              ),
            ),
            Container(
              margin: EdgeInsets.all(30),
              color: Colors.red,
              child: TextButton(
                onPressed: (){

                },
                child: Text('Restart',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,letterSpacing:2),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

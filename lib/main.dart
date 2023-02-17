import 'package:flutter/material.dart';
import 'package:quiz_dey/quizbrain.dart';
Quizbrain quizBrain = Quizbrain();
void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: SafeArea(
       child: Quiz()
     ),
    );
  }
}
class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Icon> scorekeeper=[];

  // List<String> question=[
  //   'You can lead cow down stairs but not up stairs .',
  //   'Approximately one quater of human bones are in feet .',
  //   'A slug\'s blood is green ?',
  // ];
  // List<bool> ans =[
  //   false,
  //   true,
  //   true
  // ];
  // Here first Question is object of class or datatype of q1 and second is constructor of Question type
  // Question q1 = Question(q: 'You can lead cow down stairs but not up stairs .',a: false);
  // List<Question>questionBank =[
  //   Question('You can lead cow down stairs but not up stairs.',false),
  //   Question('Approximately one quater of human bones are in feet .',true ),
  //   Question('A slug\'s blood is green ?', true),
  // ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black54,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child:Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30,left: 10,right: 10),
                    child: Container(child: Text(
                      quizBrain.getQuestionText(),
                      style: TextStyle(color: Colors.white,wordSpacing:2,fontSize: 22 ),
                    ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                  child:Container(
                    margin: EdgeInsets.all(20),
                    color: Colors.green,
                    child: TextButton(
                      onPressed: (){
                        setState(() {
                          bool? answer=quizBrain.getQuestionAns();
                          if(answer==true){
                            scorekeeper.add(
                              Icon(Icons.check,color: Colors.green,size: 30,),
                            );
                          }
                          else{
                            scorekeeper.add(
                              Icon(Icons.close,color: Colors.red,size: 30,),
                            );
                          }
                          quizBrain.NextQuestionNum();
                          if(quizBrain.isFinished()){
                            quizBrain.reset();
                            scorekeeper.clear();

                          }
                        });
                      },
                      child: Text('TRUE',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,letterSpacing:2),),
                    ),
                  )
              ),
              Expanded(
                  flex: 1,
                  child:Container(
                    margin: EdgeInsets.all(20),
                    color: Colors.red,
                    child: TextButton(
                      onPressed: (){
                        setState(() {
                          bool? answer=quizBrain.getQuestionAns();
                          if(answer==false){
                            scorekeeper.add(
                              Icon(Icons.check,color: Colors.green,size: 30,),
                            );
                          }
                          else{
                            scorekeeper.add(
                              Icon(Icons.close,color: Colors.red,size: 30,),
                            );
                          }
                          quizBrain.NextQuestionNum();
                          if(quizBrain.isFinished()){
                            quizBrain.reset();
                          }
                        });
                      },
                      child: Text('FALSE',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,letterSpacing:2),),
                    ),
                  )
              ),
              Expanded(
                flex: 1,
                  child: Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    child:Row(
                      children:scorekeeper,
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}


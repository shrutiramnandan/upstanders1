// import 'package:flutter/material.dart';
// import 'package:upstanders/global/model/quiz_model.dart';
// import 'package:upstanders/global/theme/colors.dart';
// import 'package:upstanders/quiz/quiz.dart';
// import 'package:upstanders/quiz/result.dart';


// class StartQuizScreen extends StatefulWidget {
//   @override
//   _StartQuizScreenState createState() => _StartQuizScreenState();
// }

// class _StartQuizScreenState extends State<StartQuizScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final _questions = const [
//     {
//       'questionText': 'Q1. Who created Flutter?',
//       'answers': [
//         {'text': 'Facebook', 'score': -2},
//         {'text': 'Adobe', 'score': -2},
//         {'text': 'Google', 'score': 10},
//         {'text': 'Microsoft', 'score': -2},
//       ],
//     },
//     {
//       'questionText': 'Q2. What is Flutter?',
//       'answers': [
//         {'text': 'Android Development Kit', 'score': -2},
//         {'text': 'IOS Development Kit', 'score': -2},
//         {'text': 'Web Development Kit', 'score': -2},
//         {
//           'text':
//               'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
//           'score': 10
//         },
//       ],
//     },
//     {
//       'questionText': ' Q3. Which programing language is used by Flutter',
//       'answers': [
//         {'text': 'Ruby', 'score': -2},
//         {'text': 'Dart', 'score': 10},
//         {'text': 'C++', 'score': -2},
//         {'text': 'Kotlin', 'score': -2},
//       ],
//     },
//     {
//       'questionText': 'Q4. Who created Dart programing language?',
//       'answers': [
//         {'text': 'Lars Bak and Kasper Lund', 'score': 10},
//         {'text': 'Brendan Eich', 'score': -2},
//         {'text': 'Bjarne Stroustrup', 'score': -2},
//         {'text': 'Jeremy Ashkenas', 'score': -2},
//       ],
//     },
//     {
//       'questionText':
//           'Q5. Is Flutter for Web and Desktop available in stable version?',
//       'answers': [
//         {
//           'text': 'Yes',
//           'score': -2,
//         },
//         {'text': 'No', 'score': 10},
//       ],
//     },
//   ];
  
//   var _questionIndex = 0;
//   var _totalScore = 0;
  
//   void _resetQuiz() {
//     setState(() {
//       _questionIndex = 0;
//       _totalScore = 0;
//     });
//   }
  
//   void _answerQuestion(int score) {
//     _totalScore += score;
  
//     setState(() {
//       _questionIndex = _questionIndex + 1;
//     });
//     print(_questionIndex);
//     if (_questionIndex < _questions.length) {
//       print('We have more questions!');
//     } else {
//       print('No more questions!');
//     }
//   }
  
//     return  Scaffold(
//         appBar: AppBar(
//           title: Text('Geeks for Geeks'),
//           backgroundColor: Color(0xFF00E676),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: _questionIndex < _questions.length
//               ? Quiz(
//                   answerQuestion: _answerQuestion,
//                   questionIndex: _questionIndex,
//                   questions: _questions,
//                 ) //Quiz
//               : Result(_totalScore, _resetQuiz),
//         ), //Padding
//       );
//   }
// }




// class BeginQuizScreen extends StatefulWidget {
//   @override
//   _BeginQuizScreenState createState() => _BeginQuizScreenState();
// }

// class _BeginQuizScreenState extends State<BeginQuizScreen> {
//   int index = 0;
//   int answers =0;
//    int _groupValue = -1;

//   List<QuizModel> q = [
//     QuizModel(
//       quest: "Who created Flutter?",
//       opt1: "Facebook",
//       opt2: "Adobe",
//       opt3: "Google",
//       opt4: "Microsoft",
//       opt5: "Others",
//       rightAnswer: "Google"
//     ),
//     QuizModel(
//       quest: "Who created Flutter?",
//       opt1: "Facebook",
//       opt2: "Adobe",
//       opt3: "Google",
//       opt4: "Microsoft",
//       opt5: "Others",
//       rightAnswer: "Google"
//     ),
//     QuizModel(
//       quest: "Who created Flutter?",
//       opt1: "Facebook",
//       opt2: "Adobe",
//       opt3: "Google",
//       opt4: "Microsoft",
//       opt5: "Others",
//       rightAnswer: "Google"
//     ),
//     QuizModel(
//       quest: "Who created Flutter?",
//       opt1: "Facebook",
//       opt2: "Adobe",
//       opt3: "Google",
//       opt4: "Microsoft",
//       opt5: "Others",
//       rightAnswer: "Google"
//     ),
//     QuizModel(
//       quest: "Who created Flutter?",
//       opt1: "Facebook",
//       opt2: "Adobe",
//       opt3: "Google",
//       opt4: "Microsoft",
//       opt5: "Others",
//       rightAnswer: "Google"
//     ),
//   ];
//   //  final _questions =  [
//   //   {
//   //     "questionText": ' Who created Flutter?',
//   //     "options": [
//   //       {"op1": "Facebook", "isRight": false},
//   //       {"op2": "Adobe", "isRight": false},
//   //       {'op3': "Google", "isRight": true},
//   //       {'op4': "Microsoft", "isRight": false},
//   //       {'op5': "Others", "isRight": false},
//   //     ],
//   //   },
//   //   {
//   //     "questionText": ' Who created Flutter?',
//   //     "options": [
//   //       {"op1": "Facebook", "isRight": false},
//   //       {"op2": "Adobe", "isRight": false},
//   //       {'op3': "Google", "isRight": true},
//   //       {'op4': "Microsoft", "isRight": false},
//   //       {'op5': "Others", "isRight": false},
//   //     ],
//   //   },
//   //   {
//   //     "questionText": ' Who created Flutter?',
//   //     "options": [
//   //       {"op1": "Facebook", "isRight": false},
//   //       {"op2": "Adobe", "isRight": false},
//   //       {'op3': "Google", "isRight": true},
//   //       {'op4': "Microsoft", "isRight": false},
//   //       {'op5': "Others", "isRight": false},
//   //     ],
//   //   },
//   //   {
//   //     "questionText": ' Who created Flutter?',
//   //     "options": [
//   //       {"op1": "Facebook", "isRight": false},
//   //       {"op2": "Adobe", "isRight": false},
//   //       {'op3': "Google", "isRight": true},
//   //       {'op4': "Microsoft", "isRight": false},
//   //       {'op5': "Others", "isRight": false},
//   //     ],
//   //   },
//   //   {
//   //     "questionText": ' Who created Flutter?',
//   //     "options": [
//   //       {"op1": "Facebook", "isRight": false},
//   //       {"op2": "Adobe", "isRight": false},
//   //       {'op3': "Google", "isRight": true},
//   //       {'op4': "Microsoft", "isRight": false},
//   //       {'op5': "Others", "isRight": false},
//   //     ],
//   //   },
//   //   // {
//   //   //   'questionText': 'Q2. What is Flutter?',
//   //   //   'options': [
//   //   //     {'text': 'Android Development Kit', 'isRight': false},
//   //   //     {'text': 'IOS Development Kit', 'isRight': false},
//   //   //     {'text': 'Web Development Kit', 'isRight': false},
//   //   //     {
//   //   //       'text':
//   //   //           'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
//   //   //       'isRight': true
//   //   //     },
//   //   //   ],
//   //   // },
//   //   // {
//   //   //   'questionText': ' Q3. Which programing language is used by Flutter',
//   //   //   'options': [
//   //   //     {'text': 'Ruby', 'isRight': false},
//   //   //     {'text': 'Dart', 'isRight': true},
//   //   //     {'text': 'C++', 'isRight': false},
//   //   //     {'text': 'Kotlin', 'isRight': false},
//   //   //   ],
//   //   // },
//   //   // {
//   //   //   'questionText': 'Q4. Who created Dart programing language?',
//   //   //   'options': [
//   //   //     {'text': 'Lars Bak and Kasper Lund', 'score': true},
//   //   //     {'text': 'Brendan Eich', 'score': false},
//   //   //     {'text': 'Bjarne Stroustrup', 'score': false},
//   //   //     {'text': 'Jeremy Ashkenas', 'score': false},
//   //   //   ],
//   //   // },
//   //   // {
//   //   //   'questionText':
//   //   //       'Q5. Is Flutter for Web and Desktop available in stable version?',
//   //   //   'options': [
//   //   //     {
//   //   //       'text': 'Yes',
//   //   //       'score': false,
//   //   //     },
//   //   //     {'text': 'No', 'score': true},
//   //   //   ],
//   //   // },
//   // ];
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//           child: Scaffold(
//         body:Container(
//           padding: const EdgeInsets.all(10),
//          child: Column(
//               children: [
//                 Text(q[index].quest),
//                 SizedBox(height:20),
//                 Container(
//                   height:40,
//                   child: RadioListTile(
//                     activeColor: MyTheme.primaryColor,
//                     value: 1,
//                     groupValue: _groupValue,
//                     onChanged: (newValue){
                    

//                        onAnswer(q[index].opt1,q[index].rightAnswer,newValue );
                      
//                     },
//                     title: Text(q[index].opt1)
//                     // Text(title, style: TextStyle(fontSize: 15),),
//                   ),
//                 ),


//                  RadioListTile(
//                   activeColor: MyTheme.primaryColor,
//                   value: 2,
//                   groupValue: _groupValue,
//                   onChanged: (newValue){
                  

//                      onAnswer(q[index].opt2,q[index].rightAnswer ,newValue);
                    
//                   },
//                   title: Text(q[index].opt2)
//                   // Text(title, style: TextStyle(fontSize: 15),),
//                 ),



//                  RadioListTile(
//                   activeColor: MyTheme.primaryColor,
//                   value: 3,
//                   groupValue: _groupValue,
//                   onChanged: (newValue){
                 

//                      onAnswer(q[index].opt3,q[index].rightAnswer,newValue );
                    
//                   },
//                   title: Text(q[index].opt3)
//                   // Text(title, style: TextStyle(fontSize: 15),),
//                 ),


//                  RadioListTile(
//                   activeColor: MyTheme.primaryColor,
//                   value: 4,
//                   groupValue: _groupValue,
//                   onChanged: (newValue){
                

//                      onAnswer(q[index].opt4,q[index].rightAnswer ,newValue);
                    
//                   },
//                   title: Text(q[index].opt4)
//                   // Text(title, style: TextStyle(fontSize: 15),),
//                 ),





//                  RadioListTile(
//                   activeColor: MyTheme.primaryColor,
//                   value: 5,
//                   groupValue: _groupValue,
//                   onChanged: (newValue){
                   

//                      onAnswer(q[index].opt5,q[index].rightAnswer,newValue );
                    
//                   },
//                   title: Text(q[index].opt5)
//                   // Text(title, style: TextStyle(fontSize: 15),),
//                 ),
//                 // InkWell(
//                 //    onTap: (){
                     
//                 //      onAnswer(q[index].opt1,q[index].rightAnswer );
//                 //    },
//                 //    child: Container(
//                 //      color: MyTheme.blue,
//                 //       alignment: Alignment.center,
//                 //      height: 20,
//                 //      width: MediaQuery.of(context).size.width *0.9,
//                 //      child: Text(q[index].opt1))),
//                 // SizedBox(height:8),
//                 //   InkWell(
//                 //    onTap: (){
//                 //      onAnswer(q[index].opt2,q[index].rightAnswer );
//                 //    },
//                 //    child: Container(
//                 //      color: MyTheme.blue,
//                 //       alignment: Alignment.center,
//                 //         height: 20,
//                 //      width: MediaQuery.of(context).size.width *0.9,
//                 //      child: Text(q[index].opt2))),
//                 // SizedBox(height:8),
//                 //   InkWell(
//                 //    onTap:(){
//                 //       onAnswer(q[index].opt3,q[index].rightAnswer );
//                 //    },
//                 //    child: Container(
//                 //      color: MyTheme.blue,
//                 //       alignment: Alignment.center,
//                 //         height: 20,
//                 //      width: MediaQuery.of(context).size.width *0.9,
//                 //      child: Text(q[index].opt3))),
//                 // SizedBox(height:8),
//                 //   InkWell(
//                 //    onTap:(){
//                 //      onAnswer(q[index].opt4,q[index].rightAnswer );
//                 //    },
//                 //    child: Container(
//                 //      color: MyTheme.blue,
//                 //       alignment: Alignment.center,
//                 //         height: 20,
//                 //      width: MediaQuery.of(context).size.width *0.9,
//                 //      child: Text(q[index].opt4))),
//                 // SizedBox(height:8),
//                 //   InkWell(
                    
//                 //    onTap:(){
//                 //      onAnswer(q[index].opt5,q[index].rightAnswer );
//                 //    },
//                 //    child: Container(
//                 //      color: MyTheme.blue,
//                 //       alignment: Alignment.center,
//                 //         height: 20,
//                 //      width: MediaQuery.of(context).size.width *0.9,
//                 //      child: Text(q[index].opt5))),
//               ],
//             )
//           ),
//           bottomNavigationBar: InkWell(
//             onTap: (){
//               print("answers:$answers");
//               print("QUESTION LENGTTH:::::::${q.length}");
//               if(index ==q.length-1){
//                 if(answers ==q.length){
//                   print("You have Answered all Questions");

//                 }else{
//                     print("try again");

//                 }

//               }else{
//                 if(index >=0 && index< q.length){
//                   setState(() {
//                     index ++; 
//                     _groupValue =-1;
//                   });
//                 }
                
//               }
             
//             },
//             child: Container(
//               alignment: Alignment.center,
//               color: MyTheme.primaryColor,
//               height: 40,
//               child: Text(index == 4?"CONTINUE":"NEXT"),
//             )),
        
//       ),
//     );
//   }
//   onAnswer(String predictAnswer,String correctAnswer, int newValue){
//     print("predictAnswer predictAnswer predictAnswer:$predictAnswer $correctAnswer");
//     setState(() {
//      _groupValue  = newValue;
//       if(predictAnswer == correctAnswer ){
//         answers++;
    
//     }
      
//     });
    
//   }
// }


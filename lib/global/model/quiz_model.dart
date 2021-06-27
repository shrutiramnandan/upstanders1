
// class QuizModel{
//   String video;
//   String quest;
//   String opt1;
//    String opt2;
//     String opt3;
//      String opt4;
//       String opt5;
//   String rightAnswer;
 
//   QuizModel({this.video,this.quest, this.opt1, this.opt2, this.opt3, this.opt4, this.opt5, this.rightAnswer});

// }


class QuizModel{
  String video;
   List<Quiz> quiz ;
 
  QuizModel({this.video,this.quiz, });

}



class Quiz{
  String quest;
  // String opt1;
  //  String opt2;
  //   String opt3;
  //    String opt4;
  //     String opt5;
  List<String> options;
  String rightAnswer;

  Quiz({this.quest,this.options, this.rightAnswer});

}
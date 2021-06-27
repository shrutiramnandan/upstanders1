import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:upstanders/global/model/quiz_model.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'package:upstanders/global/widgets/buttons.dart';
import 'package:upstanders/global/widgets/question_dialog_box.dart';
import 'package:upstanders/home/view/right_on-screen.dart';
import 'package:upstanders/home/view/uh_oh_screen.dart';
import 'package:upstanders/videos/view/video_streaming_screen2.dart';
import 'package:video_player/video_player.dart';

class VideosStreamingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: MyTheme.primaryColor,
          automaticallyImplyLeading: false,
          title: Text(
            "WATCH VIDEO AND MCQ",
            style: TextStyle(
              color: MyTheme.secondryColor,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: MyTheme.secondryColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        backgroundColor: MyTheme.secondryColor,
        body: VideoFormm());
  }
}

class VideoFormm extends StatefulWidget {
  @override
  _VideoFormmState createState() => _VideoFormmState();
}

class _VideoFormmState extends State<VideoFormm> {
  int indexx = 0;
   int index = 0;
  int answers = 0;
  int _groupValue = -1;
  final scrollDirection = Axis.horizontal;

  AutoScrollController controller;

  List<QuizModel> q = [
    //1.
    QuizModel(
        video: 'assets/videos/VID2.mp4',
        quiz: [
          Quiz(
            quest: "What is consent?",
            rightAnswer: "An agreement to engage in a specific activity that is informed and freely given.",
             options: [
               "An agreement to engage in a specific activity that is informed and freely given.",
               "A nod without eye contact - if it looks like consent it’s consent.",
               "Silence - if they don’t say no it probably means they’re OK."
             ]
          ),
          Quiz(
            quest: "Consent applies to",
            rightAnswer: "every aspect of life",
             options: [
               "Sex",
               "Sports",
               "every aspect of life"
             ]
          ),
           Quiz(
            quest: "Here are 3 statements about “no”. Which is true?",
            rightAnswer: "People who learn to say and accept “no” can build more authentic and safe relationships.",
             options: [
               "You can’t ever learn to accept a “no”, it’s too hard.",
               "People who learn to say and accept “no” can build more authentic and safe relationships.",
               "Only weak people accept “no” without challenging it."
             ]
          ),
           
          Quiz(
            quest: "When someone says no to me, my reaction is important. Which one is true?",
            rightAnswer: "It’s my responsibility to ensure that my reaction does not hurt others.",
             options: [
               "It’s my responsibility to ensure that my reaction does not hurt others.",
               "If I get angry it’s their fault.",
               "It’s OK to challenge the “no” until I get a yes."
             ]
          ),
           Quiz(
            quest: "I  have power over someone, what does it change about consent:",
            rightAnswer: "Both.",
             options: [
               "I need to be extra careful that consent is given freely.",
               "They might be scared to say no.",
               "Both."
             ]
          ),
        ]
      ),

    //2.
    QuizModel(
        video: 'assets/videos/VID2.mp4',
        quiz: [
          Quiz(
            quest: "You just arrived on the scene for a “Discreet Alert”. What’s the one thing you should NOT do:",
            rightAnswer: "Announce you come to help after an alert.",
             options: [
               "Check how many people are involved, and if the situation has been escalating.",
               "Announce you come to help after an alert.",
               "Make sure this isn’t an Urgent Situation."
             ]
          ),
          Quiz(
            quest: "”Distract & disrupt” means which of the following",
            rightAnswer: "Create a situation to separate the alerter and the harm doer, without mentioning the alert.",
             options: [
               "Create a scene big enough to disrupt everyone in the immediate area.",
               "Create a situation to separate the alerter and the harm doer, without mentioning the alert.",
               "Aggressively interrogate the harm doer while waving at the alerter to leave."
             ]
          ),
          Quiz(
            quest: "Out of the following, which are ways you can help the alerter?",
            rightAnswer: "All of the above.",
             options: [
               "Engaging in conversation with the alerter, without mentioning the alert.",
               "Ask for one of them to help on a problem you pretend to have.",
               "Whisper while giving a hug or make eye contact and mouth: “are you ok?",
               "All of the above."
             ]
          ),
           
          Quiz(
            quest: "To “stabilize the situation” what do you do before leaving?",
            rightAnswer: "Ensure that the harm doer and the alerter will not be back into the same situation in the next hours.",
             options: [
               "Give the alerter suggestions on how to avoid risks for next time.",
               "Ensure that the harm doer and the alerter will not be back into the same situation in the next hours.",
               "Have the person stay at your house until you feel it’s safe for them to go home."
             ]
          ),
           Quiz(
            quest: "When it comes to maintaining accountability, which statement is wrong?",
            rightAnswer: "You should always report to the authorities yourself after responding to an alert.",
             options: [
               "The alerter should make their own decision on whether to report to the authorities.",
               "You should always report to the authorities yourself after responding to an alert.",
               "If someone is in immediate physical danger, you should call for help."
             ]
          ),
        ]
      ),

    //3.
   QuizModel(
        video: 'assets/videos/VID2.mp4',
        quiz: [
          Quiz(
            quest: "If someone started an “urgent” alert, it means:",
            rightAnswer: "You can intervene openly, acknowledging that something wrong is happening.",
             options: [
               "You need to call for backup and arrive ONLY when that is secured.",
               "You can intervene openly, acknowledging that something wrong is happening.",
               "When you arrive you need to make sure you approach unseen."
             ]
          ),
          Quiz(
            quest: "What is the best way to get support on site:",
            rightAnswer: "Involve passersby and give them clear tasks: ask someone to call for help, someone to back you up as you engage a conversation.",
             options: [
               "Yell our commands and hope someone will do it.",
               "You need to be able to do everything yourself.",
               "Involve passersby and give them clear tasks: ask someone to call for help, someone to back you up as you engage a conversation."
             ]
          ),
          Quiz(
            quest: "What is the best way to get support before arriving on the scene?",
            rightAnswer: "Check the location of other Upstanders who took on the alert in the app, and group text them.",
             options: [
               "Check the location of other Upstanders who took on the alert in the app, and group text them.",
               "Call people you know to have your back and meet you on site.",
               "Gather people to help while you head over to the scene.",
               
             ]
          ),
           
          Quiz(
            quest: "What’s the best way to help and stay accountable:",
            rightAnswer: "Separate the parties, make sure the alerter is OK, provide more help only if they ask.",
             options: [
               "Separate the parties, make sure the alerter is OK, provide more help only if they ask.",
               "Take action against the harm doer, ensure a police report is filed.",
               "Take the alerter to the police or to your home for protection."
             ]
          ),
           Quiz(
            quest: "The objective of your intervention is to",
            rightAnswer: "Separate the harm doer and the alerter, as quietly as possible.",
             options: [
               "Get there fast and make a scene so the harm doer is ashamed.",
               "Separate the harm doer and the alerter, as quietly as possible.",
               "Keep the harm doer in check until the police arrives."
             ]
          ),
        ]
      ),

      //4.
    QuizModel(
        video: 'assets/videos/VID2.mp4',
        quiz: [
          
          Quiz(
            quest: "How do you provide immediate emotional support?",
            rightAnswer: "Listen actively to what they feel like sharing,  don’t pry,  don’t pass judgement.",
             options: [
               "Ask as many questions as you can, so you understand everything that happened.",
               "Listen actively to what they feel like sharing,  don’t pry,  don’t pass judgement.",
               "Invest all of your free time into this person without asking if they want or need it.",
               
             ]
          ),
           
          Quiz(
            quest: "Your ability to support other people increases with",
            rightAnswer: "Practice and reflection about your own experiences.",
             options: [
               "Practice and reflection about your own experiences.",
               "School and high test scores.",
               "The kind of experiences you had when you were a child."
             ]
          ),
           Quiz(
            quest: "After helping in an alert, what should you always do?",
            rightAnswer: "Ensure the person is safe to be on their own.",
             options: [
               "Ask for the contact details of the alerter, and check on them after 24h.",
               "Ensure the person is safe to be on their own.",
               "Convince them to report to the authorities."
             ]
          ),

          Quiz(
            quest: "Which phrase can you use to support someone after an alert?",
            rightAnswer:"“What happened was not your fault, I’m here to help.“",
             options: [
               "“What happened was not your fault, I’m here to help.“",
               "“It’s better to dress more modestly, it would not happen.“",
               "“It’s not that bad, it happens all the time.“"
             ]
          ),
          Quiz(
            quest: "When you support someone, how you behave is important. Which statement is true?",
            rightAnswer: "You should not hug or touch someone without ensuring they want it.",
             options: [
               "You should not make eye contact.",
               "You should not hug or touch someone without ensuring they want it.",
               "You should immediately focus on taking action against the harm doer."
             ]
          ),
        ]
      ),


     
    
  ];

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < q[indexx].quiz.length; i++) {
      list.add(i == index ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 10.0,
      width: isActive ? 10.0 : 10.0,
      decoration: BoxDecoration(
          color: isActive ? Colors.black : MyTheme.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          border: Border.all(color: MyTheme.black)),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      showVideo(q[0].video);
     
    });

    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);
  }

  showVideo(String videoAsset){
     showGeneralDialog(
        barrierLabel: "Barrier",
        barrierDismissible: false,
        barrierColor: MyTheme.black,
        transitionDuration: Duration(milliseconds: 700),
        context: context,
        pageBuilder: (_, __, ___) {
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
                margin: EdgeInsets.only(
                  top: 85,
                ),
                child: Stack(
                  children: [
                    VideoDialogBox(videoAsset: videoAsset ),
                  ],
                )),
          );
        },
        transitionBuilder: (_, anim, __, child) {
          return SlideTransition(
            position:
                Tween(begin: Offset(0, -1), end: Offset(0, 0)).animate(anim),
            child: child,
          );
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    print("length of quiz:${q.length}");
    print("length of question of per quiz:${q[indexx].quiz.length}");
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.01),
                videosList(),
                SizedBox(height: size.height * 0.01),
                Text(" MCQ",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: MyTheme.white)),
                SizedBox(height: size.height * 0.01),
                MCQDialogBox(
                    question: q[indexx].quiz[index].quest,
                    indicator: _buildPageIndicator(),
                    count: index,
                    optionsList: optionsList())
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: RoundedBorderTextButton(
              fontSize: 18,
              title: index ==q[indexx].quiz.length-1 ? "SUBMIT" : "NEXT", //indexx
              height: size.height * 0.08,
              width: size.width,
              bgColor: MyTheme.primaryColor,
              textColor: MyTheme.secondryColor,
              onTap:
               index == q[indexx].quiz.length - 1 
                  ? ()async {
                    print("true");
                      if (answers == q[indexx].quiz.length) {
                        
                        if(indexx <q.length-1){
                          setState(() {
                            indexx++; 
                            index= 0;
                            answers =0;
                            _groupValue = -1;
                           
                          });
                           await controller.scrollToIndex(indexx,
                              preferPosition: AutoScrollPosition.begin);
                              showVideo(q[indexx].video);
                           
                        }else{
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RightOnScreen()));

                        }
                        
                      } else {
                       navigateToUhOhScreen();
                      }
                    }
                  : 
                  () async {
                     print("next upp${q.length} ${q[indexx].quiz.length}");
                      if (index < q[indexx].quiz.length-1) { 
                        print("next");
                        setState(() {
                          index++; 
                          _groupValue = -1;
                        });
                      }
                      
                    },
              borderColor: MyTheme.primaryColor,
              borderRadius: 0,
            ),
          )
        ],
      ),
    );
  }
  navigateToUhOhScreen()async{
    var result= await  Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UHOHScreen()));
    print("resultresultresult:$result");
    if(result){
      await controller.scrollToIndex(indexx,
      preferPosition: AutoScrollPosition.begin);
      showVideo(q[indexx].video);
     setState(() {
      index =0; 
      answers =0;
      _groupValue = -1;
    });
    }
  }

  optionsList(){
    return ListView.builder(
      itemCount: q[indexx].quiz[index].options.length,
      itemBuilder: (context, i){
        return Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: RadioListTile(
                activeColor: MyTheme.primaryColor,
                value: i,
                groupValue: _groupValue,
                onChanged: (newValue) {
                  onAnswer(q[indexx].quiz[index].options[i], q[indexx].quiz[index].rightAnswer, newValue);
                },
                title:  Text( q[indexx].quiz[index].options[i])
                
            ),
          );

      },
    );
  }


  onAnswer(String predictAnswer, String correctAnswer, int newValue) {
    setState(() {
      _groupValue = newValue;
      if (predictAnswer == correctAnswer) {
        answers++;
      }
    });
  }

  videosList() {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.22,
      child: ListView(
        controller: controller,
        padding: const EdgeInsets.all(0),
        scrollDirection: Axis.horizontal,
        children: List.generate(q.length, (index) {
          return _videoComponent(index);
        }).toList(),
      ),
    );
  }

  Widget _videoComponent(
    int index,
  ) {
    final size = MediaQuery.of(context).size;
    return _wrapScrollTag(
      index: index,
      child: Container(
          margin: const EdgeInsets.only(right: 10, left: 10),
          color: MyTheme.white,
          alignment: Alignment.center,
          height: size.height * 0.33,
          width: size.width * 0.95,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
              ),
              Container(
                alignment: Alignment.center,
                color: MyTheme.black38,
                height: size.height * 0.33,
                width: size.width,
                child: InkWell(
                  onTap: () {
                    showGeneralDialog(
                      barrierLabel: "Barrier",
                      barrierDismissible: false,
                      barrierColor: Colors.black.withOpacity(0.5),
                      transitionDuration: Duration(milliseconds: 700),
                      context: context,
                      pageBuilder: (_, __, ___) {
                        return Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            margin: EdgeInsets.only(
                              top: 85,
                            ),
                            child: VideoDialogBox(
                              videoAsset: q[index].video,
                            ),
                          ),
                        );
                      },
                      transitionBuilder: (_, anim, __, child) {
                        return SlideTransition(
                          position:
                              Tween(begin: Offset(0, -1), end: Offset(0, 0))
                                  .animate(anim),
                          child: child,
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: MyTheme.primaryColor),
                    child: Icon(
                      Icons.play_arrow,
                      size: 40,
                      color: MyTheme.white,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget _wrapScrollTag({int index, Widget child}) => AutoScrollTag(
        key: ValueKey(index),
        controller: controller,
        index: index,
        child: child,
        highlightColor: Colors.black.withOpacity(0.1),
      );
}

class VideoDialogBox extends StatelessWidget {
  final String videoAsset;

  const VideoDialogBox({Key key, this.videoAsset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      color: MyTheme.black38,
      height: size.height * 0.38,
      width: size.width,
      child: Material(
        child: Video(
          videoAsset: videoAsset,
        ),
      ),
    );
  }
}

class Video extends StatefulWidget {
  final String videoAsset;

  const Video({Key key, this.videoAsset}) : super(key: key);
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> with SingleTickerProviderStateMixin {
  VideoPlayerController _controller;
  AnimationController aniController;

  @override
  void initState() {
    super.initState();
    aniController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
      reverseDuration: Duration(milliseconds: 400),
    );
    _controller = VideoPlayerController.asset(widget.videoAsset)
      ..initialize().then((_) {
        setState(() {});
      });
      _controller.play();
      aniController.forward();
   
  }

  @override
  void dispose() {
    super.dispose();
    _controller.pause();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        alignment: Alignment.center,
        height: size.height * 0.38,
        width: size.width,
        child: Stack(
          children: [
            _controller.value.isInitialized
                ? Center(
                  child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                )
                : Container(),
            Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();

                    _controller.value.isPlaying
                        ? aniController.forward()
                        : aniController.reverse();
                  });
                },
                child: Container(
                    height: 45,
                    width: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: MyTheme.primaryColor),
                    child: AnimatedIcon(
                      icon: AnimatedIcons.play_pause,
                      progress: aniController,
                      size: 40,
                      color: MyTheme.white,
                    )),
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/icons/cross.png",
                      color: MyTheme.black,
                      height: 20,
                      width: 20,
                    ),
                  ),
                )),
          ],
        ));
  }
}

// class Videos extends StatefulWidget {
//   @override
//   _VideosState createState() => _VideosState();
// }

// class _VideosState extends State<Videos> {
//    List<String> videos =[
//      'assets/videos/samp2.mp4',
//       'assets/videos/samp2.mp4',
//        'assets/videos/samp2.mp4',
//         'assets/videos/samp2.mp4',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Container(
//       height: size.height * 0.22,
//       child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: videos.length,
//           itemBuilder: (context, index) {
//             return Container(
//                 margin: const EdgeInsets.only(right: 10, left: 10),
//                 color: MyTheme.white,
//                 alignment: Alignment.center,
//                 height: size.height * 0.33,
//                 width: size.width * 0.95,
//                 child: Stack(
//                   children: [
//                     Align(
//                       alignment: Alignment.center,
//                     ),
//                     Container(
//                       alignment: Alignment.center,
//                       color: MyTheme.black38,
//                       height: size.height * 0.33,
//                       width: size.width,
//                       child: InkWell(
//                         onTap: () {
//                           showGeneralDialog(
//                             barrierLabel: "Barrier",
//                             barrierDismissible: false,
//                             barrierColor: Colors.black.withOpacity(0.5),
//                             transitionDuration: Duration(milliseconds: 700),
//                             context: context,
//                             pageBuilder: (_, __, ___) {
//                               return  Align(
//                                 alignment: Alignment.topCenter,
//                                 child: Container(

//                                   margin: EdgeInsets.only(top: 85,),
//                                   child:  VideoDialogBox(videoAsset: videos[index],),
//                                 ),
//                               );

//                             },
//                             transitionBuilder: (_, anim, __, child) {
//                               return SlideTransition(
//                                 position:
//                                     Tween(begin: Offset(0, -1), end: Offset(0, 0)).animate(anim),
//                                 child: child,
//                               );
//                             },
//                           );

//                         },
//                         child: Container(
//                           height: 45,
//                           width: 45,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: MyTheme.primaryColor),
//                           child: Icon(
//                             Icons.play_arrow,
//                             size: 40,
//                             color: MyTheme.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ));
//           }),
//     );
//   }
// }

// class VideosForm extends StatelessWidget {
//   final void Function() onNext;
//   final List<Widget> indicator;
//   final String title;
//   final int count;

//   const VideosForm({Key key, this.indicator , this.onNext , this.title , this.count}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Container(
//       height: size.height,
//       child: Stack(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Video(),
//               // SizedBox(height: size.height * 0.01),
//               // Text(" More Videos", style: TextStyle(
//               //    fontWeight: FontWeight.bold,
//               //    fontSize: 14,
//               //   color: MyTheme.white)),
//               SizedBox(height: size.height * 0.01),
//               Videos(),
//               SizedBox(height: size.height * 0.01),
//               Text(" MCQ", style: TextStyle(
//                  fontSize: 14,
//                    fontWeight: FontWeight.bold,
//                 color: MyTheme.white)),
//               SizedBox(height: size.height * 0.01),
//               // Expanded(child: QuestionDialogBox())
//               MCQDialogBox(
//                 indicator: indicator,
//                 count :count

//               )
//             ],
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: RoundedBorderTextButton(
//               fontSize: 18,
//               title: title,
//               height: size.height * 0.08,
//               width: size.width,
//               bgColor: MyTheme.primaryColor,
//               textColor: MyTheme.secondryColor,
//               onTap: onNext,
//               borderColor: MyTheme.primaryColor,
//               borderRadius: 0,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

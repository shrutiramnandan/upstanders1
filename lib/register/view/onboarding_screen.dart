
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'package:upstanders/global/widgets/active_toggle_button.dart';
import 'package:upstanders/global/widgets/dialogs.dart';
import 'package:upstanders/global/widgets/map_sample.dart';
import 'package:upstanders/global/widgets/user_avatar.dart';
import 'package:upstanders/home/view/map_view_screen.dart';
import 'package:upstanders/login/view/view.dart';
import 'package:upstanders/settings/view/view.dart';











class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 7;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;


  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 8.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : MyTheme.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        border: Border.all(color:MyTheme.black)
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.primaryColor,

      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            color: MyTheme.primaryColor
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
             
              Expanded(
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                    // _pageController.animateTo(offset, duration: duration, curve: curve)
                  },
                  children: <Widget>[
                  // OnBoardingWidget1(),
                   OnBoardingWidget(
                     fontSize: size.height * 0.026,
                    asset:"assets/images/1.png",
                    text: "Verify to register. The Upstanders\ncommunity works with real names,\nreal pictures, verified ID only - so\nwe all stay safe!",
                  ),
                  OnBoardingWidget(
                      fontSize: size.height * 0.026,
                    asset:"assets/images/2.png",
                    text: "Uneasy situation? “Discreet”\nalerts users closeby to come help\ndiscreetly: your harm doer won’t\nknow you raised an alert.",
                  ),
                  OnBoardingWidget(
                      fontSize: size.height * 0.027,
                    asset:"assets/images/2.png",
                    text: "Immediate danger or assault?\n“Urgent” will alert users to come\nhelp as fast and directly as\npossible.",
                  ),
                  
                  OnBoardingWidget(
                     fontSize: size.height * 0.027,
                    asset:"assets/images/4.png",
                    text: "Watch the videos to learn how to\nhelp effectively. Once qualified,\nchoose when to be active and\nready to help.",
                  ),
                  OnBoardingWidget(
                      fontSize: size.height * 0.026,
                    asset:"assets/images/5.png",
                    text: "When you receive an alert, choose\nto go or not. Alerter will be notified\nif you go.",
                  ),

                   OnBoardingWidget(
                      fontSize: size.height * 0.027,
                    asset:"assets/images/6.png",
                    text: "When you take an alert, follow\nmap to alerter, see co-helpers,\ngroup chat if needed.",
                  ),

                   GestureDetector(
                     onHorizontalDragUpdate: (details) {  
                          // Note: Sensitivity is integer used when you don't want to mess up vertical drag
                          int sensitivity = 8;
                          if (details.delta.dx > sensitivity) {
                              // Right Swipe
                          } else if(details.delta.dx < -sensitivity){
                             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));
                             
                          }
                      },
                    
                    child: OnBoardingWidget(
                       fontSize: size.height * 0.026,
                      asset:"assets/images/7.png",
                      text: "After alert, report if anything went\nwrong, and access voice recording\nof alert if needed.",
                  ),
                   ),
                  ])),
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator(),
                    ),
                  ),
             
              // _currentPage != _numPages - 1
              //     ? Expanded(
              //         child: Align(
              //           alignment: FractionalOffset.bottomRight,
              //           child: FlatButton(
              //             onPressed: () {
              //               _pageController.nextPage(
              //                 duration: Duration(milliseconds: 500),
              //                 curve: Curves.ease,
              //               );
              //             },
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               mainAxisSize: MainAxisSize.min,
              //               children: <Widget>[
              //                 Text(
              //                   'Next',
              //                   style: TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 22.0,
              //                   ),
              //                 ),
              //                 SizedBox(width: 10.0),
              //                 Icon(
              //                   Icons.arrow_forward,
              //                   color: Colors.white,
              //                   size: 30.0,
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       )
              //     : Text(''),
            ],
          ),
        ),
      ),
      // floatingActionButton:_currentPage == _numPages - 1
      // ?TextButton(
      //   onPressed: (){
      //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));

      //   },
      //    child: Text(
      //           "Next",
      //           textAlign: TextAlign.center,
      //           style: TextStyle(
      //               fontSize: 18,
      //               fontWeight: FontWeight.bold,
      //               color: MyTheme.secondryColor),
      //         ),)
      //         :Container()
     
    );
  }
}


class OnBoardingWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top:30),
      decoration: BoxDecoration(
       
        // borderRadius: BorderRadius.circular(30),
      ),
      child:  ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset("assets/images/onBoarding1.png", )
        // Stack(
        //   children: [
        //     SampleMap(),
        //     Align(
        //       alignment: Alignment(0.9,0.8),
        //       child: InkWell(
        //         onTap: (){
        //         },
        //         child: Image.asset("assets/icons/loc.png", 
        //           height:40, width:40)
        //       ),
        //     ),
        //   ],
        // )
      )
      
      
    );
  }
}

class OnBoardingWidget extends StatelessWidget {
  final double fontSize;
  final String text ;
  final String asset ;

  const OnBoardingWidget({Key key, this.text, this.asset, this.fontSize}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("fontSize fontSize fontSize:$fontSize");
    return Container(
      padding: const EdgeInsets.only(left:15, right:15),
      margin: const EdgeInsets.only(top:30),
      child: Column(
        children: [
          Expanded(
            child: Container(
              
              child: ClipRRect(
                //  border: Border.all(color: MyTheme.black),
               
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: 
                 Container (
                   decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: MyTheme.black),
                    
                     image: DecorationImage(
                       image: AssetImage(asset),  fit: BoxFit.fill)
                   ),

                 ) ,
                 
                // Image.asset(
                //   asset,
                //   // "assets/images/onBoarding2.png",
                //    fit: BoxFit.fill),

                // Stack(
                //   children: [
                //     SampleMap(),
                //     Align(
                //       alignment: Alignment(0.9,0.8),
                //       child: InkWell(
                //         onTap: (){
                //         },
                //         child: Image.asset("assets/icons/loc.png", 
                //           height:40, width:40)
                //       ),
                //     ),
                //   ],
                // )
              )
             
            ),
          ),
          // Container(
          //   height: 60,
          //     decoration: BoxDecoration(
          //       color: MyTheme.black,
          //       borderRadius: BorderRadius.only(
          //         bottomLeft: Radius.circular(30),
          //         bottomRight: Radius.circular(30),
          //       )
          //     ),
          //     child: _rowButton()
          //   ),
            SizedBox(height:10),
            Text(
              text,
                // "Click on 'Discreet' or 'Urgent'\nto trigger an alert, this will\nalert all users nearby",
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.2,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.secondryColor),
              ),
        ],
      ),
      
    );
  }
  _rowButton(){
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: (){},
              child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  
                ),
                gradient: LinearGradient(
                  colors: [ MyTheme.primaryColor, MyTheme.red300,],
                    begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  
                )
              ),
              child:  Text(
                "DISCREET",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.secondryColor),
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: (){},
              child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: MyTheme.red,
                borderRadius: BorderRadius.only(
                  
                  bottomRight: Radius.circular(30),
                )
                
              ),
              child:  Text(
                "URGENT",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.secondryColor),
              ),
            ),
          ),
        ),


    ],);
  }
}
class OnBoardingWidget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:30),
      child: Column(
        children: [
          Expanded(
            child: Container(
             
              child: ClipRRect(
                 borderRadius: BorderRadius.circular(30),
                 child:
                //  Container (
                //    decoration: BoxDecoration(
                //      image: DecorationImage(
                //        image: AssetImage("assets/images/onBoarding3.png"),  fit: BoxFit.cover)
                //    ),

                //  ) ,
                 Image.asset("assets/images/onBoarding3.png", fit: BoxFit.cover),
                //  Stack(
                //    children: [
                //      SampleMap(),

                //      Container(
                //        color: MyTheme.black26,
                //      ),
                //       Align(
                //         alignment: Alignment(0.9,0.8),
                //         child: InkWell(
                //           onTap: (){
                //           },
                //           child: Image.asset("assets/icons/loc.png", 
                //             height:40, width:40)
                //         ),
                //       ),

                //       Align(
                //         alignment: Alignment.center,
                //         child:IllAndIcantDialogBox(
                //         icant: () {  }, 
                //         illgo: () {  }, 
                //         title: 'DISCREET', 
                //          gradient: null,

                //         )
                //       ),

                //       ActiveToggleButton()

                    
                //    ],
                //  ),
               )
            ),
          ),
         
          SizedBox(height:10),
            Text(
                "If you are active, and within'\n500m of an alert you will\nget a request to help",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.secondryColor),
              ),
        ],
      ),
      
    );
  }
  
}
class OnBoardingWidget5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return   Container(
      margin: const EdgeInsets.only(top:30),
      // height: 100,
      // color: MyTheme.white,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30)
          
        ),
        child: Image.asset("assets/images/onBoarding5.png",),
        ),
    );
    Container(
      padding: const EdgeInsets.only(left:25, right:25),

       margin: const EdgeInsets.only(top:30),
      decoration: BoxDecoration(
        // color: MyTheme.red,
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [MyTheme.secondryColor, MyTheme.teal]

        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
           Text(
                "6:40",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 70,
                    // fontWeight: FontWeight.bold,
                    color: MyTheme.white),
              ),
          Text(
                "Thursday,November 30",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                    color: MyTheme.white),
              ),
          SizedBox(height:size.height * 0.07),
          UserAvatar(
            imageUrl: "https://wallpaperaccess.com/full/3957694.jpg", 
            avatarRadius: 100),
             SizedBox(height:size.height * 0.01),
          
           Text(
                "CRYSTAL GASKELL",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.white),
              ),
               SizedBox(height:size.height * 0.02),
           Text(
                "Urgent Alert\n200m away",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.white),
              ),
           SizedBox(height:size.height * 0.1),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               InkWell(
                 onTap: (){},
                  child: Column(
                   children: [
                      Image.asset("assets/icons/circularCross.png", height: 50, width:50,),
                       SizedBox(height:size.height * 0.01),
                      Text(
                        "I CAN'T",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: MyTheme.white)),

                   ],
                 ),
               ),
              
               InkWell(
                 onTap: (){},
                  child: Column(
                   children: [
                     Image.asset("assets/icons/circularDone.png", height: 50, width:50,),
                      SizedBox(height:size.height * 0.01),
                      Text(
                        "I'LL GO",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: MyTheme.white)),

                   ],
                 ),
               ),

             ],
           )

        ]
      )
      
    );
  }
}
class OnBoardingWidget4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      margin: const EdgeInsets.only(top:30),
      // color: MyTheme.white,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft:  Radius.circular(30)
        ),
        child: Image.asset("assets/images/onBoarding4.png",),
        ),
    );
     Container(
      child: Column(
        children:[
          AppBar(
            elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconButton(
                icon:Icon(Icons.arrow_back_ios, color: MyTheme.secondryColor,),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Text(
                "APP PERMISSIONS",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.secondryColor),
              ),
            ],
          )) ,
          Expanded(
            child: Container(
              // height: 100,
              color: MyTheme.white,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft:  Radius.circular(30)
                ),
                child: Image.asset("assets/images/onBoarding4.png", fit: BoxFit.cover),
                ),
            ),
          )

        ]
      ),
       
      
    );
  }
}


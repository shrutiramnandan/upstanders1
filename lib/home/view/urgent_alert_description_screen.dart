import 'package:flutter/material.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'package:upstanders/home/view/map_view_screen2.dart';

class UrgentAlertDescriptionScreen extends StatelessWidget {
  final Widget bottomButton;
  final Widget backButton;

  const UrgentAlertDescriptionScreen({Key key, this.bottomButton, this.backButton}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.white,
      body: Stack(
        children: [
          _Foreground(),
          backButton
          
        ],
      ),
      bottomNavigationBar:bottomButton
     
    
      
    );
    
  }
}

class _Foreground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/logo.png",height: 80, width: 80,),
          SizedBox(height: size.height * 0.01,),

          Text(
            "URGENT ALERT.",
             textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25,
                height: 1.5,
                fontWeight: FontWeight.bold,
                color: MyTheme.black),
          ),
          SizedBox(height: size.height * 0.03,),
          new RichText(
            textAlign: TextAlign.center,
            
            strutStyle:StrutStyle(fontSize: 20,),
            text: new TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                new TextSpan(
                
                  text:"Thank you for responding.\nHere's what to do:\n",
                  style: new TextStyle(color: Colors.black,fontSize: 20, height: 1.4),
                ),
                 new TextSpan(
                  text:"Check you're safe\n",
                  style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20,height: 1.4),
                ),
                new TextSpan(
                  text:"(physically and psychologically).\nget support if needed.\n",
                  style: new TextStyle(color: Colors.black,fontSize: 20,height: 1.4),
                ),
                new TextSpan(
                  text:"Disengage & deescalate\n",
                  style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20,height: 1.4),
                ),
                new TextSpan(
                  text:"Separate the alerter and the\nharm doer, as quietly as possible.\n",
                  style: new TextStyle(color: Colors.black,fontSize: 20,height: 1.4),
                ),
                new TextSpan(
                  text:"Stabilize\n",
                  style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20,height: 1.4),
                ),
                new TextSpan(
                  text:"Make sure everyone is ok and\nknows where to find support.\n",
                  style: new TextStyle(color: Colors.black,fontSize: 20,height: 1.4),
                ),
                new TextSpan(
                  text:"Check your accountability\n",
                  style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20,height: 1.4),
                ),
                 new TextSpan(
                  text:"In case case of immediate danger,\ncall the police. Any other help\nneeds to answer an explicit request.",
                  style: new TextStyle(color: Colors.black,fontSize: 20,height: 1.4),
                ),
               
              ],
            ),
          ),

         


        ],
      ),
      
    );
  }
}

class _BottomButton extends StatelessWidget {
  final void Function() onTap;

  const _BottomButton({Key key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height:size.height * 0.08,
          color: MyTheme.primaryColor,
          child:  Text(
            "CONTINUE",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: MyTheme.black),
          ),

        ),
      ) ;
  }
}
import 'package:flutter/material.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'package:upstanders/home/view/map_view_screen2.dart';

class DiscreetAlertDescriptionScreen extends StatelessWidget {
  final Widget bottomButton;
  final Widget backButton;

  const DiscreetAlertDescriptionScreen({Key key, this.bottomButton, this.backButton}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: MyTheme.white,
        body: Stack(
          children: [
            _Foreground(),
            backButton
            // (context),

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
          Image.asset(
            "assets/images/logo.png",
            height: 80,
            width: 80,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text(
            "DISCREET ALERT.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25,
                height: 1.5,
                fontWeight: FontWeight.bold,
                color: MyTheme.black),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          new RichText(
            textAlign: TextAlign.center,
            strutStyle: StrutStyle(
              fontSize: 20,
            ),
            text: new TextSpan(
              style: DefaultTextStyle.of(context).style,
              // TextStyle(color: Colors.black,fontSize: 20, height: 1.4),

              children: [
                new TextSpan(
                  text: "Thank you for responding.\nHere's what to do:\n",
                  style: new TextStyle(
                      color: Colors.black, fontSize: 20, height: 1.4),
                ),
                new TextSpan(
                  text: "Check safety\n",
                  style: new TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      height: 1.4),
                ),
                new TextSpan(
                  text:
                      "(physical and emotional).\ncheck if things have escalated.\n",
                  style: new TextStyle(
                      color: Colors.black, fontSize: 20, height: 1.4),
                ),
                new TextSpan(
                  text: "Distract Or Disrupt\n",
                  style: new TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      height: 1.4),
                ),
                new TextSpan(
                  text:
                      "Discreetly separate the alerter\nfrom the potential harm doer,\nwithout mentioning the alert.\n",
                  style: new TextStyle(
                      color: Colors.black, fontSize: 20, height: 1.4),
                ),
                new TextSpan(
                  text: "Stabilize\n",
                  style: new TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      height: 1.4),
                ),
                new TextSpan(
                  text:
                      "Make sure everyone is ok and\nknows where to find support.\n",
                  style: new TextStyle(
                      color: Colors.black, fontSize: 20, height: 1.4),
                ),
                new TextSpan(
                  text: "Maintain accountability\n",
                  style: new TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      height: 1.4),
                ),
                new TextSpan(
                  text:
                      "In case of immediate danger,\ncall the police. Any other help\nneeds to answer an explicit request.",
                  style: new TextStyle(
                      color: Colors.black, fontSize: 20, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


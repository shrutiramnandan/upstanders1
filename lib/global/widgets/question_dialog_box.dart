import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:upstanders/global/model/mcq.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'package:upstanders/global/widgets/buttons.dart';
import 'package:upstanders/global/widgets/user_avatar.dart';
import 'package:upstanders/home/view/report_screen.dart';

////MCQ QUESTION DIALOG BOX
class MCQDialogBox extends StatelessWidget {
  final void Function() onContinue;
  final List<Widget>  indicator;
  final int count;
 final String question;
 final Widget optionsList;

  const MCQDialogBox({Key key, this.onContinue, this.indicator, this.count, this.question, this.optionsList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.55,
        margin: EdgeInsets.only(left: 12, right: 12),
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          child: MCQDialogBody(
            count :count,
            indicator:indicator,
            question:question,
            optionsList :optionsList,
            onContinue: onContinue),
        ));
  }
}

class MCQDialogBody extends StatefulWidget {
  final void Function() onContinue;
  final   List<Widget>  indicator;
  final int  count;
  final String question;
  final Widget optionsList;

   MCQDialogBody({Key key, this.onContinue , this. indicator , this.count, this.question, this.optionsList}) : super(key: key);

  @override
  _MCQDialogBodyState createState() => _MCQDialogBodyState();
}

class _MCQDialogBodyState extends State<MCQDialogBody> {
  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        // padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                alignment: Alignment.center,
                height: size.height * 0.20,
                width: size.width,
                decoration: BoxDecoration(
                    color: MyTheme.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           SizedBox(height: size.height * 0.01),
                          Text(
                            widget.question,
                            // "Why do you think it's\nbetter to wait until\nyou're older before\nhaving sex?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22,
                                // height: 1.3,
                                fontWeight: FontWeight.bold,
                                color: MyTheme.secondryColor),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:widget.indicator
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          alignment: Alignment.center,
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: MyTheme.primaryColor,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: MyTheme.black)),
                          child: Text(
                            "${widget.count+1}/5",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: MyTheme.secondryColor),
                          ),
                        ))
                  ],
                )),
          
           Expanded(
             child:  widget.optionsList,
           )
          ],
        ));
  }

  int _groupValue = -1;
  List<MCQ> items =[
    
    MCQ(
      title: "It's against the law of to have sex under 17", 
      option: 1


    ),
    MCQ(
     title:"I don't want to have sex yet", 
      option: 2

    ),
    MCQ(
     title: "I'd prefer not to risk pregnancy and stis",
      option: 3

    ),
    MCQ(
     title:"I want to wait until i'm in a loving relationship",
      option: 4

    ),
    MCQ(
     title:"No-one in my group of friends is having sex ",
      option: 5

    ),
   
  ];
  

  List<Widget> list(){
     List<Widget> widgets = [];
    for(int i =0; i<items.length; i++){
      widgets.add(_myRadioButton(
          title: items[i].title,
          value: items[i].option,
          onChanged: (newValue) => setState(() => _groupValue = newValue),
        ),);

     
    }
   return widgets; 
  }

  Widget _myRadioButton({String title, int value, Function onChanged}) {
    return Container(
      
      height: 40,
      child: RadioListTile(
        // contentPadding: const EdgeInsets.all(0),
        activeColor: MyTheme.primaryColor,
        value: value,
        groupValue: _groupValue,
        onChanged: onChanged,
        title: Text(title, style: TextStyle(fontSize: 15),),
      ),
    );
  }


  
}



///
///
///////QUESTION DIALOG BOX
class QuestionDialogBox extends StatelessWidget {
   final void Function() onSubmit;
   final void Function() onCancel;
   final ReportUser reportUser;
   

  const QuestionDialogBox({Key key, @required this.onSubmit,  @required this.onCancel,@required this.reportUser}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.72,
        margin: EdgeInsets.only(left: 12, right: 12),
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          child: QuestionDialogBody(onCancel: onCancel , onSubmit: onSubmit,reportUser: reportUser),
        ));
  }
}

class QuestionDialogBody extends StatefulWidget {
  final void Function() onSubmit;
   final void Function() onCancel;
    final ReportUser reportUser;

   QuestionDialogBody({Key key,  @required this.onSubmit ,  @required this.onCancel,  @required this.reportUser}) : super(key: key);

  @override
  _QuestionDialogBodyState createState() => _QuestionDialogBodyState();
}

class _QuestionDialogBodyState extends State<QuestionDialogBody> {
  String _initialGroupValue = "Helper assaulted me";

  List<String> _status = [
    "Helper assaulted me", 
    "Helper was not helpful", 
    "Helper made this situation worse",
    "Helper did not respect alert type",
     "Helpee created a false alert",
      "Other (optional text box)",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        // padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        // alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                alignment: Alignment.center,
                height: size.height * 0.1,
                width: size.width,
                decoration: BoxDecoration(
                    color: MyTheme.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        alignment: Alignment.center,
                        height: size.height * 0.1,
                        width: size.width,
                        decoration: BoxDecoration(
                           color: MyTheme.primaryColor,
                           borderRadius: BorderRadius.only(
                             topRight: Radius.circular(20),
                             topLeft: Radius.circular(20),
                           )
                        ),
                        child: ListTile(
                          leading: UserAvatarAsset(
                              avatarRadius: size.height * 0.07,
                              asset:widget.reportUser.image,
                              // imageUrl:
                              //     "https://img.mensxp.com/media/content/2020/Aug/Michele-Morrone-From-365-Days-Floored-Us-With-His-Fashion-Game-1200x900_5f2a761253b66_1200x900.jpeg"
                              ),
                          title: Text(
                            widget.reportUser.name,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: MyTheme.secondryColor),
                          ),
                      ))
                    ),
                    Positioned(
                        top:8,
                        right: 10,
                        child: InkWell(
                          onTap:widget.onCancel,
                          child: Image.asset("assets/icons/cross.png", height: 20, width: 20,)
                        ))
                  ],
                )),
              
          
            SizedBox(height: size.height * 0.01),
            Expanded(
              child:_body(size,  widget.onCancel, widget.onSubmit,)
            )
          ],
        ));
  }

  int _groupValue = -1;
  List<MCQ> items =[
    MCQ(
      title:"Alerter assaulted me", 
      option: 1


    ),
    MCQ(
     title:"Alerter was not helpful", 
      option: 2

    ),
    MCQ(
     title: "Alerter made this situation worse",
      option: 3

    ),
    MCQ(
     title:"Alerter did not respect alert type",
      option: 4

    ),
     MCQ(
     title:"Alerter created a false alert",
      option: 5

    ),
    MCQ(
     title:"Other (optional text box)",
      option: 6

    ),
  ];
  

  List<Widget> list(){
     List<Widget> widgets = [];
    for(int i =0; i<items.length; i++){
      
      widgets.add(_myRadioButton(
          title: items[i].title,
          value: items[i].option,
          onChanged: (newValue) => setState(() => _groupValue = newValue),
        ),);

     
    }
   return widgets; 
  }

  Widget _myRadioButton({String title, int value, Function onChanged}) {
  return Container(
     height: 30,
    child: RadioListTile(
      activeColor: MyTheme.primaryColor,
      value: value,
      groupValue: _groupValue,
      onChanged: onChanged,
      title: Text(title, style: TextStyle(fontSize: 15),),
    ),
  );
}



  _body(Size size, void Function() onCancel,  void Function() onSubmit,){
    return SingleChildScrollView(
      child: Column(
        children: [
          // RadioGroup<String>.builder(
          //   groupValue: _initialGroupValue,
          //   onChanged: (value) => setState(() {
          //     _initialGroupValue = value;
          //   }),
          //   items: _status,
          //   itemBuilder: (item) => RadioButtonBuilder(
          //     item,
          //   ),
          // ),
          // Expanded(
          //   flex: 2,
          //   child: ListView(
          //     children: list(),
          //   ),
          // ),

          Container(
            height:size.height * 0.27,
            child: ListView(
              padding: const EdgeInsets.all(0),
                children: list(),
              ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              textAlign: TextAlign.left,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: "Write text here",
                  border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      )),
                    
                    // contentPadding: const EdgeInsets.only(left:8.0),
                    // border: InputBorder(borderSide: )
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.015),
            Padding(
              padding: const EdgeInsets.only(right:8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RoundedBorderTextButton(
                  textColor: MyTheme.secondryColor,
                  title: "CANCEL",
                  bgColor: MyTheme.white,
                  height: size.height * 0.06,
                  width: size.width * 0.38,
                  onTap: onCancel,
                  borderColor: MyTheme.white,
                  borderRadius: 0,
                  fontSize: 18,
                ),
                SizedBox(width:20),
                 RoundedBorderTextButton(
                  textColor: MyTheme.secondryColor,
                  title: "SUBMIT",
                  bgColor: MyTheme.primaryColor,
                  height: size.height * 0.06,
                  width: size.width * 0.38,
                  onTap: onSubmit,
                  borderColor: MyTheme.primaryColor,
                  borderRadius: 80,
                  fontSize: 18,
                ),
                ],
              ),
            )
        ],
      ),
    );
            
            
  }

  
}


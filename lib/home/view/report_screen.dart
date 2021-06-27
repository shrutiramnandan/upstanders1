import 'package:flutter/material.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'package:upstanders/global/widgets/buttons.dart';
import 'package:upstanders/global/widgets/question_dialog_box.dart';
import 'package:upstanders/global/widgets/user_avatar.dart';
import 'package:upstanders/home/view/report_sent_screen.dart';
import 'package:upstanders/home/view/view.dart';

class ReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyTheme.primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          "REPORT",
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
      body: ReportForm(),
    );
  }
}

class ReportForm extends StatefulWidget {
  @override
  _ReportFormState createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
   List<ReportUser> reportUsers = [
    ReportUser(
      name : "David Elks",
      image:"assets/users/DavidElks.png",
      isReport: false,
    ),
    ReportUser(
      name : "Ashley Judd",
      image:"assets/users/AshleyJudd.png",
      isReport: false,
    ),
     ReportUser(
      name : "Alan Post",
      image:"assets/users/AlanPost.png",
      isReport: false,
    ),
   
     ReportUser(
      name : "Rohit Shah",
      image:"assets/users/RohitShah.png",
      isReport: false,
    ),
     ReportUser(
      name : "Winnie Lu",
      image:"assets/users/WinnieLu.png",
      isReport: false,
    ),
  ];
  int myIndex =0;
  ReportUser selectedUser = ReportUser();
  @override
  Widget build(BuildContext context) {
   
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  width: size.width,
                  alignment: Alignment.center,
                  child: Text(
                      "Select who to report.you can come back to\nthis page to report more than one person",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ),
                Expanded(child: _listItem(
                  
                ))
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RoundedBorderTextButton(
                        title: "FINISH",
                        onTap: () {
                           Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context)=>MapViewScreen()),
                            (route) => false);
      
                          
                           

                        },
                        height: size.height * 0.07,
                        width: size.width * 0.9,
                        textColor: MyTheme.black,
                        fontSize: 18,
                        bgColor: MyTheme.primaryColor,
                        borderRadius: 80,
                        borderColor: MyTheme.primaryColor),
                    RoundedBorderTextButton(
                        title: "CANCEL",
                        fontSize: 18,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        height: size.height * 0.07,
                        width: size.width,
                        textColor: MyTheme.black,
                        bgColor: MyTheme.white,
                        borderRadius: 80,
                        borderColor: MyTheme.white)
                  ],
                ))
          ],
        ));
  }

  _listItem(){
    return Container(
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 100),
        itemCount: reportUsers.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom:8),
            
            child: ListTile(
              
              tileColor:reportUsers[index].isReport ?MyTheme.primaryColor :MyTheme.transparent ,
              contentPadding: EdgeInsets.only(left: 15, right: 8, top:8, bottom: 8),
             
              onTap: () {
                // setState(() {
                // reportUsers[index].isReport = !reportUsers[index].isReport;
                // });

                 setState(() {
                    reportUsers[myIndex].isReport = false;
                    myIndex = index;
                    reportUsers[index].isReport = true;
                    selectedUser =  reportUsers[index];

                    showGeneralDialog(
                      barrierLabel: "Barrier",
                      barrierDismissible: true,
                      barrierColor: Colors.black.withOpacity(0.5),
                      transitionDuration: Duration(milliseconds: 700),
                      context: context,
                      pageBuilder: (_, __, ___) {
                        return Align(
                            alignment: Alignment.center,
                            child:
                            QuestionDialogBox(
                              onSubmit: (){
                                Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => ReportSentScreen()));
                              },
                              reportUser:selectedUser,
                              onCancel: (){
                                Navigator.of(context).pop();
                              },
                            )

                        );
                      },
                      transitionBuilder: (_, anim, __, child) {
                        return SlideTransition(
                          position:
                              Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
                          child: child,
                        );
                      },
                    );
                   
                   
                });

              },
              
              leading: UserAvatarAsset( //UserAvatar
                  asset: reportUsers[index].image,
                  avatarRadius: 50),
              title: Text( reportUsers[index].name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
          );
        },
      ),
    );

  }
}



class ReportUser{
  String name;
  String image;
  bool isReport;
  ReportUser({this.name, this.image, this.isReport});

}

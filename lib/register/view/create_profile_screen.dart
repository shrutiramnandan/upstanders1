import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:upstanders/global/local/local_data_helper.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'package:upstanders/global/widgets/dialogs.dart';
import 'package:upstanders/register/bloc/create_account_bloc.dart';
import 'package:upstanders/register/models/create_account.dart';
import 'package:upstanders/register/view/face_recognition_screen.dart';
import 'package:upstanders/register/view/view.dart';
import 'package:upstanders/register/widgets/build_drop_down_button.dart';
import 'package:upstanders/register/widgets/widgets.dart';

import '../../main.dart';


class CreateProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: MyTheme.secondryColor,
      appBar: AppBar(
        backgroundColor: MyTheme.primaryColor,
        automaticallyImplyLeading: false,
        title: Text("CREATE PROFILE", style: TextStyle(
          color: MyTheme.secondryColor,
        ),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: MyTheme.secondryColor,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: _CreateAccountInputFormScreen()
      // _CreateProfileForm(),
      
    );
  }
}




class _CreateAccountInputFormScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CreateAccountBloc(
          // authenticationRepository:
          //     RepositoryProvider.of<AuthenticationRepository>(context),
        );
      },
      child:  BlocListener<CreateAccountBloc, CreateAccountState>(
          listener: (context, state) {
            if(state.registrationStatus == RegistrationStatus.sentOTP){
              Fluttertoast.showToast(
                  msg: "Otp has been sent over your mobile number .",
                 
              );
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=>VerifyAccountScreen()),);

            }else if(state.registrationStatus == RegistrationStatus.failure){
              print("${state.registrationStatus}");
              Fluttertoast.showToast(
                  msg: "${state.registrationStatus}",
                 
              );

            } 
            // else if(state.registrationStatus == RegistrationStatus.){
            //   print("${state.registrationStatus}");

            // }

            
           
          },
          child: _CreateProfileForm(),
        ) 
      
    );
  }
}





class _CreateProfileForm extends StatefulWidget {
  @override
  __CreateProfileFormState createState() => __CreateProfileFormState();
}

class __CreateProfileFormState extends State<_CreateProfileForm> {
  TextEditingController _firstNameController = TextEditingController();

  TextEditingController _lastNameController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _phoneNumberController = TextEditingController();
  String selectedGender;
  String selecteDob;
  CreateAccount createAccount  = CreateAccount();
  LocalDataHelper localDataHelper = LocalDataHelper();

  
  @override
    void initState() {
      super.initState();
     _addToken();
    }
    _addToken()async{
      var token = await localDataHelper.getStringValue(key: "token");

      createAccount.token = token;
    }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 9,
            child: Container(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
              width: size.width,
              height: size.height,
              color: MyTheme.secondryColor,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title:  Text(
                        "Personal Details",
                        style: TextStyle(
                            color: MyTheme.white,
                           
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "Are you there right now?",
                        style: TextStyle(
                           height: 2,
                            color: MyTheme.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: InkWell(
                        onTap: (){},
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: MyTheme.primaryColor,
                            shape: BoxShape.circle
                          ),
                          child: Icon(Icons.camera_alt, color: MyTheme.secondryColor,),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 10),
                    TextIconButton(
                      onPressed: () {},
                      height: size.height * 0.06,
                      width: size.width,
                      text: "Use my location",
                      buttonColor: MyTheme.primaryColor,
                      childcolor: MyTheme.secondryColor,
                      iconAsset: "assets/icons/location.png",
                    ),
                    SizedBox(height: 25),
                    BuildEditTextField(
                      inputType: TextInputType.text,
                      controller: _firstNameController,
                      hint: "First Name",
                      prefixIconAsset: 'assets/icons/firstName.png',
                      onChanged: (val){
                        createAccount.firstName = val;
                      },
                    ),
                    SizedBox(height: 15),
                    BuildEditTextField(
                      inputType: TextInputType.text,
                      controller: _lastNameController,
                      hint: "Last Name",
                      prefixIconAsset: 'assets/icons/firstName.png',
                      onChanged: (val){
                        createAccount.lastName = val;
                      },
                    ),
                    SizedBox(height: 10),
                    bobAndGender(size),
                    SizedBox(height: 10),
                    BuildEditTextField(
                      inputType: TextInputType.number,
                      controller: _emailController,
                      hint: "Country Code",
                      prefixIconAsset: 'assets/icons/countryCode.png',
                      onChanged: (val){
                        createAccount.countryCode = val;
                      },
                    ),
                    SizedBox(height: 15),
                    BuildEditTextField(
                      inputType: TextInputType.number,
                      controller: _phoneNumberController,
                      hint: "Phone Number",
                      prefixIconAsset: 'assets/icons/phone.png',
                      inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          new LengthLimitingTextInputFormatter(10),
                        
                        ],

                      onChanged: (val){
                        createAccount.phone = val;
                      },
                    ),
                    SizedBox(height: 5),
                    //  SizedBox(height: 10),
                    Text(
                        "Verify your identity",
                        style: TextStyle(
                           height: 2,
                            color: MyTheme.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                     SizedBox(height: 5),
                    TextIconButton(
                      onPressed: () {},
                      height: size.height * 0.06,
                      width: size.width,
                      text: "Click to Verify",
                      buttonColor: MyTheme.primaryColor,
                      childcolor: MyTheme.secondryColor,
                      iconAsset: "assets/icons/camera.png",
                    ),
                     SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          new Expanded(
              child: new Align(
                  alignment: Alignment.bottomCenter,
                  child:_CreateProfileButton(createAccount: createAccount,)))
                  //  _bottomButton(size)
        ],
      ),
    );
  }

 
  bobAndGender(Size size) {
    return Container(
      height: 55,
      width: size.width,
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              // width: size.width * 0.4,
            child: BuildDropDown(
              onSelectItem: (val) {
                setState(() {
                  createAccount.dob = val;
                  selecteDob = val;
                });
              },
              items: ["DOB1", "DOB2", "DOB3"],
              selectedItem: selecteDob,
              category: "DOB",
              widthSize: 50,
              assetPrefixIcon :"assets/icons/DOB.png",
              dropDownWidget: new PopupMenuButton(
                child: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                  ),
                itemBuilder: (_) => <PopupMenuItem<String>>[
                         
                          new PopupMenuItem<String>(
                              child: new Text('12/12/1996'), value: '12/12/1996'),
                           new PopupMenuItem<String>(
                              child: new Text('12/09/1997'), value: '12/09/1997'),

                               new PopupMenuItem<String>(
                              child: new Text('11/10/1996'), value: '11/10/1996'),
                        ],
                onSelected: (val){
                  setState(() {
                  selecteDob = val;
                });
                }
              )

            ),
          ),
          Expanded(
            child: BuildDropDown(
              onSelectItem: (val) {
                setState(() {
                  createAccount.gender = val;
                  selectedGender = val;
                });
              },
              items: [
                "Male",
                "Female",
              ],
              selectedItem: selectedGender,
              category: "Gender",
              widthSize: 50,
              assetPrefixIcon :"assets/icons/gender.png",
              dropDownWidget: new PopupMenuButton(
                child: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                  ),
                itemBuilder: (_) => <PopupMenuItem<String>>[
                         
                          new PopupMenuItem<String>(
                              child: new Text('Male'), value: 'Male'),
                               new PopupMenuItem<String>(
                              child: new Text('Female'), value: 'Female'),
                        ],
                onSelected: (val){
                   setState(() {
                    selectedGender = val;
                  });
                }
              )
            ),
          ),
        ],
      ),
    );
  }

  

  
}




class _CreateProfileButton extends StatelessWidget {
  final CreateAccount createAccount;

  const _CreateProfileButton({Key key, this.createAccount}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size  = MediaQuery.of(context).size;
    return BlocBuilder<CreateAccountBloc, CreateAccountState>(
      // buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.registrationStatus == RegistrationStatus.sendingOTP
            ? _processing(size) 
            : _bottomButton(size, context, createAccount);
           
      },
    );
  }
  _processing(Size size){
    return Container(
      width: size.width,
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }


  _bottomButton(Size size, BuildContext context , CreateAccount createAccount) {
    return InkWell(
      onTap: () {
         context.read<CreateAccountBloc>().add( SendOTP( createAccount));
        
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => VerifyAccountScreen()));
      },
      child: Container(
        alignment: Alignment.center,
        height: size.height * 0.08,
        decoration: BoxDecoration(
          color: MyTheme.primaryColor,
        ),
        child: Text(
          "CREATE PROFILE",
          style: TextStyle(
              color: MyTheme.secondryColor,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
    );
  }


}
